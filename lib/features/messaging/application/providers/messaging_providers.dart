import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../../domain/entities/message.dart';
import '../../domain/repositories/messaging_repository.dart';
import '../../data/repositories/firestore_messaging_repository.dart';
import '../../../../core/error/result.dart';

/// MessagingRepositoryプロバイダー
final messagingRepositoryProvider = Provider<MessagingRepository>((ref) {
  return FirestoreMessagingRepository();
});

/// チャットルームリストプロバイダー
final chatRoomListProvider = StateNotifierProvider.family<ChatRoomListNotifier,
    AsyncValue<List<ChatRoom>>, UserChatParams>(
  (ref, params) {
    final repository = ref.watch(messagingRepositoryProvider);
    return ChatRoomListNotifier(repository, params);
  },
);

/// チャットメッセージリストプロバイダー
final chatMessagesProvider = StateNotifierProvider.family<ChatMessagesNotifier,
    AsyncValue<List<ChatMessage>>, String>(
  (ref, chatRoomId) {
    final repository = ref.watch(messagingRepositoryProvider);
    return ChatMessagesNotifier(repository, chatRoomId);
  },
);

/// 未読メッセージ数プロバイダー
final unreadMessageCountProvider =
    FutureProvider.family<int, UserChatParams>((ref, params) async {
  final repository = ref.watch(messagingRepositoryProvider);
  final result = await repository.getUnreadMessageCount(
    userId: params.userId,
    userType: params.userType,
  );

  if (result.isSuccess) {
    return result.data!;
  }

  throw result.error!;
});

/// 特定のチャットルームプロバイダー
final chatRoomProvider =
    FutureProvider.family<ChatRoom, String>((ref, chatRoomId) async {
  final repository = ref.watch(messagingRepositoryProvider);
  final result = await repository.getChatRoom(chatRoomId);

  if (result.isSuccess) {
    return result.data!;
  }

  throw result.error!;
});

/// 入力状態プロバイダー
final typingStatusProvider = StateNotifierProvider.family<TypingStatusNotifier,
    Map<String, bool>, String>(
  (ref, chatRoomId) {
    final repository = ref.watch(messagingRepositoryProvider);
    return TypingStatusNotifier(repository, chatRoomId);
  },
);

/// リアルタイムチャットメッセージプロバイダー（Stream）
final realtimeChatMessagesProvider =
    StreamProvider.family<List<ChatMessage>, String>((ref, chatRoomId) {
  final repository = ref.watch(messagingRepositoryProvider);
  return repository.watchChatMessages(chatRoomId);
});

/// リアルタイムチャットルームリストプロバイダー（Stream）
final realtimeChatRoomListProvider =
    StreamProvider.family<List<ChatRoom>, UserChatParams>((ref, params) {
  final repository = ref.watch(messagingRepositoryProvider);
  return repository.watchUserChatRooms(
    userId: params.userId,
    userType: params.userType,
  );
});

/// チャットルーム管理NotificationController
class ChatRoomListNotifier extends StateNotifier<AsyncValue<List<ChatRoom>>> {
  final MessagingRepository _repository;
  final UserChatParams _params;
  static final Logger _logger = Logger('ChatRoomListNotifier');

  ChatRoomListNotifier(this._repository, this._params)
      : super(const AsyncValue.loading()) {
    loadChatRooms();
  }

