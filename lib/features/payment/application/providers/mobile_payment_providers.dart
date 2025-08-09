import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../../domain/entities/mobile_payment_config.dart';
import '../../domain/repositories/mobile_payment_repository.dart';
import '../../data/repositories/pay_plugin_mobile_payment_repository.dart';
import '../../../../core/error/result.dart';

/// モバイル決済設定プロバイダー
final mobilePaymentConfigProvider = StateProvider<MobilePaymentConfig>((ref) {
  // デフォルトは開発環境設定
  return MobilePaymentConfig.development();
});

/// モバイル決済リポジトリプロバイダー
final mobilePaymentRepositoryProvider =
    Provider<MobilePaymentRepository>((ref) {
  final config = ref.watch(mobilePaymentConfigProvider);
  return PayPluginMobilePaymentRepository(config: config);
});

/// Apple Pay利用可能性プロバイダー
final applePayAvailabilityProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(mobilePaymentRepositoryProvider);
  final result = await repository.isApplePaySupported();

  if (result.isSuccess) {
    return result.data!;
  }

  Logger('ApplePayAvailability')
      .warning('Failed to check Apple Pay availability: ${result.error}');
  return false;
});

/// Google Pay利用可能性プロバイダー
final googlePayAvailabilityProvider = FutureProvider<bool>((ref) async {
  final repository = ref.watch(mobilePaymentRepositoryProvider);
  final result = await repository.isGooglePaySupported();

  if (result.isSuccess) {
    return result.data!;
  }

  Logger('GooglePayAvailability')
      .warning('Failed to check Google Pay availability: ${result.error}');
  return false;
});

/// 決済方法利用可能性プロバイダー
final paymentMethodAvailabilityProvider =
    FutureProvider<Map<PaymentMethodType, bool>>((ref) async {
  final repository = ref.watch(mobilePaymentRepositoryProvider);
  final result = await repository.checkPaymentMethodAvailability();

  if (result.isSuccess) {
    return result.data!;
  }

  Logger('PaymentMethodAvailability')
      .warning('Failed to check payment method availability: ${result.error}');
  return <PaymentMethodType, bool>{
    PaymentMethodType.applePay: false,
    PaymentMethodType.googlePay: false,
    PaymentMethodType.creditCard: true,
  };
});

/// モバイル決済実行プロバイダー
final mobilePaymentProvider = StateNotifierProvider<MobilePaymentNotifier,
    AsyncValue<MobilePaymentResult?>>((ref) {
  final repository = ref.watch(mobilePaymentRepositoryProvider);
  final config = ref.watch(mobilePaymentConfigProvider);
  return MobilePaymentNotifier(repository, config);
});

