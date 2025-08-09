import 'package:freezed_annotation/freezed_annotation.dart';

part 'message.freezed.dart';
part 'message.g.dart';

@freezed
class ChatMessage with _$ChatMessage {
  const ChatMessage._();

  const factory ChatMessage({
    required String id,
    required String chatRoomId,
    required String senderId,
    required MessageSenderType senderType,
    required String content,
    required MessageType messageType,
    @Default(MessageStatus.sent) MessageStatus status,
    String? replyToId,
    List<MessageAttachment>? attachments,
    MessageMetadata? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deliveredAt,
    DateTime? readAt,
    @Default(false) bool isSystemMessage,
    @Default(false) bool isDeleted,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  // Firestoreとの変換用メソッド
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'chatRoomId': chatRoomId,
      'senderId': senderId,
      'senderType': senderType.name,
      'content': content,
      'messageType': messageType.name,
      'status': status.name,
      'replyToId': replyToId,
      'attachments': attachments?.map((a) => a.toFirestore()).toList(),
      'metadata': metadata?.toFirestore(),
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'deliveredAt': deliveredAt?.toIso8601String(),
      'readAt': readAt?.toIso8601String(),
      'isSystemMessage': isSystemMessage,
      'isDeleted': isDeleted,
    };
  }

  factory ChatMessage.fromFirestore(Map<String, dynamic> data) {
    return ChatMessage(
      id: data['id'] ?? '',
      chatRoomId: data['chatRoomId'] ?? '',
      senderId: data['senderId'] ?? '',
      senderType: MessageSenderType.values.firstWhere(
        (t) => t.name == data['senderType'],
        orElse: () => MessageSenderType.owner,
      ),
      content: data['content'] ?? '',
      messageType: MessageType.values.firstWhere(
        (t) => t.name == data['messageType'],
        orElse: () => MessageType.text,
      ),
      status: MessageStatus.values.firstWhere(
        (s) => s.name == data['status'],
        orElse: () => MessageStatus.sent,
      ),
      replyToId: data['replyToId'],
      attachments: data['attachments'] != null
          ? (data['attachments'] as List)
              .map((a) => MessageAttachment.fromFirestore(a))
              .toList()
          : null,
      metadata: data['metadata'] != null
          ? MessageMetadata.fromFirestore(data['metadata'])
          : null,
      createdAt:
          data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
      updatedAt:
          data['updatedAt'] != null ? DateTime.parse(data['updatedAt']) : null,
      deliveredAt: data['deliveredAt'] != null
          ? DateTime.parse(data['deliveredAt'])
          : null,
      readAt: data['readAt'] != null ? DateTime.parse(data['readAt']) : null,
      isSystemMessage: data['isSystemMessage'] ?? false,
      isDeleted: data['isDeleted'] ?? false,
    );
  }

  // メッセージが既読済みかチェック
  bool get isRead => readAt != null;

  // メッセージが配信済みかチェック
  bool get isDelivered => deliveredAt != null;

  // メッセージが送信済みかチェック
  bool get isSent => status != MessageStatus.pending;

  // メッセージが失敗したかチェック
  bool get isFailed => status == MessageStatus.failed;

  // メッセージの時間表示用フォーマット
  String get timeDisplay {
    if (createdAt == null) return '';

    final now = DateTime.now();
    final messageDate = createdAt!;

    if (now.difference(messageDate).inDays == 0) {
      // 今日のメッセージ
      return '${messageDate.hour.toString().padLeft(2, '0')}:${messageDate.minute.toString().padLeft(2, '0')}';
    } else if (now.difference(messageDate).inDays == 1) {
      // 昨日のメッセージ
      return '昨日';
    } else if (now.difference(messageDate).inDays < 7) {
      // 1週間以内
      const weekdays = ['月', '火', '水', '木', '金', '土', '日'];
      return weekdays[messageDate.weekday - 1];
    } else {
      // それ以上前
      return '${messageDate.month}/${messageDate.day}';
    }
  }

  // メッセージプレビュー用の短縮コンテンツ
  String get preview {
    if (isDeleted) return 'このメッセージは削除されました';

    switch (messageType) {
      case MessageType.text:
        return content.length > 50 ? '${content.substring(0, 50)}...' : content;
      case MessageType.image:
        return '📷 画像';
      case MessageType.file:
        return '📎 ファイル';
      case MessageType.location:
        return '📍 位置情報';
      case MessageType.system:
        return content;
    }
  }
}

@freezed
class ChatRoom with _$ChatRoom {
  const ChatRoom._();

