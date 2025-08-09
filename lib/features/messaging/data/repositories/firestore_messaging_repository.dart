import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';

import '../../domain/entities/message.dart';
import '../../domain/repositories/messaging_repository.dart';
import '../../../../core/error/result.dart';

class FirestoreMessagingRepository implements MessagingRepository {
  static final Logger _logger = Logger('FirestoreMessagingRepository');

  final FirebaseFirestore _firestore;

  FirestoreMessagingRepository({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference get _chatRoomsCollection =>
      _firestore.collection('chat_rooms');

  CollectionReference get _messagesCollection =>
      _firestore.collection('messages');

  @override
  Future<Result<ChatRoom>> createChatRoom({
    required String bookingId,
    required String ownerId,
    required String sitterId,
  }) async {
    try {
      final chatRoomId = _chatRoomsCollection.doc().id;
      final now = DateTime.now();

      final chatRoom = ChatRoom(
        id: chatRoomId,
        bookingId: bookingId,
        ownerId: ownerId,
        sitterId: sitterId,
        status: ChatRoomStatus.active,
        createdAt: now,
        updatedAt: now,
      );

      await _chatRoomsCollection.doc(chatRoomId).set(chatRoom.toFirestore());

      _logger.info('Created chat room: $chatRoomId for booking: $bookingId');
      return Result.success(chatRoom);
    } catch (e) {
      _logger.severe('Failed to create chat room: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to create chat room: $e'));
    }
  }

  @override
  Future<Result<ChatRoom>> getChatRoom(String chatRoomId) async {
    try {
      final doc = await _chatRoomsCollection.doc(chatRoomId).get();

      if (!doc.exists) {
        return Result.failure(
            AppError.validation(message: 'Chat room not found: $chatRoomId'));
      }

      final chatRoom =
          ChatRoom.fromFirestore(doc.data() as Map<String, dynamic>);
      return Result.success(chatRoom);
    } catch (e) {
      _logger.severe('Failed to get chat room $chatRoomId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get chat room: $e'));
    }
  }