/// モバイル決済状態管理
class MobilePaymentNotifier
    extends StateNotifier<AsyncValue<MobilePaymentResult?>> {
  final MobilePaymentRepository _repository;
  final MobilePaymentConfig _config;
  static final Logger _logger = Logger('MobilePaymentNotifier');

  MobilePaymentNotifier(this._repository, this._config)
      : super(const AsyncValue.data(null));

  /// Apple Pay決済を実行
  Future<void> processApplePayPayment(List<PaymentItem> paymentItems) async {
    if (_config.applePay == null) {
      _logger.warning('Apple Pay configuration is not available');
      state = AsyncValue.error(
        'Apple Pay configuration is not available',
        StackTrace.current,
      );
      return;
    }

    try {
      state = const AsyncValue.loading();

      final result = await _repository.processApplePayPayment(
        config: _config.applePay!,
        paymentItems: paymentItems,
        currencyCode: _config.currency,
      );

      if (result.isSuccess) {
        state = AsyncValue.data(result.data!);
        _logger.info('Apple Pay payment completed successfully');
      } else {
        state = AsyncValue.error(result.error!, StackTrace.current);
        _logger.severe('Apple Pay payment failed: ${result.error}');
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      _logger.severe('Apple Pay payment error: $e');
    }
  }

  /// Google Pay決済を実行
  Future<void> processGooglePayPayment(List<PaymentItem> paymentItems) async {
    if (_config.googlePay == null) {
      _logger.warning('Google Pay configuration is not available');
      state = AsyncValue.error(
        'Google Pay configuration is not available',
        StackTrace.current,
      );
      return;
    }

    try {
      state = const AsyncValue.loading();

      final result = await _repository.processGooglePayPayment(
        config: _config.googlePay!,
        paymentItems: paymentItems,
        currencyCode: _config.currency,
      );

      if (result.isSuccess) {
        state = AsyncValue.data(result.data!);
        _logger.info('Google Pay payment completed successfully');
      } else {
        state = AsyncValue.error(result.error!, StackTrace.current);
        _logger.severe('Google Pay payment failed: ${result.error}');
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      _logger.severe('Google Pay payment error: $e');
    }
  }

  /// 決済をリセット
  void resetPayment() {
    state = const AsyncValue.data(null);
  }

  /// 決済設定を更新
  Future<void> updateConfig(MobilePaymentConfig newConfig) async {
    try {
      final result = await _repository.updatePaymentConfiguration(newConfig);

      if (result.isSuccess) {
        _logger.info('Payment configuration updated successfully');
      } else {
        _logger
            .warning('Failed to update payment configuration: ${result.error}');
      }
    } catch (e) {
      _logger.severe('Error updating payment configuration: $e');
    }
  }
}

/// 決済履歴プロバイダー
final paymentHistoryProvider =
    FutureProvider.family<List<MobilePaymentResult>, PaymentHistoryParams>(
        (ref, params) async {
  final repository = ref.watch(mobilePaymentRepositoryProvider);

  final result = await repository.getPaymentHistory(
    startDate: params.startDate,
    endDate: params.endDate,
    limit: params.limit,
  );

  if (result.isSuccess) {
    return result.data!;
  }

  throw result.error!;
});

/// 決済状態監視プロバイダー
final paymentStatusProvider =
    StreamProvider.family<PaymentStatus, String>((ref, paymentId) {
  final repository = ref.watch(mobilePaymentRepositoryProvider);
  return repository.watchPaymentStatus(paymentId);
});

/// 特定の決済方法が設定済みかチェックするプロバイダー
final paymentSetupStatusProvider =
    FutureProvider.family<bool, PaymentMethodType>((ref, paymentType) async {
  final repository = ref.watch(mobilePaymentRepositoryProvider);
  final result = await repository.isPaymentSetupCompleted(paymentType);

  if (result.isSuccess) {
    return result.data!;
  }

  return false;
});

/// 決済設定画面を開くプロバイダー
final openPaymentSetupProvider =
    FutureProvider.family<void, PaymentMethodType>((ref, paymentType) async {
  final repository = ref.watch(mobilePaymentRepositoryProvider);
  final result = await repository.openPaymentSetup(paymentType);

  if (result.isFailure) {
    throw result.error!;
  }
});

/// 決済履歴検索パラメータ
class PaymentHistoryParams {
  final DateTime? startDate;
  final DateTime? endDate;
  final int limit;

  const PaymentHistoryParams({
    this.startDate,
    this.endDate,
    this.limit = 50,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentHistoryParams &&
          runtimeType == other.runtimeType &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          limit == other.limit;

  @override
  int get hashCode => startDate.hashCode ^ endDate.hashCode ^ limit.hashCode;
}

/// 決済エラーハンドリングプロバイダー
final paymentErrorHandlerProvider =
    Provider<MobilePaymentError Function(dynamic)>((ref) {
  final repository = ref.watch(mobilePaymentRepositoryProvider);
  return repository.handlePaymentError;
});

/// 決済設定の妥当性チェックプロバイダー
final paymentConfigValidationProvider = Provider<bool>((ref) {
  final config = ref.watch(mobilePaymentConfigProvider);

  // 基本的な設定チェック
  if (config.merchantDisplayName == null ||
      config.merchantDisplayName!.isEmpty) {
    return false;
  }

  if (config.currency.isEmpty) {
    return false;
  }

  // Apple Pay設定チェック
  if (config.isApplePaySupported) {
    final applePay = config.applePay!;
    if (applePay.merchantId.isEmpty ||
        applePay.countryCode.isEmpty ||
        applePay.currencyCode.isEmpty) {
      return false;
    }
  }

  // Google Pay設定チェック
  if (config.isGooglePaySupported) {
    final googlePay = config.googlePay!;
    if (googlePay.merchantId.isEmpty ||
        googlePay.countryCode.isEmpty ||
        googlePay.currencyCode.isEmpty) {
      return false;
    }
  }

  return true;
});

/// デバイス固有の決済機能サポート状況プロバイダー
final devicePaymentCapabilitiesProvider =
    FutureProvider<DevicePaymentCapabilities>((ref) async {
  final applePayAvailable = ref.watch(applePayAvailabilityProvider);
  final googlePayAvailable = ref.watch(googlePayAvailabilityProvider);

  return DevicePaymentCapabilities(
    applePaySupported: applePayAvailable.value ?? false,
    googlePaySupported: googlePayAvailable.value ?? false,
    nfcSupported: true, // NFC機能の詳細チェックは実装を簡略化
    biometricSupported: true, // 生体認証の詳細チェックは実装を簡略化
  );
});

/// デバイスの決済機能サポート状況
class DevicePaymentCapabilities {
  final bool applePaySupported;
  final bool googlePaySupported;
  final bool nfcSupported;
  final bool biometricSupported;

  const DevicePaymentCapabilities({
    required this.applePaySupported,
    required this.googlePaySupported,
    required this.nfcSupported,
    required this.biometricSupported,
  });

  /// いずれかのモバイル決済が利用可能かチェック
  bool get hasAnyMobilePaymentSupport =>
      applePaySupported || googlePaySupported;

  /// セキュア決済が可能かチェック
  bool get isSecurePaymentCapable =>
      (applePaySupported || googlePaySupported) && biometricSupported;
}
