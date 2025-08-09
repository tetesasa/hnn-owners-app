import 'package:flutter_test/flutter_test.dart';
import 'package:hnn_owners/domain/entities/user.dart';
import 'package:hnn_owners/domain/enums/user_role.dart';
import 'package:hnn_owners/domain/enums/permission.dart';

void main() {
  group('User Entity Tests', () {
    test('User creation with required fields', () {
      // Arrange & Act
      const user = User(
        uid: 'test-uid-123',
        email: 'test@example.com',
      );

      // Assert
      expect(user.uid, equals('test-uid-123'));
      expect(user.email, equals('test@example.com'));
      expect(user.role, equals(UserRole.owner)); // default value
      expect(user.permissions, isEmpty); // default empty list
      expect(user.displayName, isNull);
      expect(user.photoURL, isNull);
    });

    test('User creation with all fields', () {
      // Arrange
      final createdAt = DateTime.now();
      final updatedAt = DateTime.now().add(Duration(hours: 1));
      const customClaims = {'isVip': true, 'subscription': 'premium'};

      // Act
      final user = User(
        uid: 'test-uid-456',
        email: 'premium@example.com',
        displayName: 'Premium User',
        photoURL: 'https://example.com/photo.jpg',
        role: UserRole.staff, // adminは存在しないためstaffで代替
        permissions: [Permission.viewReports, Permission.createBooking],
        createdAt: createdAt,
        updatedAt: updatedAt,
        emailVerified: true,
        customerId: 'customer-123',
        customClaims: customClaims,
      );

      // Assert
      expect(user.uid, equals('test-uid-456'));
      expect(user.email, equals('premium@example.com'));
      expect(user.displayName, equals('Premium User'));
      expect(user.photoURL, equals('https://example.com/photo.jpg'));
      expect(user.role, equals(UserRole.staff));
      expect(user.permissions, contains(Permission.createBooking));
      expect(user.permissions, contains(Permission.viewReports));
      expect(user.createdAt, equals(createdAt));
      expect(user.updatedAt, equals(updatedAt));
      expect(user.emailVerified, isTrue);
      expect(user.customerId, equals('customer-123'));
      expect(user.customClaims, equals(customClaims));
    });

    test('User copyWith method', () {
      // Arrange
      const originalUser = User(
        uid: 'test-uid-789',
        email: 'original@example.com',
        displayName: 'Original User',
      );

      // Act
      final updatedUser = originalUser.copyWith(
        displayName: 'Updated User',
        emailVerified: true,
      );

      // Assert
      expect(updatedUser.uid, equals('test-uid-789')); // unchanged
      expect(updatedUser.email, equals('original@example.com')); // unchanged
      expect(updatedUser.displayName, equals('Updated User')); // changed
      expect(updatedUser.emailVerified, isTrue); // changed
    });

    test('User JSON serialization', () {
      // Arrange
      const user = User(
        uid: 'test-uid-json',
        email: 'json@example.com',
        displayName: 'JSON User',
        role: UserRole.owner,
        emailVerified: true,
      );

      // Act
      final json = user.toJson();

      // Assert
      expect(json['uid'], equals('test-uid-json'));
      expect(json['email'], equals('json@example.com'));
      expect(json['displayName'], equals('JSON User'));
      expect(json['role'], equals('owner'));
      expect(json['emailVerified'], isTrue);
    });

    test('User JSON deserialization', () {
      // Arrange
      final json = {
        'uid': 'test-uid-from-json',
        'email': 'fromjson@example.com',
        'displayName': 'From JSON User',
        'role': 'admin',
        'permissions': ['manage_bookings', 'view_reports'],
        'emailVerified': true,
        'customerId': 'customer-from-json',
      };

      // Act
      final user = User.fromJson(json);

      // Assert
      expect(user.uid, equals('test-uid-from-json'));
      expect(user.email, equals('fromjson@example.com'));
      expect(user.displayName, equals('From JSON User'));
      expect(user.role, equals(UserRole.staff));
      expect(user.permissions, contains(Permission.createBooking));
      expect(user.permissions, contains(Permission.viewReports));
      expect(user.emailVerified, isTrue);
      expect(user.customerId, equals('customer-from-json'));
    });

    test('User equality', () {
      // Arrange
      const user1 = User(
        uid: 'same-uid',
        email: 'same@example.com',
        displayName: 'Same User',
      );

      const user2 = User(
        uid: 'same-uid',
        email: 'same@example.com',
        displayName: 'Same User',
      );

      const user3 = User(
        uid: 'different-uid',
        email: 'same@example.com',
        displayName: 'Same User',
      );

      // Act & Assert
      expect(user1, equals(user2)); // should be equal
      expect(user1, isNot(equals(user3))); // should not be equal
      expect(user1.hashCode, equals(user2.hashCode)); // hash codes should match
    });
  });

  group('UserProfile Entity Tests', () {
    test('UserProfile creation with required fields', () {
      // Arrange & Act
      const profile = UserProfile(
        userId: 'profile-uid-123',
        customerId: 'customer-123',
        displayName: 'Profile User',
        bio: 'プロフィールの説明',
      );

      // Assert
      expect(profile.userId, equals('profile-uid-123'));
      expect(profile.customerId, equals('customer-123'));
      expect(profile.displayName, equals('Profile User'));
      expect(profile.bio, equals('プロフィールの説明'));
      expect(profile.profileImageUrl, isNull);
      expect(profile.emergencyContact, isNull);
    });

    test('UserProfile with emergency contact', () {
      // Arrange
      const emergencyContact = EmergencyContact(
        name: 'Emergency Person',
        phone: '090-1234-5678',
        relationship: 'Family',
      );

      // Act
      const profile = UserProfile(
        userId: 'profile-uid-456',
        customerId: 'customer-456',
        displayName: 'Profile User',
        bio: 'プロフィールの説明',
        emergencyContact: emergencyContact,
      );

      // Assert
      expect(profile.emergencyContact, isNotNull);
      expect(profile.emergencyContact!.name, equals('Emergency Person'));
      expect(profile.emergencyContact!.phone, equals('090-1234-5678'));
      expect(profile.emergencyContact!.relationship, equals('Family'));
    });

    test('UserProfile JSON serialization/deserialization', () {
      // Arrange
      const emergencyContact = EmergencyContact(
        name: 'Contact Person',
        phone: '070-1111-2222',
      );

      const originalProfile = UserProfile(
        userId: 'json-profile-uid',
        customerId: 'json-customer-id',
        displayName: 'JSON Profile',
        bio: 'JSONプロフィールの説明',
        emergencyContact: emergencyContact,
      );

      // Act
      final json = originalProfile.toJson();
      final deserializedProfile = UserProfile.fromJson(json);

      // Assert
      expect(deserializedProfile.userId, equals(originalProfile.userId));
      expect(
          deserializedProfile.customerId, equals(originalProfile.customerId));
      expect(
          deserializedProfile.displayName, equals(originalProfile.displayName));
      expect(deserializedProfile.bio, equals(originalProfile.bio));
      expect(
          deserializedProfile.emergencyContact?.name, equals('Contact Person'));
      expect(
          deserializedProfile.emergencyContact?.phone, equals('070-1111-2222'));
    });
  });

  group('EmergencyContact Entity Tests', () {
    test('EmergencyContact creation', () {
      // Arrange & Act
      const contact = EmergencyContact(
        name: 'Emergency Contact Name',
        phone: '090-5555-6666',
        relationship: 'Spouse',
      );

      // Assert
      expect(contact.name, equals('Emergency Contact Name'));
      expect(contact.phone, equals('090-5555-6666'));
      expect(contact.relationship, equals('Spouse'));
    });

    test('EmergencyContact without relationship', () {
      // Arrange & Act
      const contact = EmergencyContact(
        name: 'Contact Without Relation',
        phone: '080-7777-8888',
      );

      // Assert
      expect(contact.name, equals('Contact Without Relation'));
      expect(contact.phone, equals('080-7777-8888'));
      expect(contact.relationship, isNull);
    });

    test('EmergencyContact JSON operations', () {
      // Arrange
      const contact = EmergencyContact(
        name: 'JSON Contact',
        phone: '070-9999-0000',
        relationship: 'Friend',
      );

      // Act
      final json = contact.toJson();
      final fromJson = EmergencyContact.fromJson(json);

      // Assert
      expect(fromJson.name, equals(contact.name));
      expect(fromJson.phone, equals(contact.phone));
      expect(fromJson.relationship, equals(contact.relationship));
    });
  });
}
