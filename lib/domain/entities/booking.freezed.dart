// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
mixin _$Booking {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  DateTime get sittingDateStart => throw _privateConstructorUsedError;
  DateTime get sittingDateEnd => throw _privateConstructorUsedError;
  BookingStatus get status => throw _privateConstructorUsedError;
  ServiceType get serviceType => throw _privateConstructorUsedError;
  String? get staffId => throw _privateConstructorUsedError;
  String? get petId => throw _privateConstructorUsedError;
  List<String> get petIds => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get ownerNotes => throw _privateConstructorUsedError;
  String? get staffNotes => throw _privateConstructorUsedError;
  List<String> get specialInstructions => throw _privateConstructorUsedError;
  BookingPricing? get pricing => throw _privateConstructorUsedError;
  List<CommunicationMessage> get communicationLog =>
      throw _privateConstructorUsedError;
  BookingRating? get ownerRating => throw _privateConstructorUsedError;
  List<ServiceReport> get serviceReports => throw _privateConstructorUsedError;
  List<String> get photoUrls => throw _privateConstructorUsedError;
  String? get cancelReason => throw _privateConstructorUsedError;
  String? get createdVia => throw _privateConstructorUsedError;
  String? get lastModifiedBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call(
      {String id,
      String customerId,
      DateTime sittingDateStart,
      DateTime sittingDateEnd,
      BookingStatus status,
      ServiceType serviceType,
      String? staffId,
      String? petId,
      List<String> petIds,
      String? notes,
      String? ownerNotes,
      String? staffNotes,
      List<String> specialInstructions,
      BookingPricing? pricing,
      List<CommunicationMessage> communicationLog,
      BookingRating? ownerRating,
      List<ServiceReport> serviceReports,
      List<String> photoUrls,
      String? cancelReason,
      String? createdVia,
      String? lastModifiedBy,
      DateTime? createdAt,
      DateTime? updatedAt});

  $BookingPricingCopyWith<$Res>? get pricing;
  $BookingRatingCopyWith<$Res>? get ownerRating;
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? sittingDateStart = null,
    Object? sittingDateEnd = null,
    Object? status = null,
    Object? serviceType = null,
    Object? staffId = freezed,
    Object? petId = freezed,
    Object? petIds = null,
    Object? notes = freezed,
    Object? ownerNotes = freezed,
    Object? staffNotes = freezed,
    Object? specialInstructions = null,
    Object? pricing = freezed,
    Object? communicationLog = null,
    Object? ownerRating = freezed,
    Object? serviceReports = null,
    Object? photoUrls = null,
    Object? cancelReason = freezed,
    Object? createdVia = freezed,
    Object? lastModifiedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      sittingDateStart: null == sittingDateStart
          ? _value.sittingDateStart
          : sittingDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sittingDateEnd: null == sittingDateEnd
          ? _value.sittingDateEnd
          : sittingDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String?,
      petIds: null == petIds
          ? _value.petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerNotes: freezed == ownerNotes
          ? _value.ownerNotes
          : ownerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      staffNotes: freezed == staffNotes
          ? _value.staffNotes
          : staffNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as BookingPricing?,
      communicationLog: null == communicationLog
          ? _value.communicationLog
          : communicationLog // ignore: cast_nullable_to_non_nullable
              as List<CommunicationMessage>,
      ownerRating: freezed == ownerRating
          ? _value.ownerRating
          : ownerRating // ignore: cast_nullable_to_non_nullable
              as BookingRating?,
      serviceReports: null == serviceReports
          ? _value.serviceReports
          : serviceReports // ignore: cast_nullable_to_non_nullable
              as List<ServiceReport>,
      photoUrls: null == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdVia: freezed == createdVia
          ? _value.createdVia
          : createdVia // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingPricingCopyWith<$Res>? get pricing {
    if (_value.pricing == null) {
      return null;
    }

    return $BookingPricingCopyWith<$Res>(_value.pricing!, (value) {
      return _then(_value.copyWith(pricing: value) as $Val);
    });
  }

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingRatingCopyWith<$Res>? get ownerRating {
    if (_value.ownerRating == null) {
      return null;
    }

    return $BookingRatingCopyWith<$Res>(_value.ownerRating!, (value) {
      return _then(_value.copyWith(ownerRating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
          _$BookingImpl value, $Res Function(_$BookingImpl) then) =
      __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      DateTime sittingDateStart,
      DateTime sittingDateEnd,
      BookingStatus status,
      ServiceType serviceType,
      String? staffId,
      String? petId,
      List<String> petIds,
      String? notes,
      String? ownerNotes,
      String? staffNotes,
      List<String> specialInstructions,
      BookingPricing? pricing,
      List<CommunicationMessage> communicationLog,
      BookingRating? ownerRating,
      List<ServiceReport> serviceReports,
      List<String> photoUrls,
      String? cancelReason,
      String? createdVia,
      String? lastModifiedBy,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $BookingPricingCopyWith<$Res>? get pricing;
  @override
  $BookingRatingCopyWith<$Res>? get ownerRating;
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
      _$BookingImpl _value, $Res Function(_$BookingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? sittingDateStart = null,
    Object? sittingDateEnd = null,
    Object? status = null,
    Object? serviceType = null,
    Object? staffId = freezed,
    Object? petId = freezed,
    Object? petIds = null,
    Object? notes = freezed,
    Object? ownerNotes = freezed,
    Object? staffNotes = freezed,
    Object? specialInstructions = null,
    Object? pricing = freezed,
    Object? communicationLog = null,
    Object? ownerRating = freezed,
    Object? serviceReports = null,
    Object? photoUrls = null,
    Object? cancelReason = freezed,
    Object? createdVia = freezed,
    Object? lastModifiedBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$BookingImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      sittingDateStart: null == sittingDateStart
          ? _value.sittingDateStart
          : sittingDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sittingDateEnd: null == sittingDateEnd
          ? _value.sittingDateEnd
          : sittingDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BookingStatus,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      staffId: freezed == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String?,
      petId: freezed == petId
          ? _value.petId
          : petId // ignore: cast_nullable_to_non_nullable
              as String?,
      petIds: null == petIds
          ? _value._petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerNotes: freezed == ownerNotes
          ? _value.ownerNotes
          : ownerNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      staffNotes: freezed == staffNotes
          ? _value.staffNotes
          : staffNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: null == specialInstructions
          ? _value._specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pricing: freezed == pricing
          ? _value.pricing
          : pricing // ignore: cast_nullable_to_non_nullable
              as BookingPricing?,
      communicationLog: null == communicationLog
          ? _value._communicationLog
          : communicationLog // ignore: cast_nullable_to_non_nullable
              as List<CommunicationMessage>,
      ownerRating: freezed == ownerRating
          ? _value.ownerRating
          : ownerRating // ignore: cast_nullable_to_non_nullable
              as BookingRating?,
      serviceReports: null == serviceReports
          ? _value._serviceReports
          : serviceReports // ignore: cast_nullable_to_non_nullable
              as List<ServiceReport>,
      photoUrls: null == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cancelReason: freezed == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String?,
      createdVia: freezed == createdVia
          ? _value.createdVia
          : createdVia // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedBy: freezed == lastModifiedBy
          ? _value.lastModifiedBy
          : lastModifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingImpl extends _Booking {
  const _$BookingImpl(
      {required this.id,
      required this.customerId,
      required this.sittingDateStart,
      required this.sittingDateEnd,
      this.status = BookingStatus.pending,
      this.serviceType = ServiceType.visiting,
      this.staffId,
      this.petId,
      final List<String> petIds = const [],
      this.notes,
      this.ownerNotes,
      this.staffNotes,
      final List<String> specialInstructions = const [],
      this.pricing,
      final List<CommunicationMessage> communicationLog = const [],
      this.ownerRating,
      final List<ServiceReport> serviceReports = const [],
      final List<String> photoUrls = const [],
      this.cancelReason,
      this.createdVia,
      this.lastModifiedBy,
      this.createdAt,
      this.updatedAt})
      : _petIds = petIds,
        _specialInstructions = specialInstructions,
        _communicationLog = communicationLog,
        _serviceReports = serviceReports,
        _photoUrls = photoUrls,
        super._();

  factory _$BookingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingImplFromJson(json);

  @override
  final String id;
  @override
  final String customerId;
  @override
  final DateTime sittingDateStart;
  @override
  final DateTime sittingDateEnd;
  @override
  @JsonKey()
  final BookingStatus status;
  @override
  @JsonKey()
  final ServiceType serviceType;
  @override
  final String? staffId;
  @override
  final String? petId;
  final List<String> _petIds;
  @override
  @JsonKey()
  List<String> get petIds {
    if (_petIds is EqualUnmodifiableListView) return _petIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_petIds);
  }

  @override
  final String? notes;
  @override
  final String? ownerNotes;
  @override
  final String? staffNotes;
  final List<String> _specialInstructions;
  @override
  @JsonKey()
  List<String> get specialInstructions {
    if (_specialInstructions is EqualUnmodifiableListView)
      return _specialInstructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialInstructions);
  }

  @override
  final BookingPricing? pricing;
  final List<CommunicationMessage> _communicationLog;
  @override
  @JsonKey()
  List<CommunicationMessage> get communicationLog {
    if (_communicationLog is EqualUnmodifiableListView)
      return _communicationLog;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_communicationLog);
  }

  @override
  final BookingRating? ownerRating;
  final List<ServiceReport> _serviceReports;
  @override
  @JsonKey()
  List<ServiceReport> get serviceReports {
    if (_serviceReports is EqualUnmodifiableListView) return _serviceReports;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_serviceReports);
  }

  final List<String> _photoUrls;
  @override
  @JsonKey()
  List<String> get photoUrls {
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoUrls);
  }

  @override
  final String? cancelReason;
  @override
  final String? createdVia;
  @override
  final String? lastModifiedBy;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Booking(id: $id, customerId: $customerId, sittingDateStart: $sittingDateStart, sittingDateEnd: $sittingDateEnd, status: $status, serviceType: $serviceType, staffId: $staffId, petId: $petId, petIds: $petIds, notes: $notes, ownerNotes: $ownerNotes, staffNotes: $staffNotes, specialInstructions: $specialInstructions, pricing: $pricing, communicationLog: $communicationLog, ownerRating: $ownerRating, serviceReports: $serviceReports, photoUrls: $photoUrls, cancelReason: $cancelReason, createdVia: $createdVia, lastModifiedBy: $lastModifiedBy, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.sittingDateStart, sittingDateStart) ||
                other.sittingDateStart == sittingDateStart) &&
            (identical(other.sittingDateEnd, sittingDateEnd) ||
                other.sittingDateEnd == sittingDateEnd) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.petId, petId) || other.petId == petId) &&
            const DeepCollectionEquality().equals(other._petIds, _petIds) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.ownerNotes, ownerNotes) ||
                other.ownerNotes == ownerNotes) &&
            (identical(other.staffNotes, staffNotes) ||
                other.staffNotes == staffNotes) &&
            const DeepCollectionEquality()
                .equals(other._specialInstructions, _specialInstructions) &&
            (identical(other.pricing, pricing) || other.pricing == pricing) &&
            const DeepCollectionEquality()
                .equals(other._communicationLog, _communicationLog) &&
            (identical(other.ownerRating, ownerRating) ||
                other.ownerRating == ownerRating) &&
            const DeepCollectionEquality()
                .equals(other._serviceReports, _serviceReports) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.createdVia, createdVia) ||
                other.createdVia == createdVia) &&
            (identical(other.lastModifiedBy, lastModifiedBy) ||
                other.lastModifiedBy == lastModifiedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        customerId,
        sittingDateStart,
        sittingDateEnd,
        status,
        serviceType,
        staffId,
        petId,
        const DeepCollectionEquality().hash(_petIds),
        notes,
        ownerNotes,
        staffNotes,
        const DeepCollectionEquality().hash(_specialInstructions),
        pricing,
        const DeepCollectionEquality().hash(_communicationLog),
        ownerRating,
        const DeepCollectionEquality().hash(_serviceReports),
        const DeepCollectionEquality().hash(_photoUrls),
        cancelReason,
        createdVia,
        lastModifiedBy,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingImplToJson(
      this,
    );
  }
}

