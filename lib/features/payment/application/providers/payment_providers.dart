// ignore_for_file: unused_import

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/payment_intent.dart';
import '../../domain/entities/payment_method.dart';
import '../../domain/repositories/payment_repository.dart';
import '../../domain/usecases/process_payment_usecase.dart';
import '../../data/repositories/stripe_payment_repository_impl.dart';
import '../../data/repositories/firestore_invoice_repository.dart';
import '../../data/repositories/firestore_booking_payment_repository.dart';
import '../../../../core/error/result.dart';

part 'payment_providers.g.dart';

@riverpod
class PaymentState extends _$PaymentState {
  @override
  AsyncValue<PaymentIntent?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> createPaymentIntent({
    required String bookingId,
    required String customerId,
    required int amount,
    required String currency,
    String? description,
  }) async {
    state = const AsyncValue.loading();

    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.createPaymentIntent(
      amount: amount,
      currency: currency,
      customerId: customerId,
      description: description,
      bookingId: bookingId,
      metadata: {
        'booking_id': bookingId,
        'customer_id': customerId,
        'created_from': 'mobile_app',
      },
    );

    result.when(
      success: (paymentIntent) {
        state = AsyncValue.data(paymentIntent);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  Future<void> confirmPaymentIntent({
    required String paymentIntentId,
    required String paymentMethodId,
  }) async {
    state = const AsyncValue.loading();

    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.confirmPaymentIntent(
      paymentIntentId: paymentIntentId,
      paymentMethodId: paymentMethodId,
    );

    result.when(
      success: (paymentIntent) {
        state = AsyncValue.data(paymentIntent);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  Future<void> updatePaymentIntent({
    required String paymentIntentId,
    int? amount,
    String? description,
  }) async {
    if (state.value == null) return;

    state = const AsyncValue.loading();

    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.updatePaymentIntent(
      paymentIntentId: paymentIntentId,
      amount: amount,
      description: description,
    );

    result.when(
      success: (paymentIntent) {
        state = AsyncValue.data(paymentIntent);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  Future<void> cancelPaymentIntent(String paymentIntentId) async {
    state = const AsyncValue.loading();

    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.cancelPaymentIntent(paymentIntentId);

    result.when(
      success: (paymentIntent) {
        state = AsyncValue.data(paymentIntent);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  void clearPaymentIntent() {
    state = const AsyncValue.data(null);
  }
}

@riverpod
class PaymentMethodsState extends _$PaymentMethodsState {
  @override
  AsyncValue<List<PaymentMethod>> build() {
    return const AsyncValue.data([]);
  }

  Future<void> loadCustomerPaymentMethods(String customerId) async {
    state = const AsyncValue.loading();

    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.getCustomerPaymentMethods(customerId);

    result.when(
      success: (paymentMethods) {
        state = AsyncValue.data(paymentMethods);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  Future<PaymentMethod?> createPaymentMethod({
    required PaymentMethodType type,
    required String customerId,
    Map<String, dynamic>? cardData,
  }) async {
    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.createPaymentMethod(
      type: type,
      customerId: customerId,
      cardData: cardData,
    );

    return result.when(
      success: (paymentMethod) {
        // 既存のリストに新しいPaymentMethodを追加
        final currentMethods = state.value ?? [];
        state = AsyncValue.data([paymentMethod, ...currentMethods]);
        return paymentMethod;
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
        return null;
      },
    );
  }

  Future<void> setDefaultPaymentMethod({
    required String customerId,
    required String paymentMethodId,
  }) async {
    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.setDefaultPaymentMethod(
      customerId: customerId,
      paymentMethodId: paymentMethodId,
    );

    result.when(
      success: (_) {
        // PaymentMethodリストを再読み込み
        loadCustomerPaymentMethods(customerId);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }
}

@riverpod
ProcessPaymentUseCase processPaymentUseCase(Ref ref) {
  return ProcessPaymentUseCase(
    paymentRepository: ref.watch(paymentRepositoryProvider),
    invoiceRepository: ref.watch(invoiceRepositoryProvider),
    bookingRepository: ref.watch(bookingPaymentRepositoryProvider),
  );
}

@riverpod
class PaymentProcessState extends _$PaymentProcessState {
  @override
  AsyncValue<PaymentProcessResult?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> processPayment(PaymentProcessRequest request) async {
    state = const AsyncValue.loading();

    final useCase = ref.read(processPaymentUseCaseProvider);
    final result = await useCase.call(request);

    result.when(
      success: (processResult) {
        state = AsyncValue.data(processResult);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  void clearPaymentProcess() {
    state = const AsyncValue.data(null);
  }
}

// 決済履歴プロバイダー
@riverpod
class PaymentHistoryState extends _$PaymentHistoryState {
  @override
  AsyncValue<List<PaymentIntent>> build() {
    return const AsyncValue.data([]);
  }

  Future<void> loadPaymentHistory({
    required String customerId,
    int limit = 20,
  }) async {
    state = const AsyncValue.loading();

    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.getPaymentHistory(
      customerId: customerId,
      limit: limit,
    );

    result.when(
      success: (paymentHistory) {
        state = AsyncValue.data(paymentHistory);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  void clearPaymentHistory() {
    state = const AsyncValue.data([]);
  }
}

// 顧客ストライプID管理
@riverpod
class CustomerStripeIdState extends _$CustomerStripeIdState {
  @override
  AsyncValue<String?> build() {
    return const AsyncValue.data(null);
  }

  Future<void> createStripeCustomer({
    required String email,
    String? name,
    String? phone,
  }) async {
    state = const AsyncValue.loading();

    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.createCustomer(
      email: email,
      name: name,
      phone: phone,
      metadata: {
        'app': 'hnn_owners',
        'platform': 'mobile',
      },
    );

    result.when(
      success: (customerId) {
        state = AsyncValue.data(customerId);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  Future<void> loadStripeCustomer(String customerId) async {
    state = const AsyncValue.loading();

    final repository = ref.read(paymentRepositoryProvider);
    final result = await repository.getCustomer(customerId);

    result.when(
      success: (customer) {
        state = AsyncValue.data(customer['id'] as String);
      },
      failure: (error) {
        state = AsyncValue.error(error, StackTrace.current);
      },
    );
  }

  void setStripeCustomerId(String customerId) {
    state = AsyncValue.data(customerId);
  }

  void clearStripeCustomerId() {
    state = const AsyncValue.data(null);
  }
}
