// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomerImpl _$$CustomerImplFromJson(Map<String, dynamic> json) =>
    _$CustomerImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      firebaseUid: json['firebaseUid'] as String?,
      appUserId: json['appUserId'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
      appPreferences: json['appPreferences'] == null
          ? null
          : CustomerAppPreferences.fromJson(
              json['appPreferences'] as Map<String, dynamic>),
      appMetadata: json['appMetadata'] == null
          ? null
          : CustomerAppMetadata.fromJson(
              json['appMetadata'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$CustomerImplToJson(_$CustomerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'firebaseUid': instance.firebaseUid,
      'appUserId': instance.appUserId,
      'profileImageUrl': instance.profileImageUrl,
      'appPreferences': instance.appPreferences,
      'appMetadata': instance.appMetadata,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_$CustomerAppPreferencesImpl _$$CustomerAppPreferencesImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerAppPreferencesImpl(
      notificationSettings: json['notificationSettings'] == null
          ? null
          : NotificationSettings.fromJson(
              json['notificationSettings'] as Map<String, dynamic>),
      language: json['language'] as String? ?? 'ja',
      theme: json['theme'] as String? ?? 'system',
    );

Map<String, dynamic> _$$CustomerAppPreferencesImplToJson(
        _$CustomerAppPreferencesImpl instance) =>
    <String, dynamic>{
      'notificationSettings': instance.notificationSettings,
      'language': instance.language,
      'theme': instance.theme,
    };

_$CustomerAppMetadataImpl _$$CustomerAppMetadataImplFromJson(
        Map<String, dynamic> json) =>
    _$CustomerAppMetadataImpl(
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      appVersion: json['appVersion'] as String?,
      deviceInfo: json['deviceInfo'] == null
          ? null
          : DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CustomerAppMetadataImplToJson(
        _$CustomerAppMetadataImpl instance) =>
    <String, dynamic>{
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'appVersion': instance.appVersion,
      'deviceInfo': instance.deviceInfo,
    };

_$NotificationSettingsImpl _$$NotificationSettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationSettingsImpl(
      bookingUpdates: json['bookingUpdates'] as bool? ?? true,
      messageNotifications: json['messageNotifications'] as bool? ?? true,
      serviceReports: json['serviceReports'] as bool? ?? true,
      promotionalEmails: json['promotionalEmails'] as bool? ?? false,
      pushNotifications: json['pushNotifications'] as bool? ?? true,
    );

Map<String, dynamic> _$$NotificationSettingsImplToJson(
        _$NotificationSettingsImpl instance) =>
    <String, dynamic>{
      'bookingUpdates': instance.bookingUpdates,
      'messageNotifications': instance.messageNotifications,
      'serviceReports': instance.serviceReports,
      'promotionalEmails': instance.promotionalEmails,
      'pushNotifications': instance.pushNotifications,
    };

_$DeviceInfoImpl _$$DeviceInfoImplFromJson(Map<String, dynamic> json) =>
    _$DeviceInfoImpl(
      platform: json['platform'] as String?,
      deviceModel: json['deviceModel'] as String?,
      osVersion: json['osVersion'] as String?,
      appVersion: json['appVersion'] as String?,
    );

Map<String, dynamic> _$$DeviceInfoImplToJson(_$DeviceInfoImpl instance) =>
    <String, dynamic>{
      'platform': instance.platform,
      'deviceModel': instance.deviceModel,
      'osVersion': instance.osVersion,
      'appVersion': instance.appVersion,
    };
