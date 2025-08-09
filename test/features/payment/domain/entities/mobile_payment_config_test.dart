import 'package:flutter_test/flutter_test.dart';
import 'package:hnn_owners/features/payment/domain/entities/mobile_payment_config.dart';

void main() {
  group('MobilePaymentConfig', () {
    test('should create development configuration correctly', () {
      final config = MobilePaymentConfig.development();

      expect(config.environment, PaymentEnvironment.test);
      expect(config.currency, 'JPY');
      expect(config.merchantDisplayName, 'HNN Cat Home Service');
      expect(config.isApplePaySupported, true);
      expect(config.isGooglePaySupported, true);
      expect(config.isTest, true);
      expect(config.isProduction, false);
    });

    test('should create production configuration correctly', () {
      final config = MobilePaymentConfig.production();

      expect(config.environment, PaymentEnvironment.production);
      expect(config.currency, 'JPY');
      expect(config.merchantDisplayName, 'HNN Cat Home Service');
      expect(config.isApplePaySupported, true);
      expect(config.isGooglePaySupported, true);
      expect(config.isTest, false);
      expect(config.isProduction, true);
    });

    test('should serialize to JSON correctly', () {
      final config = MobilePaymentConfig.development();
      final json = config.toJson();

      expect(json['currency'], 'JPY');
      expect(json['environment'], 'test');
      expect(json['merchantDisplayName'], 'HNN Cat Home Service');
      expect(json.containsKey('applePay'), true);
      expect(json.containsKey('googlePay'), true);
    });

    test('should deserialize from JSON correctly', () {
      final json = {
        'applePay': {
          'merchantId': 'merchant.test',
          'countryCode': 'JP',
          'currencyCode': 'JPY',
          'merchantCapabilities': ['capability3DS'],
          'supportedNetworks': ['visa'],
        },
        'googlePay': {
          'merchantId': 'merchant.test',
          'environment': 'test',
          'countryCode': 'JP',
          'currencyCode': 'JPY',
          'allowedCardNetworks': ['visa'],
          'allowedCardAuthMethods': ['panOnly'],
        },
        'currency': 'JPY',
        'environment': 'test',
        'supportedMethods': ['applePay', 'googlePay'],
      };

      final config = MobilePaymentConfig.fromJson(json);

      expect(config.currency, 'JPY');
      expect(config.environment, PaymentEnvironment.test);
      expect(config.applePay?.merchantId, 'merchant.test');
      expect(config.googlePay?.merchantId, 'merchant.test');
    });
  });

  group('PaymentItem', () {
    test('should create payment item correctly', () {
      const item = PaymentItem(
        label: 'Pet Care Service',
        amount: '5000',
        type: PaymentItemType.finalItem,
      );

      expect(item.label, 'Pet Care Service');
      expect(item.amount, '5000');
      expect(item.type, PaymentItemType.finalItem);
    });

    test('should serialize to JSON correctly', () {
      const item = PaymentItem(
        label: 'Pet Care Service',
        amount: '5000',
        type: PaymentItemType.finalItem,
      );

      final json = item.toJson();

      expect(json['label'], 'Pet Care Service');
      expect(json['amount'], '5000');
      expect(json['type'], 'finalItem');
    });
  });

  group('MobilePaymentResult', () {
    test('should create payment result correctly', () {
      const result = MobilePaymentResult(
        paymentMethodId: 'pm_test_123',
        type: PaymentMethodType.applePay,
        token: 'token_test_abc',
        transactionId: 'txn_test_xyz',
      );

      expect(result.paymentMethodId, 'pm_test_123');
      expect(result.type, PaymentMethodType.applePay);
      expect(result.token, 'token_test_abc');
      expect(result.transactionId, 'txn_test_xyz');
      expect(result.isApplePay, true);
      expect(result.isGooglePay, false);
    });

    test('should identify Google Pay correctly', () {
      const result = MobilePaymentResult(
        paymentMethodId: 'pm_test_123',
        type: PaymentMethodType.googlePay,
        token: 'token_test_abc',
      );

      expect(result.isApplePay, false);
      expect(result.isGooglePay, true);
    });
  });

  group('MobilePaymentError', () {
    test('should create error with correct type and message', () {
      const error = MobilePaymentError(
        type: MobilePaymentErrorType.userCancelled,
        message: 'User cancelled the payment',
        code: 'user_cancelled',
      );

      expect(error.type, MobilePaymentErrorType.userCancelled);
      expect(error.message, 'User cancelled the payment');
      expect(error.code, 'user_cancelled');
    });

    test('should return correct display message for error types', () {
      expect(
        MobilePaymentErrorType.deviceNotSupported.displayMessage,
        'このデバイスでは利用できません',
      );
      expect(
        MobilePaymentErrorType.paymentMethodNotSetup.displayMessage,
        '決済方法が設定されていません',
      );
      expect(
        MobilePaymentErrorType.userCancelled.displayMessage,
        '決済がキャンセルされました',
      );
    });
  });

  group('PaymentMethodType extensions', () {
    test('should return correct display names', () {
      expect(PaymentMethodType.applePay.displayName, 'Apple Pay');
      expect(PaymentMethodType.googlePay.displayName, 'Google Pay');
      expect(PaymentMethodType.creditCard.displayName, 'クレジットカード');
    });

    test('should return correct icon assets', () {
      expect(
          PaymentMethodType.applePay.iconAsset, 'assets/icons/apple_pay.png');
      expect(
          PaymentMethodType.googlePay.iconAsset, 'assets/icons/google_pay.png');
      expect(PaymentMethodType.creditCard.iconAsset,
          'assets/icons/credit_card.png');
    });
  });
}