  const factory ChatRoom({
    required String id,
    required String bookingId,
    required String ownerId,
    required String sitterId,
    required ChatRoomStatus status,
    String? lastMessageId,
    String? lastMessageContent,
    MessageType? lastMessageType,
    DateTime? lastMessageAt,
    DateTime? lastReadByOwner,
    DateTime? lastReadBySitter,
    @Default(0) int unreadCountOwner,
    @Default(0) int unreadCountSitter,
    DateTime? createdAt,
    DateTime? updatedAt,
    Map<String, dynamic>? metadata,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) =>
      _$ChatRoomFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'bookingId': bookingId,
      'ownerId': ownerId,
      'sitterId': sitterId,
      'status': status.name,
      'lastMessageId': lastMessageId,
      'lastMessageContent': lastMessageContent,
      'lastMessageType': lastMessageType?.name,
      'lastMessageAt': lastMessageAt?.toIso8601String(),
      'lastReadByOwner': lastReadByOwner?.toIso8601String(),
      'lastReadBySitter': lastReadBySitter?.toIso8601String(),
      'unreadCountOwner': unreadCountOwner,
      'unreadCountSitter': unreadCountSitter,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'metadata': metadata,
    };
  }

  factory ChatRoom.fromFirestore(Map<String, dynamic> data) {
    return ChatRoom(
      id: data['id'] ?? '',
      bookingId: data['bookingId'] ?? '',
      ownerId: data['ownerId'] ?? '',
      sitterId: data['sitterId'] ?? '',
      status: ChatRoomStatus.values.firstWhere(
        (s) => s.name == data['status'],
        orElse: () => ChatRoomStatus.active,
      ),
      lastMessageId: data['lastMessageId'],
      lastMessageContent: data['lastMessageContent'],
      lastMessageType: data['lastMessageType'] != null
          ? MessageType.values.firstWhere(
              (t) => t.name == data['lastMessageType'],
              orElse: () => MessageType.text,
            )
          : null,
      lastMessageAt: data['lastMessageAt'] != null
          ? DateTime.parse(data['lastMessageAt'])
          : null,
      lastReadByOwner: data['lastReadByOwner'] != null
          ? DateTime.parse(data['lastReadByOwner'])
          : null,
      lastReadBySitter: data['lastReadBySitter'] != null
          ? DateTime.parse(data['lastReadBySitter'])
          : null,
      unreadCountOwner: data['unreadCountOwner'] ?? 0,
      unreadCountSitter: data['unreadCountSitter'] ?? 0,
      createdAt:
          data['createdAt'] != null ? DateTime.parse(data['createdAt']) : null,
      updatedAt:
          data['updatedAt'] != null ? DateTime.parse(data['updatedAt']) : null,
      metadata: data['metadata'],
    );
  }

  // 指定したユーザーの未読数を取得
  int getUnreadCount(MessageSenderType senderType) {
    switch (senderType) {
      case MessageSenderType.owner:
        return unreadCountOwner;
      case MessageSenderType.sitter:
        return unreadCountSitter;
    }
  }

  // チャットルームがアクティブかチェック
  bool get isActive => status == ChatRoomStatus.active;

  // 最後のメッセージのプレビュー
  String get lastMessagePreview {
    if (lastMessageContent == null) return 'まだメッセージがありません';

    switch (lastMessageType) {
      case MessageType.text:
      case MessageType.system:
        return lastMessageContent!.length > 30
            ? '${lastMessageContent!.substring(0, 30)}...'
            : lastMessageContent!;
      case MessageType.image:
        return '📷 画像';
      case MessageType.file:
        return '📎 ファイル';
      case MessageType.location:
        return '📍 位置情報';
      default:
        return lastMessageContent ?? '';
    }
  }
}

@freezed
class MessageAttachment with _$MessageAttachment {
  const MessageAttachment._();

  const factory MessageAttachment({
    required String id,
    required AttachmentType type,
    required String url,
    String? name,
    String? mimeType,
    int? size,
    int? width,
    int? height,
    int? duration,
    String? thumbnailUrl,
    Map<String, dynamic>? metadata,
  }) = _MessageAttachment;

  factory MessageAttachment.fromJson(Map<String, dynamic> json) =>
      _$MessageAttachmentFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'type': type.name,
      'url': url,
      'name': name,
      'mimeType': mimeType,
      'size': size,
      'width': width,
      'height': height,
      'duration': duration,
      'thumbnailUrl': thumbnailUrl,
      'metadata': metadata,
    };
  }

  factory MessageAttachment.fromFirestore(Map<String, dynamic> data) {
    return MessageAttachment(
      id: data['id'] ?? '',
      type: AttachmentType.values.firstWhere(
        (t) => t.name == data['type'],
        orElse: () => AttachmentType.file,
      ),
      url: data['url'] ?? '',
      name: data['name'],
      mimeType: data['mimeType'],
      size: data['size'],
      width: data['width'],
      height: data['height'],
      duration: data['duration'],
      thumbnailUrl: data['thumbnailUrl'],
      metadata: data['metadata'],
    );
  }
}

@freezed
class MessageMetadata with _$MessageMetadata {
  const MessageMetadata._();

  const factory MessageMetadata({
    String? deviceType,
    String? appVersion,
    String? location,
    Map<String, dynamic>? customData,
  }) = _MessageMetadata;

  factory MessageMetadata.fromJson(Map<String, dynamic> json) =>
      _$MessageMetadataFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'deviceType': deviceType,
      'appVersion': appVersion,
      'location': location,
      'customData': customData,
    };
  }

  factory MessageMetadata.fromFirestore(Map<String, dynamic> data) {
    return MessageMetadata(
      deviceType: data['deviceType'],
      appVersion: data['appVersion'],
      location: data['location'],
      customData: data['customData'],
    );
  }
}

enum MessageSenderType {
  owner,
  sitter,
}

enum MessageType {
  text,
  image,
  file,
  location,
  system,
}

enum MessageStatus {
  pending,
  sent,
  delivered,
  read,
  failed,
}

enum ChatRoomStatus {
  active,
  archived,
  blocked,
}

enum AttachmentType {
  image,
  video,
  audio,
  file,
  location,
}

extension MessageSenderTypeExtension on MessageSenderType {
  String get displayName {
    switch (this) {
      case MessageSenderType.owner:
        return '飼い主';
      case MessageSenderType.sitter:
        return 'シッター';
    }
  }
}
