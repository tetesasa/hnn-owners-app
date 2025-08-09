import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/customer.dart';
import 'auth_providers.dart';

part 'user_profile_providers.g.dart';

// ユーザープロフィール管理
@riverpod
class UserProfileNotifier extends _$UserProfileNotifier {
  @override
  Future<UserProfile?> build(String userId) async {
    final customerRepo = ref.watch(customerRepositoryProvider);
    return await customerRepo.getUserProfile(userId);
  }

  Future<UserProfile> updateProfile(UserProfile profile) async {
    final customerRepo = ref.read(customerRepositoryProvider);
    final updatedProfile = await customerRepo.updateUserProfile(profile);

    // 状態を更新
    ref.invalidateSelf();

    return updatedProfile;
  }

  Future<UserProfile> createProfile(UserProfile profile) async {
    final customerRepo = ref.read(customerRepositoryProvider);
    final createdProfile = await customerRepo.createUserProfile(profile);

    // 状態を更新
    ref.invalidateSelf();

    return createdProfile;
  }

  Future<void> deleteProfile() async {
    final customerRepo = ref.read(customerRepositoryProvider);
    await customerRepo.deleteUserProfile(userId);

    // 状態を更新
    ref.invalidateSelf();
  }
}

// 現在のユーザーのプロフィール
@riverpod
Future<UserProfile?> currentUserProfile(Ref ref) async {
  final authState = ref.watch(authStateChangesProvider);

  return authState.when(
    data: (user) async {
      if (user == null) return null;
      return ref.watch(userProfileNotifierProvider(user.uid).future);
    },
    loading: () => null,
    error: (_, __) => null,
  );
}

// 顧客データ管理
@riverpod
class CustomerNotifier extends _$CustomerNotifier {
  @override
  Future<Customer?> build(String customerId) async {
    final customerRepo = ref.watch(customerRepositoryProvider);
    return await customerRepo.getCustomerById(customerId);
  }

  Future<Customer> updateCustomer(Customer customer) async {
    final customerRepo = ref.read(customerRepositoryProvider);
    final updatedCustomer = await customerRepo.updateCustomer(customer);

    // 状態を更新
    ref.invalidateSelf();

    return updatedCustomer;
  }
}

// 現在のユーザーの顧客データ
@riverpod
Future<Customer?> currentUserCustomer(Ref ref) async {
  final authState = ref.watch(authStateChangesProvider);

  return authState.when(
    data: (user) async {
      if (user?.customerId == null) return null;
      return ref.watch(customerNotifierProvider(user!.customerId!).future);
    },
    loading: () => null,
    error: (_, __) => null,
  );
}

// 顧客検索プロバイダー
@riverpod
class CustomerSearchNotifier extends _$CustomerSearchNotifier {
  @override
  List<Customer> build() => [];

  Future<void> searchCustomers({
    required String email,
    required String phone,
    String? name,
  }) async {
    final customerRepo = ref.read(customerRepositoryProvider);
    final results = await customerRepo.findCustomersByEmailAndPhone(
      email: email,
      phone: phone,
      name: name,
    );

    state = results;
  }

  void clearResults() {
    state = [];
  }
}

// ストリームベースのプロバイダー（リアルタイム更新用）
@riverpod
Stream<UserProfile?> watchUserProfile(Ref ref, String userId) {
  final customerRepo = ref.watch(customerRepositoryProvider);
  return customerRepo.watchUserProfile(userId);
}

@riverpod
Stream<Customer?> watchCustomer(Ref ref, String customerId) {
  final customerRepo = ref.watch(customerRepositoryProvider);
  return customerRepo.watchCustomer(customerId);
}

// 現在のユーザーのリアルタイムデータ
@riverpod
Future<UserProfile?> getCurrentUserProfile(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user == null) return null;

  final customerRepo = ref.watch(customerRepositoryProvider);
  return await customerRepo.getUserProfile(user.uid);
}

@riverpod
Future<Customer?> getCurrentUserCustomer(Ref ref) async {
  final user = ref.watch(authStateChangesProvider).valueOrNull;
  if (user?.customerId == null) return null;

  final customerRepo = ref.watch(customerRepositoryProvider);
  return await customerRepo.getCustomerById(user!.customerId!);
}

// エラーハンドリング用プロバイダー
@riverpod
class ProfileErrorNotifier extends _$ProfileErrorNotifier {
  @override
  String? build() => null;

  void setError(String error) {
    state = error;
  }

  void clearError() {
    state = null;
  }
}

// ローディング状態管理
@riverpod
class ProfileLoadingNotifier extends _$ProfileLoadingNotifier {
  @override
  bool build() => false;

  void setLoading(bool loading) {
    state = loading;
  }
}