abstract class _Booking extends Booking {
  const factory _Booking(
      {required final String id,
      required final String customerId,
      required final DateTime sittingDateStart,
      required final DateTime sittingDateEnd,
      final BookingStatus status,
      final ServiceType serviceType,
      final String? staffId,
      final String? petId,
      final List<String> petIds,
      final String? notes,
      final String? ownerNotes,
      final String? staffNotes,
      final List<String> specialInstructions,
      final BookingPricing? pricing,
      final List<CommunicationMessage> communicationLog,
      final BookingRating? ownerRating,
      final List<ServiceReport> serviceReports,
      final List<String> photoUrls,
      final String? cancelReason,
      final String? createdVia,
      final String? lastModifiedBy,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$BookingImpl;
  const _Booking._() : super._();

  factory _Booking.fromJson(Map<String, dynamic> json) = _$BookingImpl.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  DateTime get sittingDateStart;
  @override
  DateTime get sittingDateEnd;
  @override
  BookingStatus get status;
  @override
  ServiceType get serviceType;
  @override
  String? get staffId;
  @override
  String? get petId;
  @override
  List<String> get petIds;
  @override
  String? get notes;
  @override
  String? get ownerNotes;
  @override
  String? get staffNotes;
  @override
  List<String> get specialInstructions;
  @override
  BookingPricing? get pricing;
  @override
  List<CommunicationMessage> get communicationLog;
  @override
  BookingRating? get ownerRating;
  @override
  List<ServiceReport> get serviceReports;
  @override
  List<String> get photoUrls;
  @override
  String? get cancelReason;
  @override
  String? get createdVia;
  @override
  String? get lastModifiedBy;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingPricing _$BookingPricingFromJson(Map<String, dynamic> json) {
  return _BookingPricing.fromJson(json);
}

/// @nodoc
mixin _$BookingPricing {
  double get basePrice => throw _privateConstructorUsedError;
  double get additionalCharges => throw _privateConstructorUsedError;
  double get discount => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get priceBreakdown => throw _privateConstructorUsedError;

  /// Serializes this BookingPricing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingPricingCopyWith<BookingPricing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingPricingCopyWith<$Res> {
  factory $BookingPricingCopyWith(
          BookingPricing value, $Res Function(BookingPricing) then) =
      _$BookingPricingCopyWithImpl<$Res, BookingPricing>;
  @useResult
  $Res call(
      {double basePrice,
      double additionalCharges,
      double discount,
      double tax,
      double totalPrice,
      String? currency,
      String? priceBreakdown});
}

/// @nodoc
class _$BookingPricingCopyWithImpl<$Res, $Val extends BookingPricing>
    implements $BookingPricingCopyWith<$Res> {
  _$BookingPricingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basePrice = null,
    Object? additionalCharges = null,
    Object? discount = null,
    Object? tax = null,
    Object? totalPrice = null,
    Object? currency = freezed,
    Object? priceBreakdown = freezed,
  }) {
    return _then(_value.copyWith(
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      additionalCharges: null == additionalCharges
          ? _value.additionalCharges
          : additionalCharges // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      priceBreakdown: freezed == priceBreakdown
          ? _value.priceBreakdown
          : priceBreakdown // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingPricingImplCopyWith<$Res>
    implements $BookingPricingCopyWith<$Res> {
  factory _$$BookingPricingImplCopyWith(_$BookingPricingImpl value,
          $Res Function(_$BookingPricingImpl) then) =
      __$$BookingPricingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double basePrice,
      double additionalCharges,
      double discount,
      double tax,
      double totalPrice,
      String? currency,
      String? priceBreakdown});
}

/// @nodoc
class __$$BookingPricingImplCopyWithImpl<$Res>
    extends _$BookingPricingCopyWithImpl<$Res, _$BookingPricingImpl>
    implements _$$BookingPricingImplCopyWith<$Res> {
  __$$BookingPricingImplCopyWithImpl(
      _$BookingPricingImpl _value, $Res Function(_$BookingPricingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingPricing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? basePrice = null,
    Object? additionalCharges = null,
    Object? discount = null,
    Object? tax = null,
    Object? totalPrice = null,
    Object? currency = freezed,
    Object? priceBreakdown = freezed,
  }) {
    return _then(_$BookingPricingImpl(
      basePrice: null == basePrice
          ? _value.basePrice
          : basePrice // ignore: cast_nullable_to_non_nullable
              as double,
      additionalCharges: null == additionalCharges
          ? _value.additionalCharges
          : additionalCharges // ignore: cast_nullable_to_non_nullable
              as double,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double,
      tax: null == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      priceBreakdown: freezed == priceBreakdown
          ? _value.priceBreakdown
          : priceBreakdown // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingPricingImpl implements _BookingPricing {
  const _$BookingPricingImpl(
      {required this.basePrice,
      this.additionalCharges = 0.0,
      this.discount = 0.0,
      this.tax = 0.0,
      required this.totalPrice,
      this.currency,
      this.priceBreakdown});

  factory _$BookingPricingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingPricingImplFromJson(json);

  @override
  final double basePrice;
  @override
  @JsonKey()
  final double additionalCharges;
  @override
  @JsonKey()
  final double discount;
  @override
  @JsonKey()
  final double tax;
  @override
  final double totalPrice;
  @override
  final String? currency;
  @override
  final String? priceBreakdown;

  @override
  String toString() {
    return 'BookingPricing(basePrice: $basePrice, additionalCharges: $additionalCharges, discount: $discount, tax: $tax, totalPrice: $totalPrice, currency: $currency, priceBreakdown: $priceBreakdown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingPricingImpl &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.additionalCharges, additionalCharges) ||
                other.additionalCharges == additionalCharges) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.priceBreakdown, priceBreakdown) ||
                other.priceBreakdown == priceBreakdown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, basePrice, additionalCharges,
      discount, tax, totalPrice, currency, priceBreakdown);

  /// Create a copy of BookingPricing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingPricingImplCopyWith<_$BookingPricingImpl> get copyWith =>
      __$$BookingPricingImplCopyWithImpl<_$BookingPricingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingPricingImplToJson(
      this,
    );
  }
}

abstract class _BookingPricing implements BookingPricing {
  const factory _BookingPricing(
      {required final double basePrice,
      final double additionalCharges,
      final double discount,
      final double tax,
      required final double totalPrice,
      final String? currency,
      final String? priceBreakdown}) = _$BookingPricingImpl;

  factory _BookingPricing.fromJson(Map<String, dynamic> json) =
      _$BookingPricingImpl.fromJson;

  @override
  double get basePrice;
  @override
  double get additionalCharges;
  @override
  double get discount;
  @override
  double get tax;
  @override
  double get totalPrice;
  @override
  String? get currency;
  @override
  String? get priceBreakdown;

  /// Create a copy of BookingPricing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingPricingImplCopyWith<_$BookingPricingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommunicationMessage _$CommunicationMessageFromJson(Map<String, dynamic> json) {
  return _CommunicationMessage.fromJson(json);
}

/// @nodoc
mixin _$CommunicationMessage {
  String get id => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String get senderType =>
      throw _privateConstructorUsedError; // 'owner' | 'staff' | 'system'
  String get message => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String get messageType =>
      throw _privateConstructorUsedError; // 'text' | 'image' | 'system'
  bool get isRead => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;

  /// Serializes this CommunicationMessage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommunicationMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunicationMessageCopyWith<CommunicationMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunicationMessageCopyWith<$Res> {
  factory $CommunicationMessageCopyWith(CommunicationMessage value,
          $Res Function(CommunicationMessage) then) =
      _$CommunicationMessageCopyWithImpl<$Res, CommunicationMessage>;
  @useResult
  $Res call(
      {String id,
      String senderId,
      String senderType,
      String message,
      DateTime timestamp,
      String messageType,
      bool isRead,
      String? imageUrl,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class _$CommunicationMessageCopyWithImpl<$Res,
        $Val extends CommunicationMessage>
    implements $CommunicationMessageCopyWith<$Res> {
  _$CommunicationMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunicationMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderType = null,
    Object? message = null,
    Object? timestamp = null,
    Object? messageType = null,
    Object? isRead = null,
    Object? imageUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderType: null == senderType
          ? _value.senderType
          : senderType // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunicationMessageImplCopyWith<$Res>
    implements $CommunicationMessageCopyWith<$Res> {
  factory _$$CommunicationMessageImplCopyWith(_$CommunicationMessageImpl value,
          $Res Function(_$CommunicationMessageImpl) then) =
      __$$CommunicationMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String senderId,
      String senderType,
      String message,
      DateTime timestamp,
      String messageType,
      bool isRead,
      String? imageUrl,
      Map<String, dynamic>? metadata});
}

/// @nodoc
class __$$CommunicationMessageImplCopyWithImpl<$Res>
    extends _$CommunicationMessageCopyWithImpl<$Res, _$CommunicationMessageImpl>
    implements _$$CommunicationMessageImplCopyWith<$Res> {
  __$$CommunicationMessageImplCopyWithImpl(_$CommunicationMessageImpl _value,
      $Res Function(_$CommunicationMessageImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunicationMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderId = null,
    Object? senderType = null,
    Object? message = null,
    Object? timestamp = null,
    Object? messageType = null,
    Object? isRead = null,
    Object? imageUrl = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_$CommunicationMessageImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderType: null == senderType
          ? _value.senderType
          : senderType // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommunicationMessageImpl implements _CommunicationMessage {
  const _$CommunicationMessageImpl(
      {required this.id,
      required this.senderId,
      required this.senderType,
      required this.message,
      required this.timestamp,
      this.messageType = 'text',
      this.isRead = false,
      this.imageUrl,
      final Map<String, dynamic>? metadata})
      : _metadata = metadata;

  factory _$CommunicationMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommunicationMessageImplFromJson(json);

  @override
  final String id;
  @override
  final String senderId;
  @override
  final String senderType;
// 'owner' | 'staff' | 'system'
  @override
  final String message;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final String messageType;
// 'text' | 'image' | 'system'
  @override
  @JsonKey()
  final bool isRead;
  @override
  final String? imageUrl;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CommunicationMessage(id: $id, senderId: $senderId, senderType: $senderType, message: $message, timestamp: $timestamp, messageType: $messageType, isRead: $isRead, imageUrl: $imageUrl, metadata: $metadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunicationMessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderType, senderType) ||
                other.senderType == senderType) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      senderId,
      senderType,
      message,
      timestamp,
      messageType,
      isRead,
      imageUrl,
      const DeepCollectionEquality().hash(_metadata));

  /// Create a copy of CommunicationMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunicationMessageImplCopyWith<_$CommunicationMessageImpl>
      get copyWith =>
          __$$CommunicationMessageImplCopyWithImpl<_$CommunicationMessageImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommunicationMessageImplToJson(
      this,
    );
  }
}

abstract class _CommunicationMessage implements CommunicationMessage {
  const factory _CommunicationMessage(
      {required final String id,
      required final String senderId,
      required final String senderType,
      required final String message,
      required final DateTime timestamp,
      final String messageType,
      final bool isRead,
      final String? imageUrl,
      final Map<String, dynamic>? metadata}) = _$CommunicationMessageImpl;

  factory _CommunicationMessage.fromJson(Map<String, dynamic> json) =
      _$CommunicationMessageImpl.fromJson;

  @override
  String get id;
  @override
  String get senderId;
  @override
  String get senderType; // 'owner' | 'staff' | 'system'
  @override
  String get message;
  @override
  DateTime get timestamp;
  @override
  String get messageType; // 'text' | 'image' | 'system'
  @override
  bool get isRead;
  @override
  String? get imageUrl;
  @override
  Map<String, dynamic>? get metadata;

  /// Create a copy of CommunicationMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunicationMessageImplCopyWith<_$CommunicationMessageImpl>
      get copyWith => throw _privateConstructorUsedError;
}

BookingRating _$BookingRatingFromJson(Map<String, dynamic> json) {
  return _BookingRating.fromJson(json);
}

/// @nodoc
mixin _$BookingRating {
  int get rating => throw _privateConstructorUsedError; // 1-5
  String? get comment => throw _privateConstructorUsedError;
  DateTime? get ratedAt => throw _privateConstructorUsedError;
  Map<String, int> get categoryRatings => throw _privateConstructorUsedError;

  /// Serializes this BookingRating to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingRating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingRatingCopyWith<BookingRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingRatingCopyWith<$Res> {
  factory $BookingRatingCopyWith(
          BookingRating value, $Res Function(BookingRating) then) =
      _$BookingRatingCopyWithImpl<$Res, BookingRating>;
  @useResult
  $Res call(
      {int rating,
      String? comment,
      DateTime? ratedAt,
      Map<String, int> categoryRatings});
}

/// @nodoc
class _$BookingRatingCopyWithImpl<$Res, $Val extends BookingRating>
    implements $BookingRatingCopyWith<$Res> {
  _$BookingRatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingRating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = freezed,
    Object? ratedAt = freezed,
    Object? categoryRatings = null,
  }) {
    return _then(_value.copyWith(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      ratedAt: freezed == ratedAt
          ? _value.ratedAt
          : ratedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryRatings: null == categoryRatings
          ? _value.categoryRatings
          : categoryRatings // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingRatingImplCopyWith<$Res>
    implements $BookingRatingCopyWith<$Res> {
  factory _$$BookingRatingImplCopyWith(
          _$BookingRatingImpl value, $Res Function(_$BookingRatingImpl) then) =
      __$$BookingRatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rating,
      String? comment,
      DateTime? ratedAt,
      Map<String, int> categoryRatings});
}

/// @nodoc
class __$$BookingRatingImplCopyWithImpl<$Res>
    extends _$BookingRatingCopyWithImpl<$Res, _$BookingRatingImpl>
    implements _$$BookingRatingImplCopyWith<$Res> {
  __$$BookingRatingImplCopyWithImpl(
      _$BookingRatingImpl _value, $Res Function(_$BookingRatingImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingRating
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = null,
    Object? comment = freezed,
    Object? ratedAt = freezed,
    Object? categoryRatings = null,
  }) {
    return _then(_$BookingRatingImpl(
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      ratedAt: freezed == ratedAt
          ? _value.ratedAt
          : ratedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryRatings: null == categoryRatings
          ? _value._categoryRatings
          : categoryRatings // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingRatingImpl implements _BookingRating {
  const _$BookingRatingImpl(
      {required this.rating,
      this.comment,
      this.ratedAt,
      final Map<String, int> categoryRatings = const {}})
      : _categoryRatings = categoryRatings;

  factory _$BookingRatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingRatingImplFromJson(json);

  @override
  final int rating;
// 1-5
  @override
  final String? comment;
  @override
  final DateTime? ratedAt;
  final Map<String, int> _categoryRatings;
  @override
  @JsonKey()
  Map<String, int> get categoryRatings {
    if (_categoryRatings is EqualUnmodifiableMapView) return _categoryRatings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categoryRatings);
  }

  @override
  String toString() {
    return 'BookingRating(rating: $rating, comment: $comment, ratedAt: $ratedAt, categoryRatings: $categoryRatings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingRatingImpl &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.ratedAt, ratedAt) || other.ratedAt == ratedAt) &&
            const DeepCollectionEquality()
                .equals(other._categoryRatings, _categoryRatings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, rating, comment, ratedAt,
      const DeepCollectionEquality().hash(_categoryRatings));

  /// Create a copy of BookingRating
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingRatingImplCopyWith<_$BookingRatingImpl> get copyWith =>
      __$$BookingRatingImplCopyWithImpl<_$BookingRatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingRatingImplToJson(
      this,
    );
  }
}

abstract class _BookingRating implements BookingRating {
  const factory _BookingRating(
      {required final int rating,
      final String? comment,
      final DateTime? ratedAt,
      final Map<String, int> categoryRatings}) = _$BookingRatingImpl;

  factory _BookingRating.fromJson(Map<String, dynamic> json) =
      _$BookingRatingImpl.fromJson;

  @override
  int get rating; // 1-5
  @override
  String? get comment;
  @override
  DateTime? get ratedAt;
  @override
  Map<String, int> get categoryRatings;

  /// Create a copy of BookingRating
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingRatingImplCopyWith<_$BookingRatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceReport _$ServiceReportFromJson(Map<String, dynamic> json) {
  return _ServiceReport.fromJson(json);
}

/// @nodoc
mixin _$ServiceReport {
  String get id => throw _privateConstructorUsedError;
  String get bookingId => throw _privateConstructorUsedError;
  DateTime get reportDate => throw _privateConstructorUsedError;
  String get staffId => throw _privateConstructorUsedError;
  String? get summary => throw _privateConstructorUsedError;
  String? get activities => throw _privateConstructorUsedError;
  String? get petBehavior => throw _privateConstructorUsedError;
  String? get healthNotes => throw _privateConstructorUsedError;
  List<String> get photoUrls => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ServiceReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ServiceReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceReportCopyWith<ServiceReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceReportCopyWith<$Res> {
  factory $ServiceReportCopyWith(
          ServiceReport value, $Res Function(ServiceReport) then) =
      _$ServiceReportCopyWithImpl<$Res, ServiceReport>;
  @useResult
  $Res call(
      {String id,
      String bookingId,
      DateTime reportDate,
      String staffId,
      String? summary,
      String? activities,
      String? petBehavior,
      String? healthNotes,
      List<String> photoUrls,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$ServiceReportCopyWithImpl<$Res, $Val extends ServiceReport>
    implements $ServiceReportCopyWith<$Res> {
  _$ServiceReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingId = null,
    Object? reportDate = null,
    Object? staffId = null,
    Object? summary = freezed,
    Object? activities = freezed,
    Object? petBehavior = freezed,
    Object? healthNotes = freezed,
    Object? photoUrls = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as String?,
      petBehavior: freezed == petBehavior
          ? _value.petBehavior
          : petBehavior // ignore: cast_nullable_to_non_nullable
              as String?,
      healthNotes: freezed == healthNotes
          ? _value.healthNotes
          : healthNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: null == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceReportImplCopyWith<$Res>
    implements $ServiceReportCopyWith<$Res> {
  factory _$$ServiceReportImplCopyWith(
          _$ServiceReportImpl value, $Res Function(_$ServiceReportImpl) then) =
      __$$ServiceReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bookingId,
      DateTime reportDate,
      String staffId,
      String? summary,
      String? activities,
      String? petBehavior,
      String? healthNotes,
      List<String> photoUrls,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$ServiceReportImplCopyWithImpl<$Res>
    extends _$ServiceReportCopyWithImpl<$Res, _$ServiceReportImpl>
    implements _$$ServiceReportImplCopyWith<$Res> {
  __$$ServiceReportImplCopyWithImpl(
      _$ServiceReportImpl _value, $Res Function(_$ServiceReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingId = null,
    Object? reportDate = null,
    Object? staffId = null,
    Object? summary = freezed,
    Object? activities = freezed,
    Object? petBehavior = freezed,
    Object? healthNotes = freezed,
    Object? photoUrls = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ServiceReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      reportDate: null == reportDate
          ? _value.reportDate
          : reportDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      staffId: null == staffId
          ? _value.staffId
          : staffId // ignore: cast_nullable_to_non_nullable
              as String,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String?,
      activities: freezed == activities
          ? _value.activities
          : activities // ignore: cast_nullable_to_non_nullable
              as String?,
      petBehavior: freezed == petBehavior
          ? _value.petBehavior
          : petBehavior // ignore: cast_nullable_to_non_nullable
              as String?,
      healthNotes: freezed == healthNotes
          ? _value.healthNotes
          : healthNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: null == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ServiceReportImpl implements _ServiceReport {
  const _$ServiceReportImpl(
      {required this.id,
      required this.bookingId,
      required this.reportDate,
      required this.staffId,
      this.summary,
      this.activities,
      this.petBehavior,
      this.healthNotes,
      final List<String> photoUrls = const [],
      this.createdAt,
      this.updatedAt})
      : _photoUrls = photoUrls;

  factory _$ServiceReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ServiceReportImplFromJson(json);

  @override
  final String id;
  @override
  final String bookingId;
  @override
  final DateTime reportDate;
  @override
  final String staffId;
  @override
  final String? summary;
  @override
  final String? activities;
  @override
  final String? petBehavior;
  @override
  final String? healthNotes;
  final List<String> _photoUrls;
  @override
  @JsonKey()
  List<String> get photoUrls {
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoUrls);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'ServiceReport(id: $id, bookingId: $bookingId, reportDate: $reportDate, staffId: $staffId, summary: $summary, activities: $activities, petBehavior: $petBehavior, healthNotes: $healthNotes, photoUrls: $photoUrls, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.reportDate, reportDate) ||
                other.reportDate == reportDate) &&
            (identical(other.staffId, staffId) || other.staffId == staffId) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.activities, activities) ||
                other.activities == activities) &&
            (identical(other.petBehavior, petBehavior) ||
                other.petBehavior == petBehavior) &&
            (identical(other.healthNotes, healthNotes) ||
                other.healthNotes == healthNotes) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookingId,
      reportDate,
      staffId,
      summary,
      activities,
      petBehavior,
      healthNotes,
      const DeepCollectionEquality().hash(_photoUrls),
      createdAt,
      updatedAt);

  /// Create a copy of ServiceReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceReportImplCopyWith<_$ServiceReportImpl> get copyWith =>
      __$$ServiceReportImplCopyWithImpl<_$ServiceReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ServiceReportImplToJson(
      this,
    );
  }
}

abstract class _ServiceReport implements ServiceReport {
  const factory _ServiceReport(
      {required final String id,
      required final String bookingId,
      required final DateTime reportDate,
      required final String staffId,
      final String? summary,
      final String? activities,
      final String? petBehavior,
      final String? healthNotes,
      final List<String> photoUrls,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$ServiceReportImpl;

  factory _ServiceReport.fromJson(Map<String, dynamic> json) =
      _$ServiceReportImpl.fromJson;

  @override
  String get id;
  @override
  String get bookingId;
  @override
  DateTime get reportDate;
  @override
  String get staffId;
  @override
  String? get summary;
  @override
  String? get activities;
  @override
  String? get petBehavior;
  @override
  String? get healthNotes;
  @override
  List<String> get photoUrls;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of ServiceReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceReportImplCopyWith<_$ServiceReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) {
  return _BookingRequest.fromJson(json);
}

/// @nodoc
mixin _$BookingRequest {
  String get customerId => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  ServiceType get serviceType => throw _privateConstructorUsedError;
  List<String> get petIds => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String> get specialInstructions => throw _privateConstructorUsedError;
  String? get preferredStaffId => throw _privateConstructorUsedError;

  /// Serializes this BookingRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingRequestCopyWith<BookingRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingRequestCopyWith<$Res> {
  factory $BookingRequestCopyWith(
          BookingRequest value, $Res Function(BookingRequest) then) =
      _$BookingRequestCopyWithImpl<$Res, BookingRequest>;
  @useResult
  $Res call(
      {String customerId,
      DateTime startDate,
      DateTime endDate,
      ServiceType serviceType,
      List<String> petIds,
      String? notes,
      List<String> specialInstructions,
      String? preferredStaffId});
}

/// @nodoc
class _$BookingRequestCopyWithImpl<$Res, $Val extends BookingRequest>
    implements $BookingRequestCopyWith<$Res> {
  _$BookingRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? serviceType = null,
    Object? petIds = null,
    Object? notes = freezed,
    Object? specialInstructions = null,
    Object? preferredStaffId = freezed,
  }) {
    return _then(_value.copyWith(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      petIds: null == petIds
          ? _value.petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: null == specialInstructions
          ? _value.specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredStaffId: freezed == preferredStaffId
          ? _value.preferredStaffId
          : preferredStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingRequestImplCopyWith<$Res>
    implements $BookingRequestCopyWith<$Res> {
  factory _$$BookingRequestImplCopyWith(_$BookingRequestImpl value,
          $Res Function(_$BookingRequestImpl) then) =
      __$$BookingRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String customerId,
      DateTime startDate,
      DateTime endDate,
      ServiceType serviceType,
      List<String> petIds,
      String? notes,
      List<String> specialInstructions,
      String? preferredStaffId});
}

/// @nodoc
class __$$BookingRequestImplCopyWithImpl<$Res>
    extends _$BookingRequestCopyWithImpl<$Res, _$BookingRequestImpl>
    implements _$$BookingRequestImplCopyWith<$Res> {
  __$$BookingRequestImplCopyWithImpl(
      _$BookingRequestImpl _value, $Res Function(_$BookingRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? serviceType = null,
    Object? petIds = null,
    Object? notes = freezed,
    Object? specialInstructions = null,
    Object? preferredStaffId = freezed,
  }) {
    return _then(_$BookingRequestImpl(
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serviceType: null == serviceType
          ? _value.serviceType
          : serviceType // ignore: cast_nullable_to_non_nullable
              as ServiceType,
      petIds: null == petIds
          ? _value._petIds
          : petIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      specialInstructions: null == specialInstructions
          ? _value._specialInstructions
          : specialInstructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      preferredStaffId: freezed == preferredStaffId
          ? _value.preferredStaffId
          : preferredStaffId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingRequestImpl implements _BookingRequest {
  const _$BookingRequestImpl(
      {required this.customerId,
      required this.startDate,
      required this.endDate,
      required this.serviceType,
      final List<String> petIds = const [],
      this.notes,
      final List<String> specialInstructions = const [],
      this.preferredStaffId})
      : _petIds = petIds,
        _specialInstructions = specialInstructions;

  factory _$BookingRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingRequestImplFromJson(json);

  @override
  final String customerId;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final ServiceType serviceType;
  final List<String> _petIds;
  @override
  @JsonKey()
  List<String> get petIds {
    if (_petIds is EqualUnmodifiableListView) return _petIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_petIds);
  }

  @override
  final String? notes;
  final List<String> _specialInstructions;
  @override
  @JsonKey()
  List<String> get specialInstructions {
    if (_specialInstructions is EqualUnmodifiableListView)
      return _specialInstructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialInstructions);
  }

  @override
  final String? preferredStaffId;

  @override
  String toString() {
    return 'BookingRequest(customerId: $customerId, startDate: $startDate, endDate: $endDate, serviceType: $serviceType, petIds: $petIds, notes: $notes, specialInstructions: $specialInstructions, preferredStaffId: $preferredStaffId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingRequestImpl &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.serviceType, serviceType) ||
                other.serviceType == serviceType) &&
            const DeepCollectionEquality().equals(other._petIds, _petIds) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            const DeepCollectionEquality()
                .equals(other._specialInstructions, _specialInstructions) &&
            (identical(other.preferredStaffId, preferredStaffId) ||
                other.preferredStaffId == preferredStaffId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customerId,
      startDate,
      endDate,
      serviceType,
      const DeepCollectionEquality().hash(_petIds),
      notes,
      const DeepCollectionEquality().hash(_specialInstructions),
      preferredStaffId);

  /// Create a copy of BookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingRequestImplCopyWith<_$BookingRequestImpl> get copyWith =>
      __$$BookingRequestImplCopyWithImpl<_$BookingRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingRequestImplToJson(
      this,
    );
  }
}

abstract class _BookingRequest implements BookingRequest {
  const factory _BookingRequest(
      {required final String customerId,
      required final DateTime startDate,
      required final DateTime endDate,
      required final ServiceType serviceType,
      final List<String> petIds,
      final String? notes,
      final List<String> specialInstructions,
      final String? preferredStaffId}) = _$BookingRequestImpl;

  factory _BookingRequest.fromJson(Map<String, dynamic> json) =
      _$BookingRequestImpl.fromJson;

  @override
  String get customerId;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  ServiceType get serviceType;
  @override
  List<String> get petIds;
  @override
  String? get notes;
  @override
  List<String> get specialInstructions;
  @override
  String? get preferredStaffId;

  /// Create a copy of BookingRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingRequestImplCopyWith<_$BookingRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
