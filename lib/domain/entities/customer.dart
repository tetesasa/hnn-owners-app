import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer.freezed.dart';
part 'customer.g.dart';

@freezed
class Customer with _$Customer {
  const Customer._();

  const factory Customer({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String address,
    String? firebaseUid,
    String? appUserId,
    String? profileImageUrl,
    CustomerAppPreferences? appPreferences,
    CustomerAppMetadata? appMetadata,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  factory Customer.fromFirestore(Map<String, dynamic> data) {
    return Customer(
      id: data['ID'] ?? '',
      name: data['NAME'] ?? '',
      email: data['EMAIL'] ?? '',
      phone: data['PHONE'] ?? '',
      address: data['ADDRESS'] ?? '',
      firebaseUid: data['firebaseUid'],
      appUserId: data['appUserId'],
      profileImageUrl: data['profileImageUrl'],
      appPreferences: data['appPreferences'] != null
          ? CustomerAppPreferences.fromJson(
              Map<String, dynamic>.from(data['appPreferences']))
          : null,
      appMetadata: data['appMetadata'] != null
          ? CustomerAppMetadata.fromJson(
              Map<String, dynamic>.from(data['appMetadata']))
          : null,
      createdAt: data['CREATED_AT'] != null
          ? DateTime.parse(data['CREATED_AT'])
          : null,
      updatedAt: data['UPDATED_AT'] != null
          ? DateTime.parse(data['UPDATED_AT'])
          : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'ID': id,
      'NAME': name,
      'EMAIL': email,
      'PHONE': phone,
      'ADDRESS': address,
      'firebaseUid': firebaseUid,
      'appUserId': appUserId,
      'profileImageUrl': profileImageUrl,
      'appPreferences': appPreferences?.toJson(),
      'appMetadata': appMetadata?.toJson(),
      'CREATED_AT': createdAt?.toIso8601String(),
      'UPDATED_AT': updatedAt?.toIso8601String(),
    };
  }
}

@freezed
class CustomerAppPreferences with _$CustomerAppPreferences {
  const factory CustomerAppPreferences({
    NotificationSettings? notificationSettings,
    @Default('ja') String language,
    @Default('system') String theme,
  }) = _CustomerAppPreferences;

  factory CustomerAppPreferences.fromJson(Map<String, dynamic> json) =>
      _$CustomerAppPreferencesFromJson(json);
}

@freezed
class CustomerAppMetadata with _$CustomerAppMetadata {
  const factory CustomerAppMetadata({
    DateTime? lastLoginAt,
    String? appVersion,
    DeviceInfo? deviceInfo,
  }) = _CustomerAppMetadata;

  factory CustomerAppMetadata.fromJson(Map<String, dynamic> json) =>
      _$CustomerAppMetadataFromJson(json);
}

@freezed
class NotificationSettings with _$NotificationSettings {
  const factory NotificationSettings({
    @Default(true) bool bookingUpdates,
    @Default(true) bool messageNotifications,
    @Default(true) bool serviceReports,
    @Default(false) bool promotionalEmails,
    @Default(true) bool pushNotifications,
  }) = _NotificationSettings;

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      _$NotificationSettingsFromJson(json);
}

@freezed
class DeviceInfo with _$DeviceInfo {
  const factory DeviceInfo({
    String? platform,
    String? deviceModel,
    String? osVersion,
    String? appVersion,
  }) = _DeviceInfo;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);
}
