// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$processPaymentUseCaseHash() =>
    r'27b7895bdffc21bcc2334052c095e78935ffa59c';

/// See also [processPaymentUseCase].
@ProviderFor(processPaymentUseCase)
final processPaymentUseCaseProvider =
    AutoDisposeProvider<ProcessPaymentUseCase>.internal(
  processPaymentUseCase,
  name: r'processPaymentUseCaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$processPaymentUseCaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProcessPaymentUseCaseRef
    = AutoDisposeProviderRef<ProcessPaymentUseCase>;
String _$paymentStateHash() => r'39a6c72c2067a97e746e3bcaa70a0dab7ec34eb2';

/// See also [PaymentState].
@ProviderFor(PaymentState)
final paymentStateProvider = AutoDisposeNotifierProvider<PaymentState,
    AsyncValue<PaymentIntent?>>.internal(
  PaymentState.new,
  name: r'paymentStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$paymentStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentState = AutoDisposeNotifier<AsyncValue<PaymentIntent?>>;
String _$paymentMethodsStateHash() =>
    r'd146b23b5149e8892a68afc402c6a841b44e4c4b';

/// See also [PaymentMethodsState].
@ProviderFor(PaymentMethodsState)
final paymentMethodsStateProvider = AutoDisposeNotifierProvider<
    PaymentMethodsState, AsyncValue<List<PaymentMethod>>>.internal(
  PaymentMethodsState.new,
  name: r'paymentMethodsStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentMethodsStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentMethodsState
    = AutoDisposeNotifier<AsyncValue<List<PaymentMethod>>>;
String _$paymentProcessStateHash() =>
    r'b59cb82518b741b41a259f6c4e4d3c06f7c35f81';

/// See also [PaymentProcessState].
@ProviderFor(PaymentProcessState)
final paymentProcessStateProvider = AutoDisposeNotifierProvider<
    PaymentProcessState, AsyncValue<PaymentProcessResult?>>.internal(
  PaymentProcessState.new,
  name: r'paymentProcessStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentProcessStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentProcessState
    = AutoDisposeNotifier<AsyncValue<PaymentProcessResult?>>;
String _$paymentHistoryStateHash() =>
    r'd441373704ea06a7b13b84a659754d0b052ccf7b';

/// See also [PaymentHistoryState].
@ProviderFor(PaymentHistoryState)
final paymentHistoryStateProvider = AutoDisposeNotifierProvider<
    PaymentHistoryState, AsyncValue<List<PaymentIntent>>>.internal(
  PaymentHistoryState.new,
  name: r'paymentHistoryStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentHistoryStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentHistoryState
    = AutoDisposeNotifier<AsyncValue<List<PaymentIntent>>>;
String _$customerStripeIdStateHash() =>
    r'cbbd40b4f55d7c59ba701c7a9d0e146d2473ed7f';

/// See also [CustomerStripeIdState].
@ProviderFor(CustomerStripeIdState)
final customerStripeIdStateProvider = AutoDisposeNotifierProvider<
    CustomerStripeIdState, AsyncValue<String?>>.internal(
  CustomerStripeIdState.new,
  name: r'customerStripeIdStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$customerStripeIdStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CustomerStripeIdState = AutoDisposeNotifier<AsyncValue<String?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
