// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Pet _$PetFromJson(Map<String, dynamic> json) {
  return _Pet.fromJson(json);
}

/// @nodoc
mixin _$Pet {
  String get id => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  PetType get type => throw _privateConstructorUsedError;
  String? get breed => throw _privateConstructorUsedError;
  PetGender get gender => throw _privateConstructorUsedError;
  DateTime? get birthDate => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  double? get weight => throw _privateConstructorUsedError;
  String? get microchipId => throw _privateConstructorUsedError;
  List<String> get photoUrls => throw _privateConstructorUsedError;
  String? get profileImageUrl => throw _privateConstructorUsedError;
  PetHealthInfo? get healthInfo => throw _privateConstructorUsedError;
  PetBehaviorInfo? get behaviorInfo => throw _privateConstructorUsedError;
  List<PetCareInstruction> get careInstructions =>
      throw _privateConstructorUsedError;
  List<PetEmergencyContact> get emergencyContacts =>
      throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Pet to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetCopyWith<Pet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetCopyWith<$Res> {
  factory $PetCopyWith(Pet value, $Res Function(Pet) then) =
      _$PetCopyWithImpl<$Res, Pet>;
  @useResult
  $Res call(
      {String id,
      String customerId,
      String name,
      PetType type,
      String? breed,
      PetGender gender,
      DateTime? birthDate,
      String? color,
      double? weight,
      String? microchipId,
      List<String> photoUrls,
      String? profileImageUrl,
      PetHealthInfo? healthInfo,
      PetBehaviorInfo? behaviorInfo,
      List<PetCareInstruction> careInstructions,
      List<PetEmergencyContact> emergencyContacts,
      bool isActive,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});

  $PetHealthInfoCopyWith<$Res>? get healthInfo;
  $PetBehaviorInfoCopyWith<$Res>? get behaviorInfo;
}

/// @nodoc
class _$PetCopyWithImpl<$Res, $Val extends Pet> implements $PetCopyWith<$Res> {
  _$PetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? name = null,
    Object? type = null,
    Object? breed = freezed,
    Object? gender = null,
    Object? birthDate = freezed,
    Object? color = freezed,
    Object? weight = freezed,
    Object? microchipId = freezed,
    Object? photoUrls = null,
    Object? profileImageUrl = freezed,
    Object? healthInfo = freezed,
    Object? behaviorInfo = freezed,
    Object? careInstructions = null,
    Object? emergencyContacts = null,
    Object? isActive = null,
    Object? notes = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PetType,
      breed: freezed == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PetGender,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      microchipId: freezed == microchipId
          ? _value.microchipId
          : microchipId // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: null == photoUrls
          ? _value.photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      healthInfo: freezed == healthInfo
          ? _value.healthInfo
          : healthInfo // ignore: cast_nullable_to_non_nullable
              as PetHealthInfo?,
      behaviorInfo: freezed == behaviorInfo
          ? _value.behaviorInfo
          : behaviorInfo // ignore: cast_nullable_to_non_nullable
              as PetBehaviorInfo?,
      careInstructions: null == careInstructions
          ? _value.careInstructions
          : careInstructions // ignore: cast_nullable_to_non_nullable
              as List<PetCareInstruction>,
      emergencyContacts: null == emergencyContacts
          ? _value.emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as List<PetEmergencyContact>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PetHealthInfoCopyWith<$Res>? get healthInfo {
    if (_value.healthInfo == null) {
      return null;
    }

    return $PetHealthInfoCopyWith<$Res>(_value.healthInfo!, (value) {
      return _then(_value.copyWith(healthInfo: value) as $Val);
    });
  }

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PetBehaviorInfoCopyWith<$Res>? get behaviorInfo {
    if (_value.behaviorInfo == null) {
      return null;
    }

    return $PetBehaviorInfoCopyWith<$Res>(_value.behaviorInfo!, (value) {
      return _then(_value.copyWith(behaviorInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PetImplCopyWith<$Res> implements $PetCopyWith<$Res> {
  factory _$$PetImplCopyWith(_$PetImpl value, $Res Function(_$PetImpl) then) =
      __$$PetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String customerId,
      String name,
      PetType type,
      String? breed,
      PetGender gender,
      DateTime? birthDate,
      String? color,
      double? weight,
      String? microchipId,
      List<String> photoUrls,
      String? profileImageUrl,
      PetHealthInfo? healthInfo,
      PetBehaviorInfo? behaviorInfo,
      List<PetCareInstruction> careInstructions,
      List<PetEmergencyContact> emergencyContacts,
      bool isActive,
      String? notes,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $PetHealthInfoCopyWith<$Res>? get healthInfo;
  @override
  $PetBehaviorInfoCopyWith<$Res>? get behaviorInfo;
}

/// @nodoc
class __$$PetImplCopyWithImpl<$Res> extends _$PetCopyWithImpl<$Res, _$PetImpl>
    implements _$$PetImplCopyWith<$Res> {
  __$$PetImplCopyWithImpl(_$PetImpl _value, $Res Function(_$PetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? customerId = null,
    Object? name = null,
    Object? type = null,
    Object? breed = freezed,
    Object? gender = null,
    Object? birthDate = freezed,
    Object? color = freezed,
    Object? weight = freezed,
    Object? microchipId = freezed,
    Object? photoUrls = null,
    Object? profileImageUrl = freezed,
    Object? healthInfo = freezed,
    Object? behaviorInfo = freezed,
    Object? careInstructions = null,
    Object? emergencyContacts = null,
    Object? isActive = null,
    Object? notes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$PetImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PetType,
      breed: freezed == breed
          ? _value.breed
          : breed // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PetGender,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      microchipId: freezed == microchipId
          ? _value.microchipId
          : microchipId // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrls: null == photoUrls
          ? _value._photoUrls
          : photoUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profileImageUrl: freezed == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      healthInfo: freezed == healthInfo
          ? _value.healthInfo
          : healthInfo // ignore: cast_nullable_to_non_nullable
              as PetHealthInfo?,
      behaviorInfo: freezed == behaviorInfo
          ? _value.behaviorInfo
          : behaviorInfo // ignore: cast_nullable_to_non_nullable
              as PetBehaviorInfo?,
      careInstructions: null == careInstructions
          ? _value._careInstructions
          : careInstructions // ignore: cast_nullable_to_non_nullable
              as List<PetCareInstruction>,
      emergencyContacts: null == emergencyContacts
          ? _value._emergencyContacts
          : emergencyContacts // ignore: cast_nullable_to_non_nullable
              as List<PetEmergencyContact>,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
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
class _$PetImpl extends _Pet {
  const _$PetImpl(
      {required this.id,
      required this.customerId,
      required this.name,
      this.type = PetType.cat,
      this.breed,
      this.gender = PetGender.unknown,
      this.birthDate,
      this.color,
      this.weight,
      this.microchipId,
      final List<String> photoUrls = const [],
      this.profileImageUrl,
      this.healthInfo,
      this.behaviorInfo,
      final List<PetCareInstruction> careInstructions = const [],
      final List<PetEmergencyContact> emergencyContacts = const [],
      this.isActive = true,
      this.notes,
      this.createdAt,
      this.updatedAt})
      : _photoUrls = photoUrls,
        _careInstructions = careInstructions,
        _emergencyContacts = emergencyContacts,
        super._();

  factory _$PetImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetImplFromJson(json);

  @override
  final String id;
  @override
  final String customerId;
  @override
  final String name;
  @override
  @JsonKey()
  final PetType type;
  @override
  final String? breed;
  @override
  @JsonKey()
  final PetGender gender;
  @override
  final DateTime? birthDate;
  @override
  final String? color;
  @override
  final double? weight;
  @override
  final String? microchipId;
  final List<String> _photoUrls;
  @override
  @JsonKey()
  List<String> get photoUrls {
    if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoUrls);
  }

  @override
  final String? profileImageUrl;
  @override
  final PetHealthInfo? healthInfo;
  @override
  final PetBehaviorInfo? behaviorInfo;
  final List<PetCareInstruction> _careInstructions;
  @override
  @JsonKey()
  List<PetCareInstruction> get careInstructions {
    if (_careInstructions is EqualUnmodifiableListView)
      return _careInstructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_careInstructions);
  }

  final List<PetEmergencyContact> _emergencyContacts;
  @override
  @JsonKey()
  List<PetEmergencyContact> get emergencyContacts {
    if (_emergencyContacts is EqualUnmodifiableListView)
      return _emergencyContacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_emergencyContacts);
  }

  @override
  @JsonKey()
  final bool isActive;
  @override
  final String? notes;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Pet(id: $id, customerId: $customerId, name: $name, type: $type, breed: $breed, gender: $gender, birthDate: $birthDate, color: $color, weight: $weight, microchipId: $microchipId, photoUrls: $photoUrls, profileImageUrl: $profileImageUrl, healthInfo: $healthInfo, behaviorInfo: $behaviorInfo, careInstructions: $careInstructions, emergencyContacts: $emergencyContacts, isActive: $isActive, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.breed, breed) || other.breed == breed) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.microchipId, microchipId) ||
                other.microchipId == microchipId) &&
            const DeepCollectionEquality()
                .equals(other._photoUrls, _photoUrls) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.healthInfo, healthInfo) ||
                other.healthInfo == healthInfo) &&
            (identical(other.behaviorInfo, behaviorInfo) ||
                other.behaviorInfo == behaviorInfo) &&
            const DeepCollectionEquality()
                .equals(other._careInstructions, _careInstructions) &&
            const DeepCollectionEquality()
                .equals(other._emergencyContacts, _emergencyContacts) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
        name,
        type,
        breed,
        gender,
        birthDate,
        color,
        weight,
        microchipId,
        const DeepCollectionEquality().hash(_photoUrls),
        profileImageUrl,
        healthInfo,
        behaviorInfo,
        const DeepCollectionEquality().hash(_careInstructions),
        const DeepCollectionEquality().hash(_emergencyContacts),
        isActive,
        notes,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      __$$PetImplCopyWithImpl<_$PetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetImplToJson(
      this,
    );
  }
}

abstract class _Pet extends Pet {
  const factory _Pet(
      {required final String id,
      required final String customerId,
      required final String name,
      final PetType type,
      final String? breed,
      final PetGender gender,
      final DateTime? birthDate,
      final String? color,
      final double? weight,
      final String? microchipId,
      final List<String> photoUrls,
      final String? profileImageUrl,
      final PetHealthInfo? healthInfo,
      final PetBehaviorInfo? behaviorInfo,
      final List<PetCareInstruction> careInstructions,
      final List<PetEmergencyContact> emergencyContacts,
      final bool isActive,
      final String? notes,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$PetImpl;
  const _Pet._() : super._();

  factory _Pet.fromJson(Map<String, dynamic> json) = _$PetImpl.fromJson;

  @override
  String get id;
  @override
  String get customerId;
  @override
  String get name;
  @override
  PetType get type;
  @override
  String? get breed;
  @override
  PetGender get gender;
  @override
  DateTime? get birthDate;
  @override
  String? get color;
  @override
  double? get weight;
  @override
  String? get microchipId;
  @override
  List<String> get photoUrls;
  @override
  String? get profileImageUrl;
  @override
  PetHealthInfo? get healthInfo;
  @override
  PetBehaviorInfo? get behaviorInfo;
  @override
  List<PetCareInstruction> get careInstructions;
  @override
  List<PetEmergencyContact> get emergencyContacts;
  @override
  bool get isActive;
  @override
  String? get notes;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Pet
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetImplCopyWith<_$PetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PetHealthInfo _$PetHealthInfoFromJson(Map<String, dynamic> json) {
  return _PetHealthInfo.fromJson(json);
}

/// @nodoc
mixin _$PetHealthInfo {
  List<String> get allergies => throw _privateConstructorUsedError;
  List<String> get medications => throw _privateConstructorUsedError;
  List<String> get medicalConditions => throw _privateConstructorUsedError;
  String? get veterinarianName => throw _privateConstructorUsedError;
  String? get veterinarianPhone => throw _privateConstructorUsedError;
  String? get veterinarianAddress => throw _privateConstructorUsedError;
  List<VaccinationRecord> get vaccinations =>
      throw _privateConstructorUsedError;
  String? get insuranceProvider => throw _privateConstructorUsedError;
  String? get insurancePolicy => throw _privateConstructorUsedError;
  String? get specialNeeds => throw _privateConstructorUsedError;
  DateTime? get lastCheckup => throw _privateConstructorUsedError;

  /// Serializes this PetHealthInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PetHealthInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetHealthInfoCopyWith<PetHealthInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetHealthInfoCopyWith<$Res> {
  factory $PetHealthInfoCopyWith(
          PetHealthInfo value, $Res Function(PetHealthInfo) then) =
      _$PetHealthInfoCopyWithImpl<$Res, PetHealthInfo>;
  @useResult
  $Res call(
      {List<String> allergies,
      List<String> medications,
      List<String> medicalConditions,
      String? veterinarianName,
      String? veterinarianPhone,
      String? veterinarianAddress,
      List<VaccinationRecord> vaccinations,
      String? insuranceProvider,
      String? insurancePolicy,
      String? specialNeeds,
      DateTime? lastCheckup});
}

/// @nodoc
class _$PetHealthInfoCopyWithImpl<$Res, $Val extends PetHealthInfo>
    implements $PetHealthInfoCopyWith<$Res> {
  _$PetHealthInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetHealthInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allergies = null,
    Object? medications = null,
    Object? medicalConditions = null,
    Object? veterinarianName = freezed,
    Object? veterinarianPhone = freezed,
    Object? veterinarianAddress = freezed,
    Object? vaccinations = null,
    Object? insuranceProvider = freezed,
    Object? insurancePolicy = freezed,
    Object? specialNeeds = freezed,
    Object? lastCheckup = freezed,
  }) {
    return _then(_value.copyWith(
      allergies: null == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      medications: null == medications
          ? _value.medications
          : medications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      medicalConditions: null == medicalConditions
          ? _value.medicalConditions
          : medicalConditions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      veterinarianName: freezed == veterinarianName
          ? _value.veterinarianName
          : veterinarianName // ignore: cast_nullable_to_non_nullable
              as String?,
      veterinarianPhone: freezed == veterinarianPhone
          ? _value.veterinarianPhone
          : veterinarianPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      veterinarianAddress: freezed == veterinarianAddress
          ? _value.veterinarianAddress
          : veterinarianAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      vaccinations: null == vaccinations
          ? _value.vaccinations
          : vaccinations // ignore: cast_nullable_to_non_nullable
              as List<VaccinationRecord>,
      insuranceProvider: freezed == insuranceProvider
          ? _value.insuranceProvider
          : insuranceProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      insurancePolicy: freezed == insurancePolicy
          ? _value.insurancePolicy
          : insurancePolicy // ignore: cast_nullable_to_non_nullable
              as String?,
      specialNeeds: freezed == specialNeeds
          ? _value.specialNeeds
          : specialNeeds // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCheckup: freezed == lastCheckup
          ? _value.lastCheckup
          : lastCheckup // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetHealthInfoImplCopyWith<$Res>
    implements $PetHealthInfoCopyWith<$Res> {
  factory _$$PetHealthInfoImplCopyWith(
          _$PetHealthInfoImpl value, $Res Function(_$PetHealthInfoImpl) then) =
      __$$PetHealthInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> allergies,
      List<String> medications,
      List<String> medicalConditions,
      String? veterinarianName,
      String? veterinarianPhone,
      String? veterinarianAddress,
      List<VaccinationRecord> vaccinations,
      String? insuranceProvider,
      String? insurancePolicy,
      String? specialNeeds,
      DateTime? lastCheckup});
}

/// @nodoc
class __$$PetHealthInfoImplCopyWithImpl<$Res>
    extends _$PetHealthInfoCopyWithImpl<$Res, _$PetHealthInfoImpl>
    implements _$$PetHealthInfoImplCopyWith<$Res> {
  __$$PetHealthInfoImplCopyWithImpl(
      _$PetHealthInfoImpl _value, $Res Function(_$PetHealthInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PetHealthInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allergies = null,
    Object? medications = null,
    Object? medicalConditions = null,
    Object? veterinarianName = freezed,
    Object? veterinarianPhone = freezed,
    Object? veterinarianAddress = freezed,
    Object? vaccinations = null,
    Object? insuranceProvider = freezed,
    Object? insurancePolicy = freezed,
    Object? specialNeeds = freezed,
    Object? lastCheckup = freezed,
  }) {
    return _then(_$PetHealthInfoImpl(
      allergies: null == allergies
          ? _value._allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      medications: null == medications
          ? _value._medications
          : medications // ignore: cast_nullable_to_non_nullable
              as List<String>,
      medicalConditions: null == medicalConditions
          ? _value._medicalConditions
          : medicalConditions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      veterinarianName: freezed == veterinarianName
          ? _value.veterinarianName
          : veterinarianName // ignore: cast_nullable_to_non_nullable
              as String?,
      veterinarianPhone: freezed == veterinarianPhone
          ? _value.veterinarianPhone
          : veterinarianPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      veterinarianAddress: freezed == veterinarianAddress
          ? _value.veterinarianAddress
          : veterinarianAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      vaccinations: null == vaccinations
          ? _value._vaccinations
          : vaccinations // ignore: cast_nullable_to_non_nullable
              as List<VaccinationRecord>,
      insuranceProvider: freezed == insuranceProvider
          ? _value.insuranceProvider
          : insuranceProvider // ignore: cast_nullable_to_non_nullable
              as String?,
      insurancePolicy: freezed == insurancePolicy
          ? _value.insurancePolicy
          : insurancePolicy // ignore: cast_nullable_to_non_nullable
              as String?,
      specialNeeds: freezed == specialNeeds
          ? _value.specialNeeds
          : specialNeeds // ignore: cast_nullable_to_non_nullable
              as String?,
      lastCheckup: freezed == lastCheckup
          ? _value.lastCheckup
          : lastCheckup // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetHealthInfoImpl implements _PetHealthInfo {
  const _$PetHealthInfoImpl(
      {final List<String> allergies = const [],
      final List<String> medications = const [],
      final List<String> medicalConditions = const [],
      this.veterinarianName,
      this.veterinarianPhone,
      this.veterinarianAddress,
      final List<VaccinationRecord> vaccinations = const [],
      this.insuranceProvider,
      this.insurancePolicy,
      this.specialNeeds,
      this.lastCheckup})
      : _allergies = allergies,
        _medications = medications,
        _medicalConditions = medicalConditions,
        _vaccinations = vaccinations;

  factory _$PetHealthInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetHealthInfoImplFromJson(json);

  final List<String> _allergies;
  @override
  @JsonKey()
  List<String> get allergies {
    if (_allergies is EqualUnmodifiableListView) return _allergies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergies);
  }

  final List<String> _medications;
  @override
  @JsonKey()
  List<String> get medications {
    if (_medications is EqualUnmodifiableListView) return _medications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medications);
  }

  final List<String> _medicalConditions;
  @override
  @JsonKey()
  List<String> get medicalConditions {
    if (_medicalConditions is EqualUnmodifiableListView)
      return _medicalConditions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_medicalConditions);
  }

  @override
  final String? veterinarianName;
  @override
  final String? veterinarianPhone;
  @override
  final String? veterinarianAddress;
  final List<VaccinationRecord> _vaccinations;
  @override
  @JsonKey()
  List<VaccinationRecord> get vaccinations {
    if (_vaccinations is EqualUnmodifiableListView) return _vaccinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vaccinations);
  }

  @override
  final String? insuranceProvider;
  @override
  final String? insurancePolicy;
  @override
  final String? specialNeeds;
  @override
  final DateTime? lastCheckup;

  @override
  String toString() {
    return 'PetHealthInfo(allergies: $allergies, medications: $medications, medicalConditions: $medicalConditions, veterinarianName: $veterinarianName, veterinarianPhone: $veterinarianPhone, veterinarianAddress: $veterinarianAddress, vaccinations: $vaccinations, insuranceProvider: $insuranceProvider, insurancePolicy: $insurancePolicy, specialNeeds: $specialNeeds, lastCheckup: $lastCheckup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetHealthInfoImpl &&
            const DeepCollectionEquality()
                .equals(other._allergies, _allergies) &&
            const DeepCollectionEquality()
                .equals(other._medications, _medications) &&
            const DeepCollectionEquality()
                .equals(other._medicalConditions, _medicalConditions) &&
            (identical(other.veterinarianName, veterinarianName) ||
                other.veterinarianName == veterinarianName) &&
            (identical(other.veterinarianPhone, veterinarianPhone) ||
                other.veterinarianPhone == veterinarianPhone) &&
            (identical(other.veterinarianAddress, veterinarianAddress) ||
                other.veterinarianAddress == veterinarianAddress) &&
            const DeepCollectionEquality()
                .equals(other._vaccinations, _vaccinations) &&
            (identical(other.insuranceProvider, insuranceProvider) ||
                other.insuranceProvider == insuranceProvider) &&
            (identical(other.insurancePolicy, insurancePolicy) ||
                other.insurancePolicy == insurancePolicy) &&
            (identical(other.specialNeeds, specialNeeds) ||
                other.specialNeeds == specialNeeds) &&
            (identical(other.lastCheckup, lastCheckup) ||
                other.lastCheckup == lastCheckup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allergies),
      const DeepCollectionEquality().hash(_medications),
      const DeepCollectionEquality().hash(_medicalConditions),
      veterinarianName,
      veterinarianPhone,
      veterinarianAddress,
      const DeepCollectionEquality().hash(_vaccinations),
      insuranceProvider,
      insurancePolicy,
      specialNeeds,
      lastCheckup);

  /// Create a copy of PetHealthInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetHealthInfoImplCopyWith<_$PetHealthInfoImpl> get copyWith =>
      __$$PetHealthInfoImplCopyWithImpl<_$PetHealthInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetHealthInfoImplToJson(
      this,
    );
  }
}

abstract class _PetHealthInfo implements PetHealthInfo {
  const factory _PetHealthInfo(
      {final List<String> allergies,
      final List<String> medications,
      final List<String> medicalConditions,
      final String? veterinarianName,
      final String? veterinarianPhone,
      final String? veterinarianAddress,
      final List<VaccinationRecord> vaccinations,
      final String? insuranceProvider,
      final String? insurancePolicy,
      final String? specialNeeds,
      final DateTime? lastCheckup}) = _$PetHealthInfoImpl;

  factory _PetHealthInfo.fromJson(Map<String, dynamic> json) =
      _$PetHealthInfoImpl.fromJson;

  @override
  List<String> get allergies;
  @override
  List<String> get medications;
  @override
  List<String> get medicalConditions;
  @override
  String? get veterinarianName;
  @override
  String? get veterinarianPhone;
  @override
  String? get veterinarianAddress;
  @override
  List<VaccinationRecord> get vaccinations;
  @override
  String? get insuranceProvider;
  @override
  String? get insurancePolicy;
  @override
  String? get specialNeeds;
  @override
  DateTime? get lastCheckup;

  /// Create a copy of PetHealthInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetHealthInfoImplCopyWith<_$PetHealthInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PetBehaviorInfo _$PetBehaviorInfoFromJson(Map<String, dynamic> json) {
  return _PetBehaviorInfo.fromJson(json);
}

/// @nodoc
mixin _$PetBehaviorInfo {
  String? get temperament => throw _privateConstructorUsedError;
  List<String> get likes => throw _privateConstructorUsedError;
  List<String> get dislikes => throw _privateConstructorUsedError;
  List<String> get fears => throw _privateConstructorUsedError;
  String? get socialBehavior => throw _privateConstructorUsedError;
  String? get activityLevel => throw _privateConstructorUsedError;
  String? get feedingBehavior => throw _privateConstructorUsedError;
  List<String> get behaviorNotes => throw _privateConstructorUsedError;

  /// Serializes this PetBehaviorInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PetBehaviorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetBehaviorInfoCopyWith<PetBehaviorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetBehaviorInfoCopyWith<$Res> {
  factory $PetBehaviorInfoCopyWith(
          PetBehaviorInfo value, $Res Function(PetBehaviorInfo) then) =
      _$PetBehaviorInfoCopyWithImpl<$Res, PetBehaviorInfo>;
  @useResult
  $Res call(
      {String? temperament,
      List<String> likes,
      List<String> dislikes,
      List<String> fears,
      String? socialBehavior,
      String? activityLevel,
      String? feedingBehavior,
      List<String> behaviorNotes});
}

/// @nodoc
class _$PetBehaviorInfoCopyWithImpl<$Res, $Val extends PetBehaviorInfo>
    implements $PetBehaviorInfoCopyWith<$Res> {
  _$PetBehaviorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetBehaviorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperament = freezed,
    Object? likes = null,
    Object? dislikes = null,
    Object? fears = null,
    Object? socialBehavior = freezed,
    Object? activityLevel = freezed,
    Object? feedingBehavior = freezed,
    Object? behaviorNotes = null,
  }) {
    return _then(_value.copyWith(
      temperament: freezed == temperament
          ? _value.temperament
          : temperament // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dislikes: null == dislikes
          ? _value.dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fears: null == fears
          ? _value.fears
          : fears // ignore: cast_nullable_to_non_nullable
              as List<String>,
      socialBehavior: freezed == socialBehavior
          ? _value.socialBehavior
          : socialBehavior // ignore: cast_nullable_to_non_nullable
              as String?,
      activityLevel: freezed == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      feedingBehavior: freezed == feedingBehavior
          ? _value.feedingBehavior
          : feedingBehavior // ignore: cast_nullable_to_non_nullable
              as String?,
      behaviorNotes: null == behaviorNotes
          ? _value.behaviorNotes
          : behaviorNotes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetBehaviorInfoImplCopyWith<$Res>
    implements $PetBehaviorInfoCopyWith<$Res> {
  factory _$$PetBehaviorInfoImplCopyWith(_$PetBehaviorInfoImpl value,
          $Res Function(_$PetBehaviorInfoImpl) then) =
      __$$PetBehaviorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? temperament,
      List<String> likes,
      List<String> dislikes,
      List<String> fears,
      String? socialBehavior,
      String? activityLevel,
      String? feedingBehavior,
      List<String> behaviorNotes});
}

/// @nodoc
class __$$PetBehaviorInfoImplCopyWithImpl<$Res>
    extends _$PetBehaviorInfoCopyWithImpl<$Res, _$PetBehaviorInfoImpl>
    implements _$$PetBehaviorInfoImplCopyWith<$Res> {
  __$$PetBehaviorInfoImplCopyWithImpl(
      _$PetBehaviorInfoImpl _value, $Res Function(_$PetBehaviorInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PetBehaviorInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temperament = freezed,
    Object? likes = null,
    Object? dislikes = null,
    Object? fears = null,
    Object? socialBehavior = freezed,
    Object? activityLevel = freezed,
    Object? feedingBehavior = freezed,
    Object? behaviorNotes = null,
  }) {
    return _then(_$PetBehaviorInfoImpl(
      temperament: freezed == temperament
          ? _value.temperament
          : temperament // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value._likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dislikes: null == dislikes
          ? _value._dislikes
          : dislikes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fears: null == fears
          ? _value._fears
          : fears // ignore: cast_nullable_to_non_nullable
              as List<String>,
      socialBehavior: freezed == socialBehavior
          ? _value.socialBehavior
          : socialBehavior // ignore: cast_nullable_to_non_nullable
              as String?,
      activityLevel: freezed == activityLevel
          ? _value.activityLevel
          : activityLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      feedingBehavior: freezed == feedingBehavior
          ? _value.feedingBehavior
          : feedingBehavior // ignore: cast_nullable_to_non_nullable
              as String?,
      behaviorNotes: null == behaviorNotes
          ? _value._behaviorNotes
          : behaviorNotes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetBehaviorInfoImpl implements _PetBehaviorInfo {
  const _$PetBehaviorInfoImpl(
      {this.temperament,
      final List<String> likes = const [],
      final List<String> dislikes = const [],
      final List<String> fears = const [],
      this.socialBehavior,
      this.activityLevel,
      this.feedingBehavior,
      final List<String> behaviorNotes = const []})
      : _likes = likes,
        _dislikes = dislikes,
        _fears = fears,
        _behaviorNotes = behaviorNotes;

  factory _$PetBehaviorInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetBehaviorInfoImplFromJson(json);

  @override
  final String? temperament;
  final List<String> _likes;
  @override
  @JsonKey()
  List<String> get likes {
    if (_likes is EqualUnmodifiableListView) return _likes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likes);
  }

  final List<String> _dislikes;
  @override
  @JsonKey()
  List<String> get dislikes {
    if (_dislikes is EqualUnmodifiableListView) return _dislikes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dislikes);
  }

  final List<String> _fears;
  @override
  @JsonKey()
  List<String> get fears {
    if (_fears is EqualUnmodifiableListView) return _fears;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fears);
  }

  @override
  final String? socialBehavior;
  @override
  final String? activityLevel;
  @override
  final String? feedingBehavior;
  final List<String> _behaviorNotes;
  @override
  @JsonKey()
  List<String> get behaviorNotes {
    if (_behaviorNotes is EqualUnmodifiableListView) return _behaviorNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_behaviorNotes);
  }

  @override
  String toString() {
    return 'PetBehaviorInfo(temperament: $temperament, likes: $likes, dislikes: $dislikes, fears: $fears, socialBehavior: $socialBehavior, activityLevel: $activityLevel, feedingBehavior: $feedingBehavior, behaviorNotes: $behaviorNotes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetBehaviorInfoImpl &&
            (identical(other.temperament, temperament) ||
                other.temperament == temperament) &&
            const DeepCollectionEquality().equals(other._likes, _likes) &&
            const DeepCollectionEquality().equals(other._dislikes, _dislikes) &&
            const DeepCollectionEquality().equals(other._fears, _fears) &&
            (identical(other.socialBehavior, socialBehavior) ||
                other.socialBehavior == socialBehavior) &&
            (identical(other.activityLevel, activityLevel) ||
                other.activityLevel == activityLevel) &&
            (identical(other.feedingBehavior, feedingBehavior) ||
                other.feedingBehavior == feedingBehavior) &&
            const DeepCollectionEquality()
                .equals(other._behaviorNotes, _behaviorNotes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      temperament,
      const DeepCollectionEquality().hash(_likes),
      const DeepCollectionEquality().hash(_dislikes),
      const DeepCollectionEquality().hash(_fears),
      socialBehavior,
      activityLevel,
      feedingBehavior,
      const DeepCollectionEquality().hash(_behaviorNotes));

  /// Create a copy of PetBehaviorInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetBehaviorInfoImplCopyWith<_$PetBehaviorInfoImpl> get copyWith =>
      __$$PetBehaviorInfoImplCopyWithImpl<_$PetBehaviorInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetBehaviorInfoImplToJson(
      this,
    );
  }
}

abstract class _PetBehaviorInfo implements PetBehaviorInfo {
  const factory _PetBehaviorInfo(
      {final String? temperament,
      final List<String> likes,
      final List<String> dislikes,
      final List<String> fears,
      final String? socialBehavior,
      final String? activityLevel,
      final String? feedingBehavior,
      final List<String> behaviorNotes}) = _$PetBehaviorInfoImpl;

  factory _PetBehaviorInfo.fromJson(Map<String, dynamic> json) =
      _$PetBehaviorInfoImpl.fromJson;

  @override
  String? get temperament;
  @override
  List<String> get likes;
  @override
  List<String> get dislikes;
  @override
  List<String> get fears;
  @override
  String? get socialBehavior;
  @override
  String? get activityLevel;
  @override
  String? get feedingBehavior;
  @override
  List<String> get behaviorNotes;

  /// Create a copy of PetBehaviorInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetBehaviorInfoImplCopyWith<_$PetBehaviorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PetCareInstruction _$PetCareInstructionFromJson(Map<String, dynamic> json) {
  return _PetCareInstruction.fromJson(json);
}

/// @nodoc
mixin _$PetCareInstruction {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get instruction => throw _privateConstructorUsedError;
  String? get category =>
      throw _privateConstructorUsedError; // 'feeding', 'medication', 'exercise', 'grooming', 'other'
  int? get priority =>
      throw _privateConstructorUsedError; // 1 (high) to 3 (low)
  bool? get isDaily => throw _privateConstructorUsedError;
  String? get timeOfDay => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this PetCareInstruction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PetCareInstruction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetCareInstructionCopyWith<PetCareInstruction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetCareInstructionCopyWith<$Res> {
  factory $PetCareInstructionCopyWith(
          PetCareInstruction value, $Res Function(PetCareInstruction) then) =
      _$PetCareInstructionCopyWithImpl<$Res, PetCareInstruction>;
  @useResult
  $Res call(
      {String id,
      String title,
      String instruction,
      String? category,
      int? priority,
      bool? isDaily,
      String? timeOfDay,
      DateTime? createdAt});
}

/// @nodoc
class _$PetCareInstructionCopyWithImpl<$Res, $Val extends PetCareInstruction>
    implements $PetCareInstructionCopyWith<$Res> {
  _$PetCareInstructionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetCareInstruction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? instruction = null,
    Object? category = freezed,
    Object? priority = freezed,
    Object? isDaily = freezed,
    Object? timeOfDay = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      isDaily: freezed == isDaily
          ? _value.isDaily
          : isDaily // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeOfDay: freezed == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetCareInstructionImplCopyWith<$Res>
    implements $PetCareInstructionCopyWith<$Res> {
  factory _$$PetCareInstructionImplCopyWith(_$PetCareInstructionImpl value,
          $Res Function(_$PetCareInstructionImpl) then) =
      __$$PetCareInstructionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String instruction,
      String? category,
      int? priority,
      bool? isDaily,
      String? timeOfDay,
      DateTime? createdAt});
}

/// @nodoc
class __$$PetCareInstructionImplCopyWithImpl<$Res>
    extends _$PetCareInstructionCopyWithImpl<$Res, _$PetCareInstructionImpl>
    implements _$$PetCareInstructionImplCopyWith<$Res> {
  __$$PetCareInstructionImplCopyWithImpl(_$PetCareInstructionImpl _value,
      $Res Function(_$PetCareInstructionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PetCareInstruction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? instruction = null,
    Object? category = freezed,
    Object? priority = freezed,
    Object? isDaily = freezed,
    Object? timeOfDay = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PetCareInstructionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      instruction: null == instruction
          ? _value.instruction
          : instruction // ignore: cast_nullable_to_non_nullable
              as String,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      isDaily: freezed == isDaily
          ? _value.isDaily
          : isDaily // ignore: cast_nullable_to_non_nullable
              as bool?,
      timeOfDay: freezed == timeOfDay
          ? _value.timeOfDay
          : timeOfDay // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetCareInstructionImpl implements _PetCareInstruction {
  const _$PetCareInstructionImpl(
      {required this.id,
      required this.title,
      required this.instruction,
      this.category,
      this.priority,
      this.isDaily,
      this.timeOfDay,
      this.createdAt});

  factory _$PetCareInstructionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetCareInstructionImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String instruction;
  @override
  final String? category;
// 'feeding', 'medication', 'exercise', 'grooming', 'other'
  @override
  final int? priority;
// 1 (high) to 3 (low)
  @override
  final bool? isDaily;
  @override
  final String? timeOfDay;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PetCareInstruction(id: $id, title: $title, instruction: $instruction, category: $category, priority: $priority, isDaily: $isDaily, timeOfDay: $timeOfDay, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetCareInstructionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.instruction, instruction) ||
                other.instruction == instruction) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isDaily, isDaily) || other.isDaily == isDaily) &&
            (identical(other.timeOfDay, timeOfDay) ||
                other.timeOfDay == timeOfDay) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, instruction, category,
      priority, isDaily, timeOfDay, createdAt);

  /// Create a copy of PetCareInstruction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetCareInstructionImplCopyWith<_$PetCareInstructionImpl> get copyWith =>
      __$$PetCareInstructionImplCopyWithImpl<_$PetCareInstructionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetCareInstructionImplToJson(
      this,
    );
  }
}

