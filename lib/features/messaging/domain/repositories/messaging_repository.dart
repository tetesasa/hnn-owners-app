import '../entities/message.dart';
import '../../../../core/error/result.dart';

abstract class MessagingRepository {
  // チャットルーム管理
  Future<Result<ChatRoom>> createChatRoom({
    required String bookingId,
    required String ownerId,
    required String sitterId,
  });

  Future<Result<ChatRoom>> getChatRoom(String chatRoomId);

  Future<Result<ChatRoom?>> getChatRoomByBooking(String bookingId);

  Future<Result<List<ChatRoom>>> getUserChatRooms({
    required String userId,
    required MessageSenderType userType,
    ChatRoomStatus? status,
    int limit = 20,
  });

  Future<Result<ChatRoom>> updateChatRoom({
    required String chatRoomId,
    ChatRoomStatus? status,
    Map<String, dynamic>? metadata,
  });

  Future<Result<void>> archiveChatRoom(String chatRoomId);

  // メッセージ送信・取得
  Future<Result<ChatMessage>> sendMessage({
    required String chatRoomId,
    required String senderId,
    required MessageSenderType senderType,
    required String content,
    MessageType messageType = MessageType.text,
    String? replyToId,
    List<MessageAttachment>? attachments,
    MessageMetadata? metadata,
  });

  Future<Result<ChatMessage>> getMessage(String messageId);

  Future<Result<List<ChatMessage>>> getChatMessages({
    required String chatRoomId,
    int limit = 50,
    String? startAfter,
    DateTime? before,
  });

  Future<Result<void>> deleteMessage(String messageId);

  Future<Result<ChatMessage>> editMessage({
    required String messageId,
    required String newContent,
  });

  // リアルタイム機能
  Stream<List<ChatMessage>> watchChatMessages(String chatRoomId);

  Stream<List<ChatRoom>> watchUserChatRooms({
    required String userId,
    required MessageSenderType userType,
  });

  Stream<ChatRoom> watchChatRoom(String chatRoomId);

  // 既読・配信状態管理
  Future<Result<void>> markMessageAsRead({
    required String messageId,
    required String userId,
    required MessageSenderType userType,
  });

  Future<Result<void>> markChatAsRead({
    required String chatRoomId,
    required String userId,
    required MessageSenderType userType,
  });

  Future<Result<void>> markMessageAsDelivered(String messageId);

  Future<Result<int>> getUnreadMessageCount({
    required String userId,
    required MessageSenderType userType,
  });

  // 入力状態管理
  Future<Result<void>> updateTypingStatus({
    required String chatRoomId,
    required String userId,
    required MessageSenderType userType,
    required bool isTyping,
  });

  Stream<Map<String, bool>> watchTypingStatus(String chatRoomId);

  // ファイル・添付ファイル管理
  Future<Result<MessageAttachment>> uploadAttachment({
    required String chatRoomId,
    required String filePath,
    required AttachmentType type,
    String? fileName,
    Map<String, dynamic>? metadata,
  });

  Future<Result<String>> generateAttachmentUploadUrl({
    required String chatRoomId,
    required String fileName,
    required String contentType,
  });

  Future<Result<void>> deleteAttachment(String attachmentId);

  // 検索機能
  Future<Result<List<ChatMessage>>> searchMessages({
    required String chatRoomId,
    required String query,
    MessageType? messageType,
    DateTime? startDate,
    DateTime? endDate,
    int limit = 20,
  });

  // エクスポート・バックアップ
  Future<Result<String>> exportChatHistory({
    required String chatRoomId,
    DateTime? startDate,
    DateTime? endDate,
    String format = 'json',
  });

  // 統計・分析
  Future<Result<Map<String, dynamic>>> getChatStats({
    String? chatRoomId,
    String? userId,
    DateTime? startDate,
    DateTime? endDate,
  });

  // オフライン同期
  Future<Result<void>> syncOfflineMessages();

  Future<Result<List<ChatMessage>>> getOfflineMessages();

  // セキュリティ・モデレーション
  Future<Result<void>> reportMessage({
    required String messageId,
    required String reason,
    String? description,
  });

  Future<Result<void>> blockUser({
    required String chatRoomId,
    required String userId,
    required String blockedUserId,
  });

  Future<Result<bool>> isUserBlocked({
    required String chatRoomId,
    required String userId,
    required String targetUserId,
  });
}
