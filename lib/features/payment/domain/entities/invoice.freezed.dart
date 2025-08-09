// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return _Invoice.fromJson(json);
}

/// @nodoc
mixin _$Invoice {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get bookingId => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  InvoiceStatus get status => throw _privateConstructorUsedError;
  String? get paymentIntentId => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<InvoiceLineItem>? get lineItems => throw _privateConstructorUsedError;
  InvoiceBilling? get billing => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  DateTime? get paidAt => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  DateTime? get updated => throw _privateConstructorUsedError;
  Map<String, String>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this Invoice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceCopyWith<Invoice> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceCopyWith<$Res> {
  factory $InvoiceCopyWith(Invoice value, $Res Function(Invoice) then) =
      _$InvoiceCopyWithImpl<$Res, Invoice>;
  @useResult
  $Res call(
      {String id,
      String customerId,
      String bookingId,
      int amount,
      String currency,
      InvoiceStatus status,
      String? paymentIntentId,
      String? description,
      List<InvoiceLineItem>? lineItems,
      InvoiceBilling? billing,
      DateTime? dueDate,
      DateTime? paidAt,
      DateTime? created,
      DateTime? updated,
      Map<String, String>? metadata});

  $InvoiceBillingCopyWith<$Res>? get billing;
}

/// @nodoc
class _$InvoiceCopyWithImpl<$Res, $Val extends Invoice>
    implements $InvoiceCopyWith<$Res> {
  _$InvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? bookingId = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? paymentIntentId = freezed,
    Object? description = freezed,
    Object? lineItems = freezed,
    Object? billing = freezed,
    Object? dueDate = freezed,
    Object? paidAt = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvoiceStatus,
      paymentIntentId: freezed == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lineItems: freezed == lineItems
          ? _value.lineItems
          : lineItems // ignore: cast_nullable_to_non_nullable
              as List<InvoiceLineItem>?,
      billing: freezed == billing
          ? _value.billing
          : billing // ignore: cast_nullable_to_non_nullable
              as InvoiceBilling?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceBillingCopyWith<$Res>? get billing {
    if (_value.billing == null) {
      return null;
    }

    return $InvoiceBillingCopyWith<$Res>(_value.billing!, (value) {
      return _then(_value.copyWith(billing: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceImplCopyWith<$Res> implements $InvoiceCopyWith<$Res> {
  factory _$$InvoiceImplCopyWith(
          _$InvoiceImpl value, $Res Function(_$InvoiceImpl) then) =
      __$$InvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      String bookingId,
      int amount,
      String currency,
      InvoiceStatus status,
      String? paymentIntentId,
      String? description,
      List<InvoiceLineItem>? lineItems,
      InvoiceBilling? billing,
      DateTime? dueDate,
      DateTime? paidAt,
      DateTime? created,
      DateTime? updated,
      Map<String, String>? metadata});

  @override
  $InvoiceBillingCopyWith<$Res>? get billing;
}

/// @nodoc
class __$$InvoiceImplCopyWithImpl<$Res>
    extends _$InvoiceCopyWithImpl<$Res, _$InvoiceImpl>
    implements _$$InvoiceImplCopyWith<$Res> {
  __$$InvoiceImplCopyWithImpl(
      _$InvoiceImpl _value, $Res Function(_$InvoiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? bookingId = null,
    Object? amount = null,
    Object? currency = null,
    Object? status = null,
    Object? paymentIntentId = freezed,
    Object? description = freezed,
    Object? lineItems = freezed,
    Object? billing = freezed,
    Object? dueDate = freezed,
    Object? paidAt = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$InvoiceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvoiceStatus,
      paymentIntentId: freezed == paymentIntentId
          ? _value.paymentIntentId
          : paymentIntentId // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      lineItems: freezed == lineItems
          ? _value._lineItems
          : lineItems // ignore: cast_nullable_to_non_nullable
              as List<InvoiceLineItem>?,
      billing: freezed == billing
          ? _value.billing
          : billing // ignore: cast_nullable_to_non_nullable
              as InvoiceBilling?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updated: freezed == updated
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceImpl extends _Invoice {
  const _$InvoiceImpl(
      {required this.id,
      required this.customerId,
      required this.bookingId,
      required this.amount,
      required this.currency,
      required this.status,
      this.paymentIntentId,
      this.description,
      final List<InvoiceLineItem>? lineItems,
      this.billing,
      this.dueDate,
      this.paidAt,
      this.created,
      this.updated,
      final Map<String, String>? metadata})
      : _lineItems = lineItems,
        _metadata = metadata,
        super._();

  factory _$InvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceImplFromJson(json);

  @override
  final String id;
  @override
  final String customerId;
  @override
  final String bookingId;
  @override
  final int amount;
  @override
  final String currency;
  @override
  final InvoiceStatus status;
  @override
  final String? paymentIntentId;
  @override
  final String? description;
  final List<InvoiceLineItem>? _lineItems;
  @override
  List<InvoiceLineItem>? get lineItems {
    final value = _lineItems;
    if (value == null) return null;
    if (_lineItems is EqualUnmodifiableListView) return _lineItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final InvoiceBilling? billing;
  @override
  final DateTime? dueDate;
  @override
  final DateTime? paidAt;
  @override
  final DateTime? created;
  @override
  final DateTime? updated;
  final Map<String, String>? _metadata;
  @override
  Map<String, String>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Invoice(id: $id, customerId: $customerId, bookingId: $bookingId, amount: $amount, currency: $currency, status: $status, paymentIntentId: $paymentIntentId, description: $description, lineItems: $lineItems, billing: $billing, dueDate: $dueDate, paidAt: $paidAt, created: $created, updated: $updated, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentIntentId, paymentIntentId) ||
                other.paymentIntentId == paymentIntentId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._lineItems, _lineItems) &&
            (identical(other.billing, billing) || other.billing == billing) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.updated, updated) || other.updated == updated) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      customerId,
      bookingId,
      amount,
      currency,
      status,
      paymentIntentId,
      description,
      const DeepCollectionEquality().hash(_lineItems),
      billing,
      dueDate,
      paidAt,
      created,
      updated,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      __$$InvoiceImplCopyWithImpl<_$InvoiceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceImplToJson(
      this,
    );
  }
}

abstract class _Invoice extends Invoice {
  const factory _Invoice(
      {required final String id,
      required final String customerId,
      required final String bookingId,
      required final int amount,
      required final String currency,
      required final InvoiceStatus status,
      final String? paymentIntentId,
      final String? description,
      final List<InvoiceLineItem>? lineItems,
      final InvoiceBilling? billing,
      final DateTime? dueDate,
      final DateTime? paidAt,
      final DateTime? created,
      final DateTime? updated,
      final Map<String, String>? metadata}) = _$InvoiceImpl;
  const _Invoice._() : super._();

  factory _Invoice.fromJson(Map<String, dynamic> json) = _$InvoiceImpl.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  String get bookingId;
  @override
  int get amount;
  @override
  String get currency;
  @override
  InvoiceStatus get status;
  @override
  String? get paymentIntentId;
  @override
  String? get description;
  @override
  List<InvoiceLineItem>? get lineItems;
  @override
  InvoiceBilling? get billing;
  @override
  DateTime? get dueDate;
  @override
  DateTime? get paidAt;
  @override
  DateTime? get created;
  @override
  DateTime? get updated;
  @override
  Map<String, String>? get metadata;

  /// Create a copy of Invoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceImplCopyWith<_$InvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceLineItem _$InvoiceLineItemFromJson(Map<String, dynamic> json) {
  return _InvoiceLineItem.fromJson(json);
}

/// @nodoc
mixin _$InvoiceLineItem {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  int get unitAmount => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  Map<String, String>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this InvoiceLineItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceLineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceLineItemCopyWith<InvoiceLineItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceLineItemCopyWith<$Res> {
  factory $InvoiceLineItemCopyWith(
          InvoiceLineItem value, $Res Function(InvoiceLineItem) then) =
      _$InvoiceLineItemCopyWithImpl<$Res, InvoiceLineItem>;
  @useResult
  $Res call(
      {String id,
      String description,
      int quantity,
      int unitAmount,
      String? currency,
      Map<String, String>? metadata});
}

/// @nodoc
class _$InvoiceLineItemCopyWithImpl<$Res, $Val extends InvoiceLineItem>
    implements $InvoiceLineItemCopyWith<$Res> {
  _$InvoiceLineItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceLineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? quantity = null,
    Object? unitAmount = null,
    Object? currency = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitAmount: null == unitAmount
          ? _value.unitAmount
          : unitAmount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceLineItemImplCopyWith<$Res>
    implements $InvoiceLineItemCopyWith<$Res> {
  factory _$$InvoiceLineItemImplCopyWith(_$InvoiceLineItemImpl value,
          $Res Function(_$InvoiceLineItemImpl) then) =
      __$$InvoiceLineItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      int quantity,
      int unitAmount,
      String? currency,
      Map<String, String>? metadata});
}

/// @nodoc
class __$$InvoiceLineItemImplCopyWithImpl<$Res>
    extends _$InvoiceLineItemCopyWithImpl<$Res, _$InvoiceLineItemImpl>
    implements _$$InvoiceLineItemImplCopyWith<$Res> {
  __$$InvoiceLineItemImplCopyWithImpl(
      _$InvoiceLineItemImpl _value, $Res Function(_$InvoiceLineItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceLineItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? quantity = null,
    Object? unitAmount = null,
    Object? currency = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$InvoiceLineItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      unitAmount: null == unitAmount
          ? _value.unitAmount
          : unitAmount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceLineItemImpl extends _InvoiceLineItem {
  const _$InvoiceLineItemImpl(
      {required this.id,
      required this.description,
      required this.quantity,
      required this.unitAmount,
      this.currency,
      final Map<String, String>? metadata})
      : _metadata = metadata,
        super._();

  factory _$InvoiceLineItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceLineItemImplFromJson(json);

  @override
  final String id;
  @override
  final String description;
  @override
  final int quantity;
  @override
  final int unitAmount;
  @override
  final String? currency;
  final Map<String, String>? _metadata;
  @override
  Map<String, String>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'InvoiceLineItem(id: $id, description: $description, quantity: $quantity, unitAmount: $unitAmount, currency: $currency, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceLineItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unitAmount, unitAmount) ||
                other.unitAmount == unitAmount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, description, quantity,
      unitAmount, currency, const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of InvoiceLineItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceLineItemImplCopyWith<_$InvoiceLineItemImpl> get copyWith =>
      __$$InvoiceLineItemImplCopyWithImpl<_$InvoiceLineItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceLineItemImplToJson(
      this,
    );
  }
}

abstract class _InvoiceLineItem extends InvoiceLineItem {
  const factory _InvoiceLineItem(
      {required final String id,
      required final String description,
      required final int quantity,
      required final int unitAmount,
      final String? currency,
      final Map<String, String>? metadata}) = _$InvoiceLineItemImpl;
  const _InvoiceLineItem._() : super._();

  factory _InvoiceLineItem.fromJson(Map<String, dynamic> json) =
      _$InvoiceLineItemImpl.fromJson;

  @override
  String get id;
  @override
  String get description;
  @override
  int get quantity;
  @override
  int get unitAmount;
  @override
  String? get currency;
  @override
  Map<String, String>? get metadata;

  /// Create a copy of InvoiceLineItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceLineItemImplCopyWith<_$InvoiceLineItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceBilling _$InvoiceBillingFromJson(Map<String, dynamic> json) {
  return _InvoiceBilling.fromJson(json);
}

/// @nodoc
mixin _$InvoiceBilling {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  InvoiceAddress? get address => throw _privateConstructorUsedError;

  /// Serializes this InvoiceBilling to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceBilling
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceBillingCopyWith<InvoiceBilling> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceBillingCopyWith<$Res> {
  factory $InvoiceBillingCopyWith(
          InvoiceBilling value, $Res Function(InvoiceBilling) then) =
      _$InvoiceBillingCopyWithImpl<$Res, InvoiceBilling>;
  @useResult
  $Res call(
      {String name, String email, String? phone, InvoiceAddress? address});

  $InvoiceAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$InvoiceBillingCopyWithImpl<$Res, $Val extends InvoiceBilling>
    implements $InvoiceBillingCopyWith<$Res> {
  _$InvoiceBillingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceBilling
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as InvoiceAddress?,
    ) as $Val);
  }

  /// Create a copy of InvoiceBilling
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $InvoiceAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvoiceBillingImplCopyWith<$Res>
    implements $InvoiceBillingCopyWith<$Res> {
  factory _$$InvoiceBillingImplCopyWith(_$InvoiceBillingImpl value,
          $Res Function(_$InvoiceBillingImpl) then) =
      __$$InvoiceBillingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String email, String? phone, InvoiceAddress? address});

  @override
  $InvoiceAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$InvoiceBillingImplCopyWithImpl<$Res>
    extends _$InvoiceBillingCopyWithImpl<$Res, _$InvoiceBillingImpl>
    implements _$$InvoiceBillingImplCopyWith<$Res> {
  __$$InvoiceBillingImplCopyWithImpl(
      _$InvoiceBillingImpl _value, $Res Function(_$InvoiceBillingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceBilling
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? phone = freezed,
    Object? address = freezed,
  }) {
    return _then(_$InvoiceBillingImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as InvoiceAddress?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceBillingImpl extends _InvoiceBilling {
  const _$InvoiceBillingImpl(
      {required this.name, required this.email, this.phone, this.address})
      : super._();

  factory _$InvoiceBillingImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceBillingImplFromJson(json);

  @override
  final String name;
  @override
  final String email;
  @override
  final String? phone;
  @override
  final InvoiceAddress? address;

  @override
  String toString() {
    return 'InvoiceBilling(name: $name, email: $email, phone: $phone, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceBillingImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, email, phone, address);

  /// Create a copy of InvoiceBilling
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceBillingImplCopyWith<_$InvoiceBillingImpl> get copyWith =>
      __$$InvoiceBillingImplCopyWithImpl<_$InvoiceBillingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceBillingImplToJson(
      this,
    );
  }
}

abstract class _InvoiceBilling extends InvoiceBilling {
  const factory _InvoiceBilling(
      {required final String name,
      required final String email,
      final String? phone,
      final InvoiceAddress? address}) = _$InvoiceBillingImpl;
  const _InvoiceBilling._() : super._();

  factory _InvoiceBilling.fromJson(Map<String, dynamic> json) =
      _$InvoiceBillingImpl.fromJson;

  @override
  String get name;
  @override
  String get email;
  @override
  String? get phone;
  @override
  InvoiceAddress? get address;

  /// Create a copy of InvoiceBilling
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceBillingImplCopyWith<_$InvoiceBillingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvoiceAddress _$InvoiceAddressFromJson(Map<String, dynamic> json) {
  return _InvoiceAddress.fromJson(json);
}

/// @nodoc
mixin _$InvoiceAddress {
  String? get line1 => throw _privateConstructorUsedError;
  String? get line2 => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get postalCode => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  /// Serializes this InvoiceAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceAddressCopyWith<InvoiceAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceAddressCopyWith<$Res> {
  factory $InvoiceAddressCopyWith(
          InvoiceAddress value, $Res Function(InvoiceAddress) then) =
      _$InvoiceAddressCopyWithImpl<$Res, InvoiceAddress>;
  @useResult
  $Res call(
      {String? line1,
      String? line2,
      String? city,
      String? state,
      String? postalCode,
      String? country});
}

/// @nodoc
class _$InvoiceAddressCopyWithImpl<$Res, $Val extends InvoiceAddress>
    implements $InvoiceAddressCopyWith<$Res> {
  _$InvoiceAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceAddressImplCopyWith<$Res>
    implements $InvoiceAddressCopyWith<$Res> {
  factory _$$InvoiceAddressImplCopyWith(_$InvoiceAddressImpl value,
          $Res Function(_$InvoiceAddressImpl) then) =
      __$$InvoiceAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? line1,
      String? line2,
      String? city,
      String? state,
      String? postalCode,
      String? country});
}

/// @nodoc
class __$$InvoiceAddressImplCopyWithImpl<$Res>
    extends _$InvoiceAddressCopyWithImpl<$Res, _$InvoiceAddressImpl>
    implements _$$InvoiceAddressImplCopyWith<$Res> {
  __$$InvoiceAddressImplCopyWithImpl(
      _$InvoiceAddressImpl _value, $Res Function(_$InvoiceAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? line1 = freezed,
    Object? line2 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postalCode = freezed,
    Object? country = freezed,
  }) {
    return _then(_$InvoiceAddressImpl(
      line1: freezed == line1
          ? _value.line1
          : line1 // ignore: cast_nullable_to_non_nullable
              as String?,
      line2: freezed == line2
          ? _value.line2
          : line2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceAddressImpl extends _InvoiceAddress {
  const _$InvoiceAddressImpl(
      {this.line1,
      this.line2,
      this.city,
      this.state,
      this.postalCode,
      this.country})
      : super._();

  factory _$InvoiceAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceAddressImplFromJson(json);

  @override
  final String? line1;
  @override
  final String? line2;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? postalCode;
  @override
  final String? country;

  @override
  String toString() {
    return 'InvoiceAddress(line1: $line1, line2: $line2, city: $city, state: $state, postalCode: $postalCode, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceAddressImpl &&
            (identical(other.line1, line1) || other.line1 == line1) &&
            (identical(other.line2, line2) || other.line2 == line2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, line1, line2, city, state, postalCode, country);

  /// Create a copy of InvoiceAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceAddressImplCopyWith<_$InvoiceAddressImpl> get copyWith =>
      __$$InvoiceAddressImplCopyWithImpl<_$InvoiceAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceAddressImplToJson(
      this,
    );
  }
}

abstract class _InvoiceAddress extends InvoiceAddress {
  const factory _InvoiceAddress(
      {final String? line1,
      final String? line2,
      final String? city,
      final String? state,
      final String? postalCode,
      final String? country}) = _$InvoiceAddressImpl;
  const _InvoiceAddress._() : super._();

  factory _InvoiceAddress.fromJson(Map<String, dynamic> json) =
      _$InvoiceAddressImpl.fromJson;

  @override
  String? get line1;
  @override
  String? get line2;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get postalCode;
  @override
  String? get country;

  /// Create a copy of InvoiceAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceAddressImplCopyWith<_$InvoiceAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