  @override
  Future<Result<ChatRoom?>> getChatRoomByBooking(String bookingId) async {
    try {
      final querySnapshot = await _chatRoomsCollection
          .where('bookingId', isEqualTo: bookingId)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return Result.success(null);
      }

      final chatRoom = ChatRoom.fromFirestore(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
      return Result.success(chatRoom);
    } catch (e) {
      _logger.severe('Failed to get chat room by booking $bookingId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get chat room by booking: $e'));
    }
  }

  @override
  Future<Result<List<ChatRoom>>> getUserChatRooms({
    required String userId,
    required MessageSenderType userType,
    ChatRoomStatus? status,
    int limit = 20,
  }) async {
    try {
      final fieldName =
          userType == MessageSenderType.owner ? 'ownerId' : 'sitterId';

      Query query = _chatRoomsCollection
          .where(fieldName, isEqualTo: userId)
          .orderBy('lastMessageAt', descending: true)
          .limit(limit);

      if (status != null) {
        query = query.where('status', isEqualTo: status.name);
      }

      final querySnapshot = await query.get();

      final chatRooms = querySnapshot.docs
          .map((doc) =>
              ChatRoom.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      return Result.success(chatRooms);
    } catch (e) {
      _logger.severe('Failed to get user chat rooms for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get user chat rooms: $e'));
    }
  }

  @override
  Future<Result<ChatRoom>> updateChatRoom({
    required String chatRoomId,
    ChatRoomStatus? status,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final updateData = <String, dynamic>{
        'updatedAt': DateTime.now().toIso8601String(),
      };

      if (status != null) updateData['status'] = status.name;
      if (metadata != null) updateData['metadata'] = metadata;

      await _chatRoomsCollection.doc(chatRoomId).update(updateData);
      return await getChatRoom(chatRoomId);
    } catch (e) {
      _logger.severe('Failed to update chat room $chatRoomId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to update chat room: $e'));
    }
  }

  @override
  Future<Result<void>> archiveChatRoom(String chatRoomId) async {
    try {
      await _chatRoomsCollection.doc(chatRoomId).update({
        'status': ChatRoomStatus.archived.name,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      _logger.info('Archived chat room: $chatRoomId');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to archive chat room $chatRoomId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to archive chat room: $e'));
    }
  }

  @override
  Future<Result<ChatMessage>> sendMessage({
    required String chatRoomId,
    required String senderId,
    required MessageSenderType senderType,
    required String content,
    MessageType messageType = MessageType.text,
    String? replyToId,
    List<MessageAttachment>? attachments,
    MessageMetadata? metadata,
  }) async {
    try {
      final messageId = _messagesCollection.doc().id;
      final now = DateTime.now();

      final message = ChatMessage(
        id: messageId,
        chatRoomId: chatRoomId,
        senderId: senderId,
        senderType: senderType,
        content: content,
        messageType: messageType,
        status: MessageStatus.sent,
        replyToId: replyToId,
        attachments: attachments,
        metadata: metadata,
        createdAt: now,
        updatedAt: now,
        deliveredAt: now,
      );

      // Firestoreトランザクションを使用してメッセージとチャットルーム情報を更新
      await _firestore.runTransaction((transaction) async {
        // メッセージを作成
        transaction.set(
            _messagesCollection.doc(messageId), message.toFirestore());

        // チャットルームの最新情報を更新
        final chatRoomRef = _chatRoomsCollection.doc(chatRoomId);
        final chatRoomDoc = await transaction.get(chatRoomRef);

        if (!chatRoomDoc.exists) {
          throw AppError.validation(
              message: 'Chat room not found: $chatRoomId');
        }

        final chatRoom =
            ChatRoom.fromFirestore(chatRoomDoc.data() as Map<String, dynamic>);

        // 相手の未読数を増加
        final updateData = <String, dynamic>{
          'lastMessageId': messageId,
          'lastMessageContent': content,
          'lastMessageType': messageType.name,
          'lastMessageAt': now.toIso8601String(),
          'updatedAt': now.toIso8601String(),
        };

        if (senderType == MessageSenderType.owner) {
          updateData['unreadCountSitter'] = chatRoom.unreadCountSitter + 1;
        } else {
          updateData['unreadCountOwner'] = chatRoom.unreadCountOwner + 1;
        }

        transaction.update(chatRoomRef, updateData);
      });

      _logger.info('Sent message: $messageId to chat room: $chatRoomId');
      return Result.success(message);
    } catch (e) {
      _logger.severe('Failed to send message: $e');
      if (e is AppError) {
        return Result.failure(e);
      }
      return Result.failure(
          AppError.unknown(message: 'Failed to send message: $e'));
    }
  }

  @override
  Future<Result<ChatMessage>> getMessage(String messageId) async {
    try {
      final doc = await _messagesCollection.doc(messageId).get();

      if (!doc.exists) {
        return Result.failure(
            AppError.validation(message: 'Message not found: $messageId'));
      }

      final message =
          ChatMessage.fromFirestore(doc.data() as Map<String, dynamic>);
      return Result.success(message);
    } catch (e) {
      _logger.severe('Failed to get message $messageId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get message: $e'));
    }
  }

  @override
  Future<Result<List<ChatMessage>>> getChatMessages({
    required String chatRoomId,
    int limit = 50,
    String? startAfter,
    DateTime? before,
  }) async {
    try {
      Query query = _messagesCollection
          .where('chatRoomId', isEqualTo: chatRoomId)
          .orderBy('createdAt', descending: true)
          .limit(limit);

      if (before != null) {
        query = query.where('createdAt', isLessThan: before.toIso8601String());
      }

      if (startAfter != null) {
        final startDoc = await _messagesCollection.doc(startAfter).get();
        query = query.startAfterDocument(startDoc);
      }

      final querySnapshot = await query.get();

      final messages = querySnapshot.docs
          .map((doc) =>
              ChatMessage.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      return Result.success(messages);
    } catch (e) {
      _logger.severe('Failed to get chat messages for $chatRoomId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get chat messages: $e'));
    }
  }

  @override
  Future<Result<void>> deleteMessage(String messageId) async {
    try {
      await _messagesCollection.doc(messageId).update({
        'isDeleted': true,
        'content': '',
        'updatedAt': DateTime.now().toIso8601String(),
      });

      _logger.info('Deleted message: $messageId');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to delete message $messageId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to delete message: $e'));
    }
  }

  @override
  Future<Result<ChatMessage>> editMessage({
    required String messageId,
    required String newContent,
  }) async {
    try {
      await _messagesCollection.doc(messageId).update({
        'content': newContent,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return await getMessage(messageId);
    } catch (e) {
      _logger.severe('Failed to edit message $messageId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to edit message: $e'));
    }
  }

  @override
  Stream<List<ChatMessage>> watchChatMessages(String chatRoomId) {
    return _messagesCollection
        .where('chatRoomId', isEqualTo: chatRoomId)
        .orderBy('createdAt', descending: true)
        .limit(50)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                ChatMessage.fromFirestore(doc.data() as Map<String, dynamic>))
            .toList())
        .handleError((error) {
      _logger.severe('Error watching chat messages for $chatRoomId: $error');
    });
  }

  @override
  Stream<List<ChatRoom>> watchUserChatRooms({
    required String userId,
    required MessageSenderType userType,
  }) {
    final fieldName =
        userType == MessageSenderType.owner ? 'ownerId' : 'sitterId';

    return _chatRoomsCollection
        .where(fieldName, isEqualTo: userId)
        .orderBy('lastMessageAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) =>
                ChatRoom.fromFirestore(doc.data() as Map<String, dynamic>))
            .toList())
        .handleError((error) {
      _logger.severe('Error watching user chat rooms for $userId: $error');
    });
  }

  @override
  Stream<ChatRoom> watchChatRoom(String chatRoomId) {
    return _chatRoomsCollection
        .doc(chatRoomId)
        .snapshots()
        .map(
            (doc) => ChatRoom.fromFirestore(doc.data() as Map<String, dynamic>))
        .handleError((error) {
      _logger.severe('Error watching chat room $chatRoomId: $error');
    });
  }

  @override
  Future<Result<void>> markMessageAsRead({
    required String messageId,
    required String userId,
    required MessageSenderType userType,
  }) async {
    try {
      await _messagesCollection.doc(messageId).update({
        'readAt': DateTime.now().toIso8601String(),
        'status': MessageStatus.read.name,
      });

      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to mark message as read $messageId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to mark message as read: $e'));
    }
  }

  @override
  Future<Result<void>> markChatAsRead({
    required String chatRoomId,
    required String userId,
    required MessageSenderType userType,
  }) async {
    try {
      await _firestore.runTransaction((transaction) async {
        // チャットルームの未読数をリセット
        final chatRoomRef = _chatRoomsCollection.doc(chatRoomId);
        final chatRoomDoc = await transaction.get(chatRoomRef);

        if (!chatRoomDoc.exists) {
          throw AppError.validation(
              message: 'Chat room not found: $chatRoomId');
        }

        final updateData = <String, dynamic>{};
        final now = DateTime.now().toIso8601String();

        if (userType == MessageSenderType.owner) {
          updateData['unreadCountOwner'] = 0;
          updateData['lastReadByOwner'] = now;
        } else {
          updateData['unreadCountSitter'] = 0;
          updateData['lastReadBySitter'] = now;
        }

        transaction.update(chatRoomRef, updateData);

        // 未読メッセージを既読にする
        final unreadQuery = await _messagesCollection
            .where('chatRoomId', isEqualTo: chatRoomId)
            .where('status', isNotEqualTo: MessageStatus.read.name)
            .get();

        for (final doc in unreadQuery.docs) {
          transaction.update(doc.reference, {
            'readAt': now,
            'status': MessageStatus.read.name,
          });
        }
      });

      _logger.info('Marked chat as read: $chatRoomId by user: $userId');
      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to mark chat as read $chatRoomId: $e');
      if (e is AppError) {
        return Result.failure(e);
      }
      return Result.failure(
          AppError.unknown(message: 'Failed to mark chat as read: $e'));
    }
  }

  @override
  Future<Result<void>> markMessageAsDelivered(String messageId) async {
    try {
      await _messagesCollection.doc(messageId).update({
        'deliveredAt': DateTime.now().toIso8601String(),
        'status': MessageStatus.delivered.name,
      });

      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to mark message as delivered $messageId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to mark message as delivered: $e'));
    }
  }

  @override
  Future<Result<int>> getUnreadMessageCount({
    required String userId,
    required MessageSenderType userType,
  }) async {
    try {
      final fieldName = userType == MessageSenderType.owner
          ? 'unreadCountOwner'
          : 'unreadCountSitter';

      final querySnapshot = await _chatRoomsCollection
          .where(userType == MessageSenderType.owner ? 'ownerId' : 'sitterId',
              isEqualTo: userId)
          .get();

      int totalUnread = 0;
      for (final doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        totalUnread += (data[fieldName] as int? ?? 0);
      }

      return Result.success(totalUnread);
    } catch (e) {
      _logger.severe('Failed to get unread message count for $userId: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get unread message count: $e'));
    }
  }

  @override
  Future<Result<void>> updateTypingStatus({
    required String chatRoomId,
    required String userId,
    required MessageSenderType userType,
    required bool isTyping,
  }) async {
    try {
      final typingRef = _firestore.collection('typing_status').doc(chatRoomId);

      await typingRef.set({
        '${userType.name}_$userId': {
          'isTyping': isTyping,
          'updatedAt': DateTime.now().toIso8601String(),
        }
      }, SetOptions(merge: true));

      return Result.success(null);
    } catch (e) {
      _logger.severe('Failed to update typing status: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to update typing status: $e'));
    }
  }

  @override
  Stream<Map<String, bool>> watchTypingStatus(String chatRoomId) {
    return _firestore
        .collection('typing_status')
        .doc(chatRoomId)
        .snapshots()
        .map((doc) {
      if (!doc.exists) return <String, bool>{};

      final data = doc.data() as Map<String, dynamic>;
      final typingStatus = <String, bool>{};

      for (final entry in data.entries) {
        final userInfo = entry.value as Map<String, dynamic>;
        typingStatus[entry.key] = userInfo['isTyping'] ?? false;
      }

      return typingStatus;
    }).handleError((error) {
      _logger.severe('Error watching typing status for $chatRoomId: $error');
    });
  }

  @override
  Future<Result<MessageAttachment>> uploadAttachment({
    required String chatRoomId,
    required String filePath,
    required AttachmentType type,
    String? fileName,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      // Firebase Storageへのアップロード処理は別途実装
      // 今回は簡易実装
      return Result.failure(
          AppError.unknown(message: 'File upload not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to upload attachment: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to upload attachment: $e'));
    }
  }

  @override
  Future<Result<String>> generateAttachmentUploadUrl({
    required String chatRoomId,
    required String fileName,
    required String contentType,
  }) async {
    try {
      // Firebase Storage Signed URLの生成は別途実装
      return Result.failure(AppError.unknown(
          message: 'Signed URL generation not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to generate upload URL: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to generate upload URL: $e'));
    }
  }

  @override
  Future<Result<void>> deleteAttachment(String attachmentId) async {
    try {
      // Firebase Storageファイル削除は別途実装
      return Result.failure(
          AppError.unknown(message: 'Attachment deletion not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to delete attachment: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to delete attachment: $e'));
    }
  }

  @override
  Future<Result<List<ChatMessage>>> searchMessages({
    required String chatRoomId,
    required String query,
    MessageType? messageType,
    DateTime? startDate,
    DateTime? endDate,
    int limit = 20,
  }) async {
    try {
      // Firestore では full-text search が限定的
      // 実装には Algolia などの外部検索サービス推奨
      return Result.failure(
          AppError.unknown(message: 'Message search not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to search messages: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to search messages: $e'));
    }
  }

  @override
  Future<Result<String>> exportChatHistory({
    required String chatRoomId,
    DateTime? startDate,
    DateTime? endDate,
    String format = 'json',
  }) async {
    try {
      // チャット履歴のエクスポートは別途実装
      return Result.failure(
          AppError.unknown(message: 'Chat export not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to export chat history: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to export chat history: $e'));
    }
  }

  @override
  Future<Result<Map<String, dynamic>>> getChatStats({
    String? chatRoomId,
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
      // チャット統計は別途実装
      return Result.failure(
          AppError.unknown(message: 'Chat stats not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to get chat stats: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get chat stats: $e'));
    }
  }

  @override
  Future<Result<void>> syncOfflineMessages() async {
    try {
      // オフライン同期は別途実装
      return Result.failure(
          AppError.unknown(message: 'Offline sync not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to sync offline messages: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to sync offline messages: $e'));
    }
  }

  @override
  Future<Result<List<ChatMessage>>> getOfflineMessages() async {
    try {
      // オフラインメッセージ取得は別途実装
      return Result.failure(
          AppError.unknown(message: 'Offline messages not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to get offline messages: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to get offline messages: $e'));
    }
  }

  @override
  Future<Result<void>> reportMessage({
    required String messageId,
    required String reason,
    String? description,
  }) async {
    try {
      // メッセージ報告機能は別途実装
      return Result.failure(
          AppError.unknown(message: 'Message reporting not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to report message: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to report message: $e'));
    }
  }

  @override
  Future<Result<void>> blockUser({
    required String chatRoomId,
    required String userId,
    required String blockedUserId,
  }) async {
    try {
      // ユーザーブロック機能は別途実装
      return Result.failure(
          AppError.unknown(message: 'User blocking not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to block user: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to block user: $e'));
    }
  }

  @override
  Future<Result<bool>> isUserBlocked({
    required String chatRoomId,
    required String userId,
    required String targetUserId,
  }) async {
    try {
      // ユーザーブロック確認は別途実装
      return Result.failure(
          AppError.unknown(message: 'Block status check not implemented yet'));
    } catch (e) {
      _logger.severe('Failed to check block status: $e');
      return Result.failure(
          AppError.unknown(message: 'Failed to check block status: $e'));
    }
  }
}
