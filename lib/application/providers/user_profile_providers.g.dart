// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentUserProfileHash() =>
    r'92deef0b74d160e9facab83c8c72abf45cd660c8';

/// See also [currentUserProfile].
@ProviderFor(currentUserProfile)
final currentUserProfileProvider =
    AutoDisposeFutureProvider<UserProfile?>.internal(
  currentUserProfile,
  name: r'currentUserProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserProfileRef = AutoDisposeFutureProviderRef<UserProfile?>;
String _$currentUserCustomerHash() =>
    r'3e96fcefff4079927dcb1664e0e08de534127f9d';

/// See also [currentUserCustomer].
@ProviderFor(currentUserCustomer)
final currentUserCustomerProvider =
    AutoDisposeFutureProvider<Customer?>.internal(
  currentUserCustomer,
  name: r'currentUserCustomerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentUserCustomerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CurrentUserCustomerRef = AutoDisposeFutureProviderRef<Customer?>;
String _$watchUserProfileHash() => r'9c99dde0ec8d92c52b7250d7559bd99c437bcfd7';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [watchUserProfile].
@ProviderFor(watchUserProfile)
const watchUserProfileProvider = WatchUserProfileFamily();

/// See also [watchUserProfile].
class WatchUserProfileFamily extends Family<AsyncValue<UserProfile?>> {
  /// See also [watchUserProfile].
  const WatchUserProfileFamily();

  /// See also [watchUserProfile].
  WatchUserProfileProvider call(
    String userId,
  ) {
    return WatchUserProfileProvider(
      userId,
    );
  }

  @override
  WatchUserProfileProvider getProviderOverride(
    covariant WatchUserProfileProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchUserProfileProvider';
}

/// See also [watchUserProfile].
class WatchUserProfileProvider extends AutoDisposeStreamProvider<UserProfile?> {
  /// See also [watchUserProfile].
  WatchUserProfileProvider(
    String userId,
  ) : this._internal(
          (ref) => watchUserProfile(
            ref as WatchUserProfileRef,
            userId,
          ),
          from: watchUserProfileProvider,
          name: r'watchUserProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchUserProfileHash,
          dependencies: WatchUserProfileFamily._dependencies,
          allTransitiveDependencies:
              WatchUserProfileFamily._allTransitiveDependencies,
          userId: userId,
        );

  WatchUserProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<UserProfile?> Function(WatchUserProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchUserProfileProvider._internal(
        (ref) => create(ref as WatchUserProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<UserProfile?> createElement() {
    return _WatchUserProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchUserProfileProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchUserProfileRef on AutoDisposeStreamProviderRef<UserProfile?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _WatchUserProfileProviderElement
    extends AutoDisposeStreamProviderElement<UserProfile?>
    with WatchUserProfileRef {
  _WatchUserProfileProviderElement(super.provider);

  @override
  String get userId => (origin as WatchUserProfileProvider).userId;
}

String _$watchCustomerHash() => r'91509989ff16a1a648982afa5efece21284d892b';

/// See also [watchCustomer].
@ProviderFor(watchCustomer)
const watchCustomerProvider = WatchCustomerFamily();

/// See also [watchCustomer].
class WatchCustomerFamily extends Family<AsyncValue<Customer?>> {
  /// See also [watchCustomer].
  const WatchCustomerFamily();

  /// See also [watchCustomer].
  WatchCustomerProvider call(
    String customerId,
  ) {
    return WatchCustomerProvider(
      customerId,
    );
  }

  @override
  WatchCustomerProvider getProviderOverride(
    covariant WatchCustomerProvider provider,
  ) {
    return call(
      provider.customerId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'watchCustomerProvider';
}

/// See also [watchCustomer].
class WatchCustomerProvider extends AutoDisposeStreamProvider<Customer?> {
  /// See also [watchCustomer].
  WatchCustomerProvider(
    String customerId,
  ) : this._internal(
          (ref) => watchCustomer(
            ref as WatchCustomerRef,
            customerId,
          ),
          from: watchCustomerProvider,
          name: r'watchCustomerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$watchCustomerHash,
          dependencies: WatchCustomerFamily._dependencies,
          allTransitiveDependencies:
              WatchCustomerFamily._allTransitiveDependencies,
          customerId: customerId,
        );

  WatchCustomerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final String customerId;

  @override
  Override overrideWith(
    Stream<Customer?> Function(WatchCustomerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WatchCustomerProvider._internal(
        (ref) => create(ref as WatchCustomerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Customer?> createElement() {
    return _WatchCustomerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WatchCustomerProvider && other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin WatchCustomerRef on AutoDisposeStreamProviderRef<Customer?> {
  /// The parameter `customerId` of this provider.
  String get customerId;
}

class _WatchCustomerProviderElement
    extends AutoDisposeStreamProviderElement<Customer?> with WatchCustomerRef {
  _WatchCustomerProviderElement(super.provider);

  @override
  String get customerId => (origin as WatchCustomerProvider).customerId;
}

String _$getCurrentUserProfileHash() =>
    r'c098d6ae8852bb86d130484ed806ff735d4a34a8';

/// See also [getCurrentUserProfile].
@ProviderFor(getCurrentUserProfile)
final getCurrentUserProfileProvider =
    AutoDisposeFutureProvider<UserProfile?>.internal(
  getCurrentUserProfile,
  name: r'getCurrentUserProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCurrentUserProfileRef = AutoDisposeFutureProviderRef<UserProfile?>;
String _$getCurrentUserCustomerHash() =>
    r'3941f130df87fb55b57f2912dc2ad239a36ea22e';

/// See also [getCurrentUserCustomer].
@ProviderFor(getCurrentUserCustomer)
final getCurrentUserCustomerProvider =
    AutoDisposeFutureProvider<Customer?>.internal(
  getCurrentUserCustomer,
  name: r'getCurrentUserCustomerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCurrentUserCustomerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCurrentUserCustomerRef = AutoDisposeFutureProviderRef<Customer?>;
String _$userProfileNotifierHash() =>
    r'a953deaaa858bc7f0dd15a8ca68b5e0210d4acb4';

abstract class _$UserProfileNotifier
    extends BuildlessAutoDisposeAsyncNotifier<UserProfile?> {
  late final String userId;

  FutureOr<UserProfile?> build(
    String userId,
  );
}

/// See also [UserProfileNotifier].
@ProviderFor(UserProfileNotifier)
const userProfileNotifierProvider = UserProfileNotifierFamily();

/// See also [UserProfileNotifier].
class UserProfileNotifierFamily extends Family<AsyncValue<UserProfile?>> {
  /// See also [UserProfileNotifier].
  const UserProfileNotifierFamily();

  /// See also [UserProfileNotifier].
  UserProfileNotifierProvider call(
    String userId,
  ) {
    return UserProfileNotifierProvider(
      userId,
    );
  }

  @override
  UserProfileNotifierProvider getProviderOverride(
    covariant UserProfileNotifierProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userProfileNotifierProvider';
}

/// See also [UserProfileNotifier].
class UserProfileNotifierProvider extends AutoDisposeAsyncNotifierProviderImpl<
    UserProfileNotifier, UserProfile?> {
  /// See also [UserProfileNotifier].
  UserProfileNotifierProvider(
    String userId,
  ) : this._internal(
          () => UserProfileNotifier()..userId = userId,
          from: userProfileNotifierProvider,
          name: r'userProfileNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userProfileNotifierHash,
          dependencies: UserProfileNotifierFamily._dependencies,
          allTransitiveDependencies:
              UserProfileNotifierFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserProfileNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<UserProfile?> runNotifierBuild(
    covariant UserProfileNotifier notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(UserProfileNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserProfileNotifierProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserProfileNotifier, UserProfile?>
      createElement() {
    return _UserProfileNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserProfileNotifierProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserProfileNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<UserProfile?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserProfileNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserProfileNotifier,
        UserProfile?> with UserProfileNotifierRef {
  _UserProfileNotifierProviderElement(super.provider);

  @override
  String get userId => (origin as UserProfileNotifierProvider).userId;
}

String _$customerNotifierHash() => r'a8547526bcdd5c2de947c5a089017e88d1b4a486';

abstract class _$CustomerNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Customer?> {
  late final String customerId;

  FutureOr<Customer?> build(
    String customerId,
  );
}

/// See also [CustomerNotifier].
@ProviderFor(CustomerNotifier)
const customerNotifierProvider = CustomerNotifierFamily();

/// See also [CustomerNotifier].
class CustomerNotifierFamily extends Family<AsyncValue<Customer?>> {
  /// See also [CustomerNotifier].
  const CustomerNotifierFamily();

  /// See also [CustomerNotifier].
  CustomerNotifierProvider call(
    String customerId,
  ) {
    return CustomerNotifierProvider(
      customerId,
    );
  }

  @override
  CustomerNotifierProvider getProviderOverride(
    covariant CustomerNotifierProvider provider,
  ) {
    return call(
      provider.customerId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'customerNotifierProvider';
}

/// See also [CustomerNotifier].
class CustomerNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CustomerNotifier, Customer?> {
  /// See also [CustomerNotifier].
  CustomerNotifierProvider(
    String customerId,
  ) : this._internal(
          () => CustomerNotifier()..customerId = customerId,
          from: customerNotifierProvider,
          name: r'customerNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$customerNotifierHash,
          dependencies: CustomerNotifierFamily._dependencies,
          allTransitiveDependencies:
              CustomerNotifierFamily._allTransitiveDependencies,
          customerId: customerId,
        );

  CustomerNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.customerId,
  }) : super.internal();

  final String customerId;

  @override
  FutureOr<Customer?> runNotifierBuild(
    covariant CustomerNotifier notifier,
  ) {
    return notifier.build(
      customerId,
    );
  }

  @override
  Override overrideWith(CustomerNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: CustomerNotifierProvider._internal(
        () => create()..customerId = customerId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        customerId: customerId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<CustomerNotifier, Customer?>
      createElement() {
    return _CustomerNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CustomerNotifierProvider && other.customerId == customerId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, customerId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CustomerNotifierRef on AutoDisposeAsyncNotifierProviderRef<Customer?> {
  /// The parameter `customerId` of this provider.
  String get customerId;
}

class _CustomerNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<CustomerNotifier, Customer?>
    with CustomerNotifierRef {
  _CustomerNotifierProviderElement(super.provider);

  @override
  String get customerId => (origin as CustomerNotifierProvider).customerId;
}

String _$customerSearchNotifierHash() =>
    r'7c260369dda8d1e2481a846d3466ef3afcc4f7db';

/// See also [CustomerSearchNotifier].
@ProviderFor(CustomerSearchNotifier)
final customerSearchNotifierProvider = AutoDisposeNotifierProvider<
    CustomerSearchNotifier, List<Customer>>.internal(
  CustomerSearchNotifier.new,
  name: r'customerSearchNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerSearchNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CustomerSearchNotifier = AutoDisposeNotifier<List<Customer>>;
String _$profileErrorNotifierHash() =>
    r'bf1a431c415a3dd33d1519b6aeadee7045af607a';

/// See also [ProfileErrorNotifier].
@ProviderFor(ProfileErrorNotifier)
final profileErrorNotifierProvider =
    AutoDisposeNotifierProvider<ProfileErrorNotifier, String?>.internal(
  ProfileErrorNotifier.new,
  name: r'profileErrorNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileErrorNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileErrorNotifier = AutoDisposeNotifier<String?>;
String _$profileLoadingNotifierHash() =>
    r'adf9891e47392386eea9fedb459d25f8d09fbde8';

/// See also [ProfileLoadingNotifier].
@ProviderFor(ProfileLoadingNotifier)
final profileLoadingNotifierProvider =
    AutoDisposeNotifierProvider<ProfileLoadingNotifier, bool>.internal(
  ProfileLoadingNotifier.new,
  name: r'profileLoadingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileLoadingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileLoadingNotifier = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
