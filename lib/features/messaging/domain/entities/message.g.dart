// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatMessageImpl _$$ChatMessageImplFromJson(Map<String, dynamic> json) =>
    _$ChatMessageImpl(
      id: json['id'] as String,
      chatRoomId: json['chatRoomId'] as String,
      senderId: json['senderId'] as String,
      senderType: $enumDecode(_$MessageSenderTypeEnumMap, json['senderType']),
      content: json['content'] as String,
      messageType: $enumDecode(_$MessageTypeEnumMap, json['messageType']),
      status: $enumDecodeNullable(_$MessageStatusEnumMap, json['status']) ??
          MessageStatus.sent,
      replyToId: json['replyToId'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => MessageAttachment.fromJson(e as Map<String, dynamic>))
          .toList(),
      metadata: json['metadata'] == null
          ? null
          : MessageMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      deliveredAt: json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
      readAt: json['readAt'] == null
          ? null
          : DateTime.parse(json['readAt'] as String),
      isSystemMessage: json['isSystemMessage'] as bool? ?? false,
      isDeleted: json['isDeleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$ChatMessageImplToJson(_$ChatMessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatRoomId': instance.chatRoomId,
      'senderId': instance.senderId,
      'senderType': _$MessageSenderTypeEnumMap[instance.senderType]!,
      'content': instance.content,
      'messageType': _$MessageTypeEnumMap[instance.messageType]!,
      'status': _$MessageStatusEnumMap[instance.status]!,
      'replyToId': instance.replyToId,
      'attachments': instance.attachments,
      'metadata': instance.metadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deliveredAt': instance.deliveredAt?.toIso8601String(),
      'readAt': instance.readAt?.toIso8601String(),
      'isSystemMessage': instance.isSystemMessage,
      'isDeleted': instance.isDeleted,
    };

const _$MessageSenderTypeEnumMap = {
  MessageSenderType.owner: 'owner',
  MessageSenderType.sitter: 'sitter',
};

const _$MessageTypeEnumMap = {
  MessageType.text: 'text',
  MessageType.image: 'image',
  MessageType.file: 'file',
  MessageType.location: 'location',
  MessageType.system: 'system',
};

const _$MessageStatusEnumMap = {
  MessageStatus.pending: 'pending',
  MessageStatus.sent: 'sent',
  MessageStatus.delivered: 'delivered',
  MessageStatus.read: 'read',
  MessageStatus.failed: 'failed',
};

_$ChatRoomImpl _$$ChatRoomImplFromJson(Map<String, dynamic> json) =>
    _$ChatRoomImpl(
      id: json['id'] as String,
      bookingId: json['bookingId'] as String,
      ownerId: json['ownerId'] as String,
      sitterId: json['sitterId'] as String,
      status: $enumDecode(_$ChatRoomStatusEnumMap, json['status']),
      lastMessageId: json['lastMessageId'] as String?,
      lastMessageContent: json['lastMessageContent'] as String?,
      lastMessageType:
          $enumDecodeNullable(_$MessageTypeEnumMap, json['lastMessageType']),
      lastMessageAt: json['lastMessageAt'] == null
          ? null
          : DateTime.parse(json['lastMessageAt'] as String),
      lastReadByOwner: json['lastReadByOwner'] == null
          ? null
          : DateTime.parse(json['lastReadByOwner'] as String),
      lastReadBySitter: json['lastReadBySitter'] == null
          ? null
          : DateTime.parse(json['lastReadBySitter'] as String),
      unreadCountOwner: (json['unreadCountOwner'] as num?)?.toInt() ?? 0,
      unreadCountSitter: (json['unreadCountSitter'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChatRoomImplToJson(_$ChatRoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'ownerId': instance.ownerId,
      'sitterId': instance.sitterId,
      'status': _$ChatRoomStatusEnumMap[instance.status]!,
      'lastMessageId': instance.lastMessageId,
      'lastMessageContent': instance.lastMessageContent,
      'lastMessageType': _$MessageTypeEnumMap[instance.lastMessageType],
      'lastMessageAt': instance.lastMessageAt?.toIso8601String(),
      'lastReadByOwner': instance.lastReadByOwner?.toIso8601String(),
      'lastReadBySitter': instance.lastReadBySitter?.toIso8601String(),
      'unreadCountOwner': instance.unreadCountOwner,
      'unreadCountSitter': instance.unreadCountSitter,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'metadata': instance.metadata,
    };

const _$ChatRoomStatusEnumMap = {
  ChatRoomStatus.active: 'active',
  ChatRoomStatus.archived: 'archived',
  ChatRoomStatus.blocked: 'blocked',
};

_$MessageAttachmentImpl _$$MessageAttachmentImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageAttachmentImpl(
      id: json['id'] as String,
      type: $enumDecode(_$AttachmentTypeEnumMap, json['type']),
      url: json['url'] as String,
      name: json['name'] as String?,
      mimeType: json['mimeType'] as String?,
      size: (json['size'] as num?)?.toInt(),
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
      duration: (json['duration'] as num?)?.toInt(),
      thumbnailUrl: json['thumbnailUrl'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MessageAttachmentImplToJson(
        _$MessageAttachmentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$AttachmentTypeEnumMap[instance.type]!,
      'url': instance.url,
      'name': instance.name,
      'mimeType': instance.mimeType,
      'size': instance.size,
      'width': instance.width,
      'height': instance.height,
      'duration': instance.duration,
      'thumbnailUrl': instance.thumbnailUrl,
      'metadata': instance.metadata,
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.image: 'image',
  AttachmentType.video: 'video',
  AttachmentType.audio: 'audio',
  AttachmentType.file: 'file',
  AttachmentType.location: 'location',
};

_$MessageMetadataImpl _$$MessageMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageMetadataImpl(
      deviceType: json['deviceType'] as String?,
      appVersion: json['appVersion'] as String?,
      location: json['location'] as String?,
      customData: json['customData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$MessageMetadataImplToJson(
        _$MessageMetadataImpl instance) =>
    <String, dynamic>{
      'deviceType': instance.deviceType,
      'appVersion': instance.appVersion,
      'location': instance.location,
      'customData': instance.customData,
    };
