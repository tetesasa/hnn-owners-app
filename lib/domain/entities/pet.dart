import 'package:freezed_annotation/freezed_annotation.dart';

part 'pet.freezed.dart';
part 'pet.g.dart';

enum PetType {
  cat('cat'),
  dog('dog'),
  rabbit('rabbit'),
  bird('bird'),
  other('other');

  const PetType(this.value);
  final String value;

  static PetType fromString(String value) {
    return PetType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => PetType.cat,
    );
  }

  @override
  String toString() => value;
}

enum PetGender {
  male('male'),
  female('female'),
  unknown('unknown');

  const PetGender(this.value);
  final String value;

  static PetGender fromString(String value) {
    return PetGender.values.firstWhere(
      (gender) => gender.value == value,
      orElse: () => PetGender.unknown,
    );
  }

  @override
  String toString() => value;
}

@freezed
class Pet with _$Pet {
  const Pet._();

  const factory Pet({
    required String id,
    required String customerId,
    required String name,
    @Default(PetType.cat) PetType type,
    String? breed,
    @Default(PetGender.unknown) PetGender gender,
    DateTime? birthDate,
    String? color,
    double? weight,
    String? microchipId,
    @Default([]) List<String> photoUrls,
    String? profileImageUrl,
    PetHealthInfo? healthInfo,
    PetBehaviorInfo? behaviorInfo,
    @Default([]) List<PetCareInstruction> careInstructions,
    @Default([]) List<PetEmergencyContact> emergencyContacts,
    @Default(true) bool isActive,
    String? notes,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Pet;

  factory Pet.fromJson(Map<String, dynamic> json) => _$PetFromJson(json);

  factory Pet.fromFirestore(Map<String, dynamic> data) {
    return Pet(
      id: data['ID'] ?? '',
      customerId: data['customerId'] ?? data['CUSTOMER_ID'] ?? '',
      name: data['name'] ?? data['NAME'] ?? '',
      type: PetType.fromString(data['type'] ?? data['TYPE'] ?? 'cat'),
      breed: data['breed'] ?? data['BREED'],
      gender:
          PetGender.fromString(data['gender'] ?? data['GENDER'] ?? 'unknown'),
      birthDate: _parseDateTime(data['birthDate'] ?? data['BIRTH_DATE']),
      color: data['color'] ?? data['COLOR'],
      weight: (data['weight'] ?? data['WEIGHT'])?.toDouble(),
      microchipId: data['microchipId'] ?? data['MICROCHIP_ID'],
      photoUrls:
          List<String>.from(data['photoUrls'] ?? data['PHOTO_URLS'] ?? []),
      profileImageUrl: data['profileImageUrl'] ?? data['PROFILE_IMAGE_URL'],
      healthInfo: data['healthInfo'] != null
          ? PetHealthInfo.fromJson(
              Map<String, dynamic>.from(data['healthInfo']))
          : null,
      behaviorInfo: data['behaviorInfo'] != null
          ? PetBehaviorInfo.fromJson(
              Map<String, dynamic>.from(data['behaviorInfo']))
          : null,
      careInstructions: (data['careInstructions'] as List<dynamic>?)
              ?.map((e) =>
                  PetCareInstruction.fromJson(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
      emergencyContacts: (data['emergencyContacts'] as List<dynamic>?)
              ?.map((e) =>
                  PetEmergencyContact.fromJson(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
      isActive: data['isActive'] ?? data['IS_ACTIVE'] ?? true,
      notes: data['notes'] ?? data['NOTES'],
      createdAt: _parseDateTime(data['createdAt'] ?? data['CREATED_AT']),
      updatedAt: _parseDateTime(data['updatedAt'] ?? data['UPDATED_AT']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'ID': id,
      'customerId': customerId,
      'CUSTOMER_ID': customerId,
      'name': name,
      'NAME': name,
      'type': type.value,
      'TYPE': type.value,
      'breed': breed,
      'BREED': breed,
      'gender': gender.value,
      'GENDER': gender.value,
      'birthDate': birthDate?.toIso8601String(),
      'BIRTH_DATE': birthDate?.toIso8601String(),
      'color': color,
      'COLOR': color,
      'weight': weight,
      'WEIGHT': weight,
      'microchipId': microchipId,
      'MICROCHIP_ID': microchipId,
      'photoUrls': photoUrls,
      'PHOTO_URLS': photoUrls,
      'profileImageUrl': profileImageUrl,
      'PROFILE_IMAGE_URL': profileImageUrl,
      'healthInfo': healthInfo?.toJson(),
      'behaviorInfo': behaviorInfo?.toJson(),
      'careInstructions': careInstructions.map((e) => e.toJson()).toList(),
      'emergencyContacts': emergencyContacts.map((e) => e.toJson()).toList(),
      'isActive': isActive,
      'IS_ACTIVE': isActive,
      'notes': notes,
      'NOTES': notes,
      'createdAt': createdAt?.toIso8601String(),
      'CREATED_AT': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      'UPDATED_AT': updatedAt?.toIso8601String(),
    };
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null) return null;
    if (value is DateTime) return value;
    if (value is String && value.isNotEmpty) {
      try {
        return DateTime.parse(value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }
}

@freezed
class PetHealthInfo with _$PetHealthInfo {
  const factory PetHealthInfo({
    @Default([]) List<String> allergies,
    @Default([]) List<String> medications,
    @Default([]) List<String> medicalConditions,
    String? veterinarianName,
    String? veterinarianPhone,
    String? veterinarianAddress,
    @Default([]) List<VaccinationRecord> vaccinations,
    String? insuranceProvider,
    String? insurancePolicy,
    String? specialNeeds,
    DateTime? lastCheckup,
  }) = _PetHealthInfo;

  factory PetHealthInfo.fromJson(Map<String, dynamic> json) =>
      _$PetHealthInfoFromJson(json);
}

@freezed
class PetBehaviorInfo with _$PetBehaviorInfo {
  const factory PetBehaviorInfo({
    String? temperament,
    @Default([]) List<String> likes,
    @Default([]) List<String> dislikes,
    @Default([]) List<String> fears,
    String? socialBehavior,
    String? activityLevel,
    String? feedingBehavior,
    @Default([]) List<String> behaviorNotes,
  }) = _PetBehaviorInfo;

  factory PetBehaviorInfo.fromJson(Map<String, dynamic> json) =>
      _$PetBehaviorInfoFromJson(json);
}

@freezed
class PetCareInstruction with _$PetCareInstruction {
  const factory PetCareInstruction({
    required String id,
    required String title,
    required String instruction,
    String?
        category, // 'feeding', 'medication', 'exercise', 'grooming', 'other'
    int? priority, // 1 (high) to 3 (low)
    bool? isDaily,
    String? timeOfDay,
    DateTime? createdAt,
  }) = _PetCareInstruction;

  factory PetCareInstruction.fromJson(Map<String, dynamic> json) =>
      _$PetCareInstructionFromJson(json);
}

@freezed
class VaccinationRecord with _$VaccinationRecord {
  const factory VaccinationRecord({
    required String vaccine,
    required DateTime date,
    DateTime? expiryDate,
    String? veterinarian,
    String? batchNumber,
    String? notes,
  }) = _VaccinationRecord;

  factory VaccinationRecord.fromJson(Map<String, dynamic> json) =>
      _$VaccinationRecordFromJson(json);
}

@freezed
class PetEmergencyContact with _$PetEmergencyContact {
  const factory PetEmergencyContact({
    required String name,
    required String phone,
    String? relationship,
  }) = _PetEmergencyContact;

  factory PetEmergencyContact.fromJson(Map<String, dynamic> json) =>
      _$PetEmergencyContactFromJson(json);
}
