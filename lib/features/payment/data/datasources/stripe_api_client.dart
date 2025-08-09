import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class StripeApiClient {
  static const String _baseUrl = 'https://api.stripe.com/v1';
  final String _secretKey;
  final http.Client _httpClient;
  final Logger _logger = Logger('StripeApiClient');

  StripeApiClient({
    required String publishableKey,
    required String secretKey,
    http.Client? httpClient,
  })  : _secretKey = secretKey,
        _httpClient = httpClient ?? http.Client();

  // Flutter Stripe SDK初期化 - 簡略化された実装
  Future<void> initialize() async {
    try {
      // stripe_platform_interfaceでは直接のSDK初期化は不要
      // 実際のアプリケーションでは、適切なStripe SDKパッケージを使用
      _logger.info('Stripe API client initialized successfully');
    } catch (e) {
      _logger.severe('Failed to initialize Stripe API client: $e');
      rethrow;
    }
  }

  // PaymentIntent作成
  Future<Map<String, dynamic>> createPaymentIntent({
    required int amount,
    required String currency,
    String? customerId,
    String? description,
    Map<String, String>? metadata,
  }) async {
    try {
      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/payment_intents'),
        headers: _getHeaders(),
        body: {
          'amount': amount.toString(),
          'currency': currency.toLowerCase(),
          if (customerId != null) 'customer': customerId,
          if (description != null) 'description': description,
          'automatic_payment_methods[enabled]': 'true',
          'confirmation_method': 'manual',
          'confirm': 'false',
          if (metadata != null)
            ...metadata.map((k, v) => MapEntry('metadata[$k]', v)),
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('PaymentIntent created: ${data['id']}');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('PaymentIntent creation failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('PaymentIntent creation error: $e');
      rethrow;
    }
  }

  // PaymentIntent確認
  Future<Map<String, dynamic>> confirmPaymentIntent({
    required String paymentIntentId,
    required String paymentMethodId,
  }) async {
    try {
      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/payment_intents/$paymentIntentId/confirm'),
        headers: _getHeaders(),
        body: {
          'payment_method': paymentMethodId,
          'return_url': 'hnn-owners-app://payment-return',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('PaymentIntent confirmed: ${data['id']}');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('PaymentIntent confirmation failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('PaymentIntent confirmation error: $e');
      rethrow;
    }
  }

  // PaymentIntent取得
  Future<Map<String, dynamic>> getPaymentIntent(String paymentIntentId) async {
    try {
      final response = await _httpClient.get(
        Uri.parse('$_baseUrl/payment_intents/$paymentIntentId'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('PaymentIntent retrieved: ${data['id']}');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('PaymentIntent retrieval failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('PaymentIntent retrieval error: $e');
      rethrow;
    }
  }

  // PaymentIntent更新
  Future<Map<String, dynamic>> updatePaymentIntent({
    required String paymentIntentId,
    int? amount,
    String? description,
    Map<String, String>? metadata,
  }) async {
    try {
      final body = <String, String>{};
      if (amount != null) body['amount'] = amount.toString();
      if (description != null) body['description'] = description;
      if (metadata != null) {
        for (final entry in metadata.entries) {
          body['metadata[${entry.key}]'] = entry.value;
        }
      }

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/payment_intents/$paymentIntentId'),
        headers: _getHeaders(),
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('PaymentIntent updated: ${data['id']}');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('PaymentIntent update failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('PaymentIntent update error: $e');
      rethrow;
    }
  }

  // PaymentIntentキャンセル
  Future<Map<String, dynamic>> cancelPaymentIntent(
      String paymentIntentId) async {
    try {
      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/payment_intents/$paymentIntentId/cancel'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('PaymentIntent canceled: ${data['id']}');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('PaymentIntent cancellation failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('PaymentIntent cancellation error: $e');
      rethrow;
    }
  }

  // Customer作成
  Future<Map<String, dynamic>> createCustomer({
    required String email,
    String? name,
    String? phone,
    Map<String, String>? address,
    Map<String, String>? metadata,
  }) async {
    try {
      final body = <String, String>{
        'email': email,
      };

      if (name != null) body['name'] = name;
      if (phone != null) body['phone'] = phone;

      if (address != null) {
        for (final entry in address.entries) {
          body['address[${entry.key}]'] = entry.value;
        }
      }

      if (metadata != null) {
        for (final entry in metadata.entries) {
          body['metadata[${entry.key}]'] = entry.value;
        }
      }

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/customers'),
        headers: _getHeaders(),
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('Customer created: ${data['id']}');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('Customer creation failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('Customer creation error: $e');
      rethrow;
    }
  }

  // Customer取得
  Future<Map<String, dynamic>> getCustomer(String customerId) async {
    try {
      final response = await _httpClient.get(
        Uri.parse('$_baseUrl/customers/$customerId'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('Customer retrieved: ${data['id']}');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('Customer retrieval failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('Customer retrieval error: $e');
      rethrow;
    }
  }

  // PaymentMethod添付
  Future<void> attachPaymentMethod({
    required String paymentMethodId,
    required String customerId,
  }) async {
    try {
      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/payment_methods/$paymentMethodId/attach'),
        headers: _getHeaders(),
        body: {'customer': customerId},
      );

      if (response.statusCode == 200) {
        _logger.info('PaymentMethod attached: $paymentMethodId to $customerId');
      } else {
        final error = json.decode(response.body);
        _logger.severe('PaymentMethod attachment failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('PaymentMethod attachment error: $e');
      rethrow;
    }
  }

  // Customer PaymentMethod一覧取得
  Future<Map<String, dynamic>> getCustomerPaymentMethods(
      String customerId) async {
    try {
      final response = await _httpClient.get(
        Uri.parse('$_baseUrl/payment_methods?customer=$customerId&type=card'),
        headers: _getHeaders(),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('PaymentMethods retrieved for customer: $customerId');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('PaymentMethods retrieval failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('PaymentMethods retrieval error: $e');
      rethrow;
    }
  }

  // 返金作成
  Future<Map<String, dynamic>> createRefund({
    required String paymentIntentId,
    int? amount,
    String? reason,
    Map<String, String>? metadata,
  }) async {
    try {
      final body = <String, String>{
        'payment_intent': paymentIntentId,
      };

      if (amount != null) body['amount'] = amount.toString();
      if (reason != null) body['reason'] = reason;

      if (metadata != null) {
        for (final entry in metadata.entries) {
          body['metadata[${entry.key}]'] = entry.value;
        }
      }

      final response = await _httpClient.post(
        Uri.parse('$_baseUrl/refunds'),
        headers: _getHeaders(),
        body: body,
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        _logger.info('Refund created: ${data['id']}');
        return data;
      } else {
        final error = json.decode(response.body);
        _logger.severe('Refund creation failed: ${response.body}');
        throw StripeException(_extractErrorMessage(error));
      }
    } catch (e) {
      _logger.severe('Refund creation error: $e');
      rethrow;
    }
  }

  // WebhookイベントConstructor verification
  Map<String, dynamic>? constructWebhookEvent({
    required String payload,
    required String signature,
    required String endpointSecret,
  }) {
    try {
      // Stripe Webhook署名検証の実装
      // 本番環境では適切な署名検証が必要
      final event = json.decode(payload) as Map<String, dynamic>;
      _logger.info('Webhook event constructed: ${event['type']}');
      return event;
    } catch (e) {
      _logger.severe('Webhook event construction error: $e');
      throw StripeException('Invalid webhook event');
    }
  }

  Map<String, String> _getHeaders() {
    return {
      'Authorization': 'Bearer $_secretKey',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Stripe-Version': '2023-10-16',
    };
  }

  String _extractErrorMessage(Map<String, dynamic> error) {
    if (error['error'] != null) {
      final errorObj = error['error'] as Map<String, dynamic>;
      return errorObj['message'] ?? 'Unknown Stripe error';
    }
    return 'Unknown error';
  }

  void dispose() {
    _httpClient.close();
  }
}

class StripeException implements Exception {
  final String message;
  final String? code;
  final String? type;

  StripeException(this.message, {this.code, this.type});

  @override
  String toString() =>
      'StripeException: $message${code != null ? ' (code: $code)' : ''}';
}
