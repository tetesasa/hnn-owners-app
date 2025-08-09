import 'package:freezed_annotation/freezed_annotation.dart';
import '../enums/user_role.dart';
import '../enums/permission.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String email,
    String? displayName,
    String? photoURL,
    @Default(UserRole.owner) UserRole role,
    @Default([]) List<Permission> permissions,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? emailVerified,
    String? customerId,
    Map<String, dynamic>? customClaims,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String userId,
    required String customerId,
    String? displayName,
    String? bio,
    String? profileImageUrl,
    EmergencyContact? emergencyContact,
    String? specialInstructions,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}

@freezed
class EmergencyContact with _$EmergencyContact {
  const factory EmergencyContact({
    required String name,
    required String phone,
    String? relationship,
  }) = _EmergencyContact;

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$EmergencyContactFromJson(json);
}