abstract class _PetCareInstruction implements PetCareInstruction {
  const factory _PetCareInstruction(
      {required final String id,
      required final String title,
      required final String instruction,
      final String? category,
      final int? priority,
      final bool? isDaily,
      final String? timeOfDay,
      final DateTime? createdAt}) = _$PetCareInstructionImpl;

  factory _PetCareInstruction.fromJson(Map<String, dynamic> json) =
      _$PetCareInstructionImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get instruction;
  @override
  String?
      get category; // 'feeding', 'medication', 'exercise', 'grooming', 'other'
  @override
  int? get priority; // 1 (high) to 3 (low)
  @override
  bool? get isDaily;
  @override
  String? get timeOfDay;
  @override
  DateTime? get createdAt;

  /// Create a copy of PetCareInstruction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetCareInstructionImplCopyWith<_$PetCareInstructionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

VaccinationRecord _$VaccinationRecordFromJson(Map<String, dynamic> json) {
  return _VaccinationRecord.fromJson(json);
}

/// @nodoc
mixin _$VaccinationRecord {
  String get vaccine => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  DateTime? get expiryDate => throw _privateConstructorUsedError;
  String? get veterinarian => throw _privateConstructorUsedError;
  String? get batchNumber => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this VaccinationRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaccinationRecordCopyWith<VaccinationRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaccinationRecordCopyWith<$Res> {
  factory $VaccinationRecordCopyWith(
          VaccinationRecord value, $Res Function(VaccinationRecord) then) =
      _$VaccinationRecordCopyWithImpl<$Res, VaccinationRecord>;
  @useResult
  $Res call(
      {String vaccine,
      DateTime date,
      DateTime? expiryDate,
      String? veterinarian,
      String? batchNumber,
      String? notes});
}

/// @nodoc
class _$VaccinationRecordCopyWithImpl<$Res, $Val extends VaccinationRecord>
    implements $VaccinationRecordCopyWith<$Res> {
  _$VaccinationRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccine = null,
    Object? date = null,
    Object? expiryDate = freezed,
    Object? veterinarian = freezed,
    Object? batchNumber = freezed,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      vaccine: null == vaccine
          ? _value.vaccine
          : vaccine // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      veterinarian: freezed == veterinarian
          ? _value.veterinarian
          : veterinarian // ignore: cast_nullable_to_non_nullable
              as String?,
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaccinationRecordImplCopyWith<$Res>
    implements $VaccinationRecordCopyWith<$Res> {
  factory _$$VaccinationRecordImplCopyWith(_$VaccinationRecordImpl value,
          $Res Function(_$VaccinationRecordImpl) then) =
      __$$VaccinationRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String vaccine,
      DateTime date,
      DateTime? expiryDate,
      String? veterinarian,
      String? batchNumber,
      String? notes});
}

/// @nodoc
class __$$VaccinationRecordImplCopyWithImpl<$Res>
    extends _$VaccinationRecordCopyWithImpl<$Res, _$VaccinationRecordImpl>
    implements _$$VaccinationRecordImplCopyWith<$Res> {
  __$$VaccinationRecordImplCopyWithImpl(_$VaccinationRecordImpl _value,
      $Res Function(_$VaccinationRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vaccine = null,
    Object? date = null,
    Object? expiryDate = freezed,
    Object? veterinarian = freezed,
    Object? batchNumber = freezed,
    Object? notes = freezed,
  }) {
    return _then(_$VaccinationRecordImpl(
      vaccine: null == vaccine
          ? _value.vaccine
          : vaccine // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiryDate: freezed == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      veterinarian: freezed == veterinarian
          ? _value.veterinarian
          : veterinarian // ignore: cast_nullable_to_non_nullable
              as String?,
      batchNumber: freezed == batchNumber
          ? _value.batchNumber
          : batchNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaccinationRecordImpl implements _VaccinationRecord {
  const _$VaccinationRecordImpl(
      {required this.vaccine,
      required this.date,
      this.expiryDate,
      this.veterinarian,
      this.batchNumber,
      this.notes});

  factory _$VaccinationRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaccinationRecordImplFromJson(json);

  @override
  final String vaccine;
  @override
  final DateTime date;
  @override
  final DateTime? expiryDate;
  @override
  final String? veterinarian;
  @override
  final String? batchNumber;
  @override
  final String? notes;

  @override
  String toString() {
    return 'VaccinationRecord(vaccine: $vaccine, date: $date, expiryDate: $expiryDate, veterinarian: $veterinarian, batchNumber: $batchNumber, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaccinationRecordImpl &&
            (identical(other.vaccine, vaccine) || other.vaccine == vaccine) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.veterinarian, veterinarian) ||
                other.veterinarian == veterinarian) &&
            (identical(other.batchNumber, batchNumber) ||
                other.batchNumber == batchNumber) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, vaccine, date, expiryDate, veterinarian, batchNumber, notes);

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaccinationRecordImplCopyWith<_$VaccinationRecordImpl> get copyWith =>
      __$$VaccinationRecordImplCopyWithImpl<_$VaccinationRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaccinationRecordImplToJson(
      this,
    );
  }
}

abstract class _VaccinationRecord implements VaccinationRecord {
  const factory _VaccinationRecord(
      {required final String vaccine,
      required final DateTime date,
      final DateTime? expiryDate,
      final String? veterinarian,
      final String? batchNumber,
      final String? notes}) = _$VaccinationRecordImpl;

  factory _VaccinationRecord.fromJson(Map<String, dynamic> json) =
      _$VaccinationRecordImpl.fromJson;

  @override
  String get vaccine;
  @override
  DateTime get date;
  @override
  DateTime? get expiryDate;
  @override
  String? get veterinarian;
  @override
  String? get batchNumber;
  @override
  String? get notes;

  /// Create a copy of VaccinationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaccinationRecordImplCopyWith<_$VaccinationRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PetEmergencyContact _$PetEmergencyContactFromJson(Map<String, dynamic> json) {
  return _PetEmergencyContact.fromJson(json);
}

/// @nodoc
mixin _$PetEmergencyContact {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String? get relationship => throw _privateConstructorUsedError;

  /// Serializes this PetEmergencyContact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PetEmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetEmergencyContactCopyWith<PetEmergencyContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetEmergencyContactCopyWith<$Res> {
  factory $PetEmergencyContactCopyWith(
          PetEmergencyContact value, $Res Function(PetEmergencyContact) then) =
      _$PetEmergencyContactCopyWithImpl<$Res, PetEmergencyContact>;
  @useResult
  $Res call({String name, String phone, String? relationship});
}

/// @nodoc
class _$PetEmergencyContactCopyWithImpl<$Res, $Val extends PetEmergencyContact>
    implements $PetEmergencyContactCopyWith<$Res> {
  _$PetEmergencyContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetEmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? relationship = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      relationship: freezed == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetEmergencyContactImplCopyWith<$Res>
    implements $PetEmergencyContactCopyWith<$Res> {
  factory _$$PetEmergencyContactImplCopyWith(_$PetEmergencyContactImpl value,
          $Res Function(_$PetEmergencyContactImpl) then) =
      __$$PetEmergencyContactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phone, String? relationship});
}

/// @nodoc
class __$$PetEmergencyContactImplCopyWithImpl<$Res>
    extends _$PetEmergencyContactCopyWithImpl<$Res, _$PetEmergencyContactImpl>
    implements _$$PetEmergencyContactImplCopyWith<$Res> {
  __$$PetEmergencyContactImplCopyWithImpl(_$PetEmergencyContactImpl _value,
      $Res Function(_$PetEmergencyContactImpl) _then)
      : super(_value, _then);

  /// Create a copy of PetEmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
    Object? relationship = freezed,
  }) {
    return _then(_$PetEmergencyContactImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      relationship: freezed == relationship
          ? _value.relationship
          : relationship // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PetEmergencyContactImpl implements _PetEmergencyContact {
  const _$PetEmergencyContactImpl(
      {required this.name, required this.phone, this.relationship});

  factory _$PetEmergencyContactImpl.fromJson(Map<String, dynamic> json) =>
      _$$PetEmergencyContactImplFromJson(json);

  @override
  final String name;
  @override
  final String phone;
  @override
  final String? relationship;

  @override
  String toString() {
    return 'PetEmergencyContact(name: $name, phone: $phone, relationship: $relationship)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetEmergencyContactImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.relationship, relationship) ||
                other.relationship == relationship));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone, relationship);

  /// Create a copy of PetEmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetEmergencyContactImplCopyWith<_$PetEmergencyContactImpl> get copyWith =>
      __$$PetEmergencyContactImplCopyWithImpl<_$PetEmergencyContactImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PetEmergencyContactImplToJson(
      this,
    );
  }
}

abstract class _PetEmergencyContact implements PetEmergencyContact {
  const factory _PetEmergencyContact(
      {required final String name,
      required final String phone,
      final String? relationship}) = _$PetEmergencyContactImpl;

  factory _PetEmergencyContact.fromJson(Map<String, dynamic> json) =
      _$PetEmergencyContactImpl.fromJson;

  @override
  String get name;
  @override
  String get phone;
  @override
  String? get relationship;

  /// Create a copy of PetEmergencyContact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetEmergencyContactImplCopyWith<_$PetEmergencyContactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