  /// チャットルーム一覧を読み込み
  Future<void> loadChatRooms({
    ChatRoomStatus? status,
    int limit = 20,
  }) async {
    try {
      state = const AsyncValue.loading();

      final result = await _repository.getUserChatRooms(
        userId: _params.userId,
        userType: _params.userType,
        status: status,
        limit: limit,
      );

      if (result.isSuccess) {
        state = AsyncValue.data(result.data!);
      } else {
        state = AsyncValue.error(result.error!, StackTrace.current);
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to load chat rooms: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// チャットルームを作成
  Future<ChatRoom?> createChatRoom({
    required String bookingId,
    required String ownerId,
    required String sitterId,
  }) async {
    try {
      final result = await _repository.createChatRoom(
        bookingId: bookingId,
        ownerId: ownerId,
        sitterId: sitterId,
      );

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((chatRooms) {
          final updatedChatRooms = [result.data!, ...chatRooms];
          state = AsyncValue.data(updatedChatRooms);
        });

        _logger.info('Created chat room: ${result.data!.id}');
        return result.data!;
      } else {
        _logger.severe('Failed to create chat room: ${result.error}');
        return null;
      }
    } catch (e) {
      _logger.severe('Error creating chat room: $e');
      return null;
    }
  }

  /// チャットルームをアーカイブ
  Future<void> archiveChatRoom(String chatRoomId) async {
    try {
      final result = await _repository.archiveChatRoom(chatRoomId);

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((chatRooms) {
          final updatedChatRooms = chatRooms.map((room) {
            if (room.id == chatRoomId) {
              return room.copyWith(
                status: ChatRoomStatus.archived,
                updatedAt: DateTime.now(),
              );
            }
            return room;
          }).toList();

          state = AsyncValue.data(updatedChatRooms);
        });

        _logger.info('Archived chat room: $chatRoomId');
      } else {
        _logger.severe('Failed to archive chat room: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error archiving chat room: $e');
    }
  }

  /// チャットを既読にする
  Future<void> markChatAsRead(String chatRoomId) async {
    try {
      final result = await _repository.markChatAsRead(
        chatRoomId: chatRoomId,
        userId: _params.userId,
        userType: _params.userType,
      );

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((chatRooms) {
          final updatedChatRooms = chatRooms.map((room) {
            if (room.id == chatRoomId) {
              if (_params.userType == MessageSenderType.owner) {
                return room.copyWith(
                  unreadCountOwner: 0,
                  lastReadByOwner: DateTime.now(),
                );
              } else {
                return room.copyWith(
                  unreadCountSitter: 0,
                  lastReadBySitter: DateTime.now(),
                );
              }
            }
            return room;
          }).toList();

          state = AsyncValue.data(updatedChatRooms);
        });

        _logger.info('Marked chat as read: $chatRoomId');
      } else {
        _logger.severe('Failed to mark chat as read: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error marking chat as read: $e');
    }
  }

  /// フィルター適用
  Future<void> filterChatRooms({ChatRoomStatus? status}) async {
    await loadChatRooms(status: status);
  }

  /// リフレッシュ
  Future<void> refresh() async {
    await loadChatRooms();
  }
}

/// チャットメッセージ管理NotificationController
class ChatMessagesNotifier
    extends StateNotifier<AsyncValue<List<ChatMessage>>> {
  final MessagingRepository _repository;
  final String _chatRoomId;
  static final Logger _logger = Logger('ChatMessagesNotifier');

  ChatMessagesNotifier(this._repository, this._chatRoomId)
      : super(const AsyncValue.loading()) {
    loadMessages();
  }

  /// メッセージ一覧を読み込み
  Future<void> loadMessages({
    int limit = 50,
    String? startAfter,
    DateTime? before,
  }) async {
    try {
      state = const AsyncValue.loading();

      final result = await _repository.getChatMessages(
        chatRoomId: _chatRoomId,
        limit: limit,
        startAfter: startAfter,
        before: before,
      );

      if (result.isSuccess) {
        // メッセージを古い順に並び替え（表示用）
        final sortedMessages = result.data!.reversed.toList();
        state = AsyncValue.data(sortedMessages);
      } else {
        state = AsyncValue.error(result.error!, StackTrace.current);
      }
    } catch (e, stackTrace) {
      _logger.severe('Failed to load messages: $e');
      state = AsyncValue.error(e, stackTrace);
    }
  }

  /// メッセージを送信
  Future<ChatMessage?> sendMessage({
    required String senderId,
    required MessageSenderType senderType,
    required String content,
    MessageType messageType = MessageType.text,
    String? replyToId,
    List<MessageAttachment>? attachments,
    MessageMetadata? metadata,
  }) async {
    try {
      final result = await _repository.sendMessage(
        chatRoomId: _chatRoomId,
        senderId: senderId,
        senderType: senderType,
        content: content,
        messageType: messageType,
        replyToId: replyToId,
        attachments: attachments,
        metadata: metadata,
      );

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((messages) {
          final updatedMessages = [...messages, result.data!];
          state = AsyncValue.data(updatedMessages);
        });

        _logger.info('Sent message: ${result.data!.id}');
        return result.data!;
      } else {
        _logger.severe('Failed to send message: ${result.error}');
        return null;
      }
    } catch (e) {
      _logger.severe('Error sending message: $e');
      return null;
    }
  }

  /// メッセージを編集
  Future<void> editMessage({
    required String messageId,
    required String newContent,
  }) async {
    try {
      final result = await _repository.editMessage(
        messageId: messageId,
        newContent: newContent,
      );

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((messages) {
          final updatedMessages = messages.map((message) {
            if (message.id == messageId) {
              return message.copyWith(
                content: newContent,
                updatedAt: DateTime.now(),
              );
            }
            return message;
          }).toList();

          state = AsyncValue.data(updatedMessages);
        });

        _logger.info('Edited message: $messageId');
      } else {
        _logger.severe('Failed to edit message: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error editing message: $e');
    }
  }

  /// メッセージを削除
  Future<void> deleteMessage(String messageId) async {
    try {
      final result = await _repository.deleteMessage(messageId);

      if (result.isSuccess) {
        // ローカル状態を更新
        state.whenData((messages) {
          final updatedMessages = messages.map((message) {
            if (message.id == messageId) {
              return message.copyWith(
                isDeleted: true,
                content: '',
                updatedAt: DateTime.now(),
              );
            }
            return message;
          }).toList();

          state = AsyncValue.data(updatedMessages);
        });

        _logger.info('Deleted message: $messageId');
      } else {
        _logger.severe('Failed to delete message: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error deleting message: $e');
    }
  }

  /// さらに古いメッセージを読み込み
  Future<void> loadOlderMessages() async {
    state.whenData((currentMessages) async {
      if (currentMessages.isEmpty) return;

      final oldestMessage = currentMessages.first;

      final result = await _repository.getChatMessages(
        chatRoomId: _chatRoomId,
        limit: 20,
        before: oldestMessage.createdAt,
      );

      if (result.isSuccess) {
        final olderMessages = result.data!.reversed.toList();
        final combinedMessages = [...olderMessages, ...currentMessages];
        state = AsyncValue.data(combinedMessages);
      }
    });
  }

  /// リフレッシュ
  Future<void> refresh() async {
    await loadMessages();
  }
}

/// 入力状態管理NotificationController
class TypingStatusNotifier extends StateNotifier<Map<String, bool>> {
  final MessagingRepository _repository;
  final String _chatRoomId;
  static final Logger _logger = Logger('TypingStatusNotifier');

  TypingStatusNotifier(this._repository, this._chatRoomId) : super({}) {
    _watchTypingStatus();
  }

  /// 入力状態を更新
  Future<void> updateTypingStatus({
    required String userId,
    required MessageSenderType userType,
    required bool isTyping,
  }) async {
    try {
      await _repository.updateTypingStatus(
        chatRoomId: _chatRoomId,
        userId: userId,
        userType: userType,
        isTyping: isTyping,
      );
    } catch (e) {
      _logger.severe('Error updating typing status: $e');
    }
  }

  /// 入力状態を監視
  void _watchTypingStatus() {
    _repository.watchTypingStatus(_chatRoomId).listen(
      (typingStatus) {
        state = typingStatus;
      },
      onError: (error) {
        _logger.severe('Error watching typing status: $error');
      },
    );
  }
}

/// メッセージ送信パラメータ
class SendMessageParams {
  final String chatRoomId;
  final String senderId;
  final MessageSenderType senderType;
  final String content;
  final MessageType messageType;
  final String? replyToId;
  final List<MessageAttachment>? attachments;
  final MessageMetadata? metadata;

  const SendMessageParams({
    required this.chatRoomId,
    required this.senderId,
    required this.senderType,
    required this.content,
    this.messageType = MessageType.text,
    this.replyToId,
    this.attachments,
    this.metadata,
  });
}

/// ユーザーチャットパラメータ
class UserChatParams {
  final String userId;
  final MessageSenderType userType;

  const UserChatParams({
    required this.userId,
    required this.userType,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserChatParams &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          userType == other.userType;

  @override
  int get hashCode => userId.hashCode ^ userType.hashCode;
}

/// メッセージ送信プロバイダー
final sendMessageProvider =
    FutureProvider.family<ChatMessage?, SendMessageParams>((ref, params) async {
  final repository = ref.watch(messagingRepositoryProvider);

  final result = await repository.sendMessage(
    chatRoomId: params.chatRoomId,
    senderId: params.senderId,
    senderType: params.senderType,
    content: params.content,
    messageType: params.messageType,
    replyToId: params.replyToId,
    attachments: params.attachments,
    metadata: params.metadata,
  );

  if (result.isSuccess) {
    return result.data!;
  }

  throw result.error!;
});
