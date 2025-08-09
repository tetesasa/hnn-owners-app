import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice.freezed.dart';
part 'invoice.g.dart';

@freezed
class Invoice with _$Invoice {
  const Invoice._();

  const factory Invoice({
    required String id,
    required String customerId,
    required String bookingId,
    required int amount,
    required String currency,
    required InvoiceStatus status,
    String? paymentIntentId,
    String? description,
    List<InvoiceLineItem>? lineItems,
    InvoiceBilling? billing,
    DateTime? dueDate,
    DateTime? paidAt,
    DateTime? created,
    DateTime? updated,
    Map<String, String>? metadata,
  }) = _Invoice;

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);

  // Firestoreとの変換用メソッド
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'customerId': customerId,
      'bookingId': bookingId,
      'amount': amount,
      'currency': currency,
      'status': status.name,
      'paymentIntentId': paymentIntentId,
      'description': description,
      'lineItems': lineItems?.map((item) => item.toFirestore()).toList(),
      'billing': billing?.toFirestore(),
      'dueDate': dueDate?.toIso8601String(),
      'paidAt': paidAt?.toIso8601String(),
      'created': created?.toIso8601String(),
      'updated': updated?.toIso8601String(),
      'metadata': metadata,
    };
  }

  factory Invoice.fromFirestore(Map<String, dynamic> data) {
    return Invoice(
      id: data['id'] ?? '',
      customerId: data['customerId'] ?? '',
      bookingId: data['bookingId'] ?? '',
      amount: data['amount'] ?? 0,
      currency: data['currency'] ?? 'jpy',
      status: InvoiceStatus.values.firstWhere(
        (s) => s.name == data['status'],
        orElse: () => InvoiceStatus.draft,
      ),
      paymentIntentId: data['paymentIntentId'],
      description: data['description'],
      lineItems: data['lineItems'] != null
          ? (data['lineItems'] as List)
              .map((item) => InvoiceLineItem.fromFirestore(item))
              .toList()
          : null,
      billing: data['billing'] != null
          ? InvoiceBilling.fromFirestore(data['billing'])
          : null,
      dueDate: data['dueDate'] != null ? DateTime.parse(data['dueDate']) : null,
      paidAt: data['paidAt'] != null ? DateTime.parse(data['paidAt']) : null,
      created: data['created'] != null ? DateTime.parse(data['created']) : null,
      updated: data['updated'] != null ? DateTime.parse(data['updated']) : null,
      metadata: data['metadata'] != null
          ? Map<String, String>.from(data['metadata'])
          : null,
    );
  }

  // 金額を円表記にフォーマット
  String get formattedAmount {
    if (currency.toLowerCase() == 'jpy') {
      return '¥${amount.toString().replaceAllMapped(
            RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},',
          )}';
    }
    return '$amount $currency';
  }

  // 支払済みかどうか
  bool get isPaid => status == InvoiceStatus.paid;

  // 期限切れかどうか
  bool get isOverdue {
    if (dueDate == null || isPaid) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  // 合計金額（税込み）
  int get totalAmount {
    final subtotal = lineItems?.fold<int>(
          0,
          (sum, item) => sum + item.totalAmount,
        ) ??
        amount;
    return subtotal;
  }
}

@freezed
class InvoiceLineItem with _$InvoiceLineItem {
  const InvoiceLineItem._();

  const factory InvoiceLineItem({
    required String id,
    required String description,
    required int quantity,
    required int unitAmount,
    String? currency,
    Map<String, String>? metadata,
  }) = _InvoiceLineItem;

  factory InvoiceLineItem.fromJson(Map<String, dynamic> json) =>
      _$InvoiceLineItemFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'description': description,
      'quantity': quantity,
      'unitAmount': unitAmount,
      'currency': currency,
      'metadata': metadata,
    };
  }

  factory InvoiceLineItem.fromFirestore(Map<String, dynamic> data) {
    return InvoiceLineItem(
      id: data['id'] ?? '',
      description: data['description'] ?? '',
      quantity: data['quantity'] ?? 1,
      unitAmount: data['unitAmount'] ?? 0,
      currency: data['currency'],
      metadata: data['metadata'] != null
          ? Map<String, String>.from(data['metadata'])
          : null,
    );
  }

  int get totalAmount => quantity * unitAmount;
}

@freezed
class InvoiceBilling with _$InvoiceBilling {
  const InvoiceBilling._();

  const factory InvoiceBilling({
    required String name,
    required String email,
    String? phone,
    InvoiceAddress? address,
  }) = _InvoiceBilling;

  factory InvoiceBilling.fromJson(Map<String, dynamic> json) =>
      _$InvoiceBillingFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address?.toFirestore(),
    };
  }

  factory InvoiceBilling.fromFirestore(Map<String, dynamic> data) {
    return InvoiceBilling(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'],
      address: data['address'] != null
          ? InvoiceAddress.fromFirestore(data['address'])
          : null,
    );
  }
}

@freezed
class InvoiceAddress with _$InvoiceAddress {
  const InvoiceAddress._();

  const factory InvoiceAddress({
    String? line1,
    String? line2,
    String? city,
    String? state,
    String? postalCode,
    String? country,
  }) = _InvoiceAddress;

  factory InvoiceAddress.fromJson(Map<String, dynamic> json) =>
      _$InvoiceAddressFromJson(json);

  Map<String, dynamic> toFirestore() {
    return {
      'line1': line1,
      'line2': line2,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
    };
  }

  factory InvoiceAddress.fromFirestore(Map<String, dynamic> data) {
    return InvoiceAddress(
      line1: data['line1'],
      line2: data['line2'],
      city: data['city'],
      state: data['state'],
      postalCode: data['postalCode'],
      country: data['country'],
    );
  }
}

enum InvoiceStatus {
  draft,
  open,
  paid,
  uncollectible,
  void_,
}
