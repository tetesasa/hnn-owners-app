import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/customer.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/authentication_result.dart';
import '../../domain/repositories/customer_repository.dart';

class FirestoreCustomerRepository implements CustomerRepository {
  FirestoreCustomerRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  static const String _customersCollection = 'CUSTOMERS';
  static const String _ownerProfilesCollection = 'OWNER_PROFILES';
  static const String _linkingRequestsCollection = 'CUSTOMER_LINKING_REQUESTS';

  @override
  Future<Customer?> getCustomerById(String customerId) async {
    try {
      final doc = await _firestore
          .collection(_customersCollection)
          .doc(customerId)
          .get();

      if (!doc.exists || doc.data() == null) return null;

      return Customer.fromFirestore(doc.data()!);
    } catch (e) {
      throw Exception('顧客データの取得に失敗しました: $e');
    }
  }

  @override
  Future<Customer?> getCustomerByFirebaseUid(String firebaseUid) async {
    try {
      final query = await _firestore
          .collection(_customersCollection)
          .where('firebaseUid', isEqualTo: firebaseUid)
          .limit(1)
          .get();

      if (query.docs.isEmpty) return null;

      return Customer.fromFirestore(query.docs.first.data());
    } catch (e) {
      throw Exception('Firebase UIDによる顧客データの取得に失敗しました: $e');
    }
  }

  @override
  Future<List<Customer>> findCustomersByEmailAndPhone({
    required String email,
    required String phone,
    String? name,
  }) async {
    try {
      final List<Customer> results = [];

      // メールアドレスで検索
      final emailQuery = await _firestore
          .collection(_customersCollection)
          .where('EMAIL', isEqualTo: email)
          .get();

      for (final doc in emailQuery.docs) {
        if (doc.exists && doc.data().isNotEmpty) {
          results.add(Customer.fromFirestore(doc.data()));
        }
      }

      // 電話番号でも検索（重複を避ける）
      final phoneQuery = await _firestore
          .collection(_customersCollection)
          .where('PHONE', isEqualTo: phone)
          .get();

      final existingIds = results.map((c) => c.id).toSet();

      for (final doc in phoneQuery.docs) {
        if (doc.exists && doc.data().isNotEmpty) {
          final customer = Customer.fromFirestore(doc.data());
          if (!existingIds.contains(customer.id)) {
            results.add(customer);
          }
        }
      }

      // 名前でのフィルタリング（オプション）
      if (name != null && name.isNotEmpty) {
        return results.where((customer) {
          return customer.name.toLowerCase().contains(name.toLowerCase());
        }).toList();
      }

      return results;
    } catch (e) {
      throw Exception('顧客データの検索に失敗しました: $e');
    }
  }

  @override
  Future<Customer> updateCustomer(Customer customer) async {
    try {
      final updatedCustomer = customer.copyWith(
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection(_customersCollection)
          .doc(customer.id)
          .update(updatedCustomer.toFirestore());

      return updatedCustomer;
    } catch (e) {
      throw Exception('顧客データの更新に失敗しました: $e');
    }
  }

  @override
  Future<void> linkCustomerToFirebaseUser({
    required String customerId,
    required String firebaseUid,
  }) async {
    try {
      await _firestore.collection(_customersCollection).doc(customerId).update({
        'firebaseUid': firebaseUid,
        'appUserId': firebaseUid,
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('顧客とFirebaseユーザーの紐付けに失敗しました: $e');
    }
  }

  @override
  Future<UserProfile?> getUserProfile(String userId) async {
    try {
      final doc = await _firestore
          .collection(_ownerProfilesCollection)
          .doc(userId)
          .get();

      if (!doc.exists || doc.data() == null) return null;

      return UserProfile.fromJson(doc.data()!);
    } catch (e) {
      throw Exception('ユーザープロフィールの取得に失敗しました: $e');
    }
  }

  @override
  Future<UserProfile> createUserProfile(UserProfile profile) async {
    try {
      final updatedProfile = profile.copyWith(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection(_ownerProfilesCollection)
          .doc(profile.userId)
          .set(updatedProfile.toJson());

      return updatedProfile;
    } catch (e) {
      throw Exception('ユーザープロフィールの作成に失敗しました: $e');
    }
  }

  @override
  Future<UserProfile> updateUserProfile(UserProfile profile) async {
    try {
      final updatedProfile = profile.copyWith(
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection(_ownerProfilesCollection)
          .doc(profile.userId)
          .update(updatedProfile.toJson());

      return updatedProfile;
    } catch (e) {
      throw Exception('ユーザープロフィールの更新に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteUserProfile(String userId) async {
    try {
      await _firestore
          .collection(_ownerProfilesCollection)
          .doc(userId)
          .delete();
    } catch (e) {
      throw Exception('ユーザープロフィールの削除に失敗しました: $e');
    }
  }

  @override
  Future<CustomerLinkingRequest> createCustomerLinkingRequest({
    required String firebaseUid,
    required String customerId,
    String? additionalInfo,
  }) async {
    try {
      final request = CustomerLinkingRequest(
        firebaseUid: firebaseUid,
        customerId: customerId,
        additionalInfo: additionalInfo,
      );

      await _firestore
          .collection(_linkingRequestsCollection)
          .doc('${firebaseUid}_$customerId')
          .set({
        ...request.toJson(),
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      return request;
    } catch (e) {
      throw Exception('顧客紐付けリクエストの作成に失敗しました: $e');
    }
  }

  @override
  Future<List<Customer>> getPotentialCustomerMatches({
    required String email,
    required String phone,
    String? name,
  }) async {
    return findCustomersByEmailAndPhone(
      email: email,
      phone: phone,
      name: name,
    );
  }

  @override
  Stream<Customer?> watchCustomer(String customerId) {
    return _firestore
        .collection(_customersCollection)
        .doc(customerId)
        .snapshots()
        .map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return Customer.fromFirestore(doc.data()!);
    });
  }

  @override
  Stream<UserProfile?> watchUserProfile(String userId) {
    return _firestore
        .collection(_ownerProfilesCollection)
        .doc(userId)
        .snapshots()
        .map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return UserProfile.fromJson(doc.data()!);
    });
  }
}
