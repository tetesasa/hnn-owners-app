// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PetImpl _$$PetImplFromJson(Map<String, dynamic> json) => _$PetImpl(
      id: json['id'] as String,
      customerId: json['customerId'] as String,
      name: json['name'] as String,
      type: $enumDecodeNullable(_$PetTypeEnumMap, json['type']) ?? PetType.cat,
      breed: json['breed'] as String?,
      gender: $enumDecodeNullable(_$PetGenderEnumMap, json['gender']) ??
          PetGender.unknown,
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      color: json['color'] as String?,
      weight: (json['weight'] as num?)?.toDouble(),
      microchipId: json['microchipId'] as String?,
      photoUrls: (json['photoUrls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      profileImageUrl: json['profileImageUrl'] as String?,
      healthInfo: json['healthInfo'] == null
          ? null
          : PetHealthInfo.fromJson(json['healthInfo'] as Map<String, dynamic>),
      behaviorInfo: json['behaviorInfo'] == null
          ? null
          : PetBehaviorInfo.fromJson(
              json['behaviorInfo'] as Map<String, dynamic>),
      careInstructions: (json['careInstructions'] as List<dynamic>?)
              ?.map(
                  (e) => PetCareInstruction.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      emergencyContacts: (json['emergencyContacts'] as List<dynamic>?)
              ?.map((e) =>
                  PetEmergencyContact.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isActive: json['isActive'] as bool? ?? true,
      notes: json['notes'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$PetImplToJson(_$PetImpl instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'name': instance.name,
      'type': _$PetTypeEnumMap[instance.type]!,
      'breed': instance.breed,
      'gender': _$PetGenderEnumMap[instance.gender]!,
      'birthDate': instance.birthDate?.toIso8601String(),
      'color': instance.color,
      'weight': instance.weight,
      'microchipId': instance.microchipId,
      'photoUrls': instance.photoUrls,
      'profileImageUrl': instance.profileImageUrl,
      'healthInfo': instance.healthInfo,
      'behaviorInfo': instance.behaviorInfo,
      'careInstructions': instance.careInstructions,
      'emergencyContacts': instance.emergencyContacts,
      'isActive': instance.isActive,
      'notes': instance.notes,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$PetTypeEnumMap = {
  PetType.cat: 'cat',
  PetType.dog: 'dog',
  PetType.rabbit: 'rabbit',
  PetType.bird: 'bird',
  PetType.other: 'other',
};

const _$PetGenderEnumMap = {
  PetGender.male: 'male',
  PetGender.female: 'female',
  PetGender.unknown: 'unknown',
};

_$PetHealthInfoImpl _$$PetHealthInfoImplFromJson(Map<String, dynamic> json) =>
    _$PetHealthInfoImpl(
      allergies: (json['allergies'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      medications: (json['medications'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      medicalConditions: (json['medicalConditions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      veterinarianName: json['veterinarianName'] as String?,
      veterinarianPhone: json['veterinarianPhone'] as String?,
      veterinarianAddress: json['veterinarianAddress'] as String?,
      vaccinations: (json['vaccinations'] as List<dynamic>?)
              ?.map(
                  (e) => VaccinationRecord.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      insuranceProvider: json['insuranceProvider'] as String?,
      insurancePolicy: json['insurancePolicy'] as String?,
      specialNeeds: json['specialNeeds'] as String?,
      lastCheckup: json['lastCheckup'] == null
          ? null
          : DateTime.parse(json['lastCheckup'] as String),
    );

Map<String, dynamic> _$$PetHealthInfoImplToJson(_$PetHealthInfoImpl instance) =>
    <String, dynamic>{
      'allergies': instance.allergies,
      'medications': instance.medications,
      'medicalConditions': instance.medicalConditions,
      'veterinarianName': instance.veterinarianName,
      'veterinarianPhone': instance.veterinarianPhone,
      'veterinarianAddress': instance.veterinarianAddress,
      'vaccinations': instance.vaccinations,
      'insuranceProvider': instance.insuranceProvider,
      'insurancePolicy': instance.insurancePolicy,
      'specialNeeds': instance.specialNeeds,
      'lastCheckup': instance.lastCheckup?.toIso8601String(),
    };

_$PetBehaviorInfoImpl _$$PetBehaviorInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$PetBehaviorInfoImpl(
      temperament: json['temperament'] as String?,
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      dislikes: (json['dislikes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fears:
          (json['fears'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      socialBehavior: json['socialBehavior'] as String?,
      activityLevel: json['activityLevel'] as String?,
      feedingBehavior: json['feedingBehavior'] as String?,
      behaviorNotes: (json['behaviorNotes'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PetBehaviorInfoImplToJson(
        _$PetBehaviorInfoImpl instance) =>
    <String, dynamic>{
      'temperament': instance.temperament,
      'likes': instance.likes,
      'dislikes': instance.dislikes,
      'fears': instance.fears,
      'socialBehavior': instance.socialBehavior,
      'activityLevel': instance.activityLevel,
      'feedingBehavior': instance.feedingBehavior,
      'behaviorNotes': instance.behaviorNotes,
    };

_$PetCareInstructionImpl _$$PetCareInstructionImplFromJson(
        Map<String, dynamic> json) =>
    _$PetCareInstructionImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      instruction: json['instruction'] as String,
      category: json['category'] as String?,
      priority: (json['priority'] as num?)?.toInt(),
      isDaily: json['isDaily'] as bool?,
      timeOfDay: json['timeOfDay'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PetCareInstructionImplToJson(
        _$PetCareInstructionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'instruction': instance.instruction,
      'category': instance.category,
      'priority': instance.priority,
      'isDaily': instance.isDaily,
      'timeOfDay': instance.timeOfDay,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$VaccinationRecordImpl _$$VaccinationRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$VaccinationRecordImpl(
      vaccine: json['vaccine'] as String,
      date: DateTime.parse(json['date'] as String),
      expiryDate: json['expiryDate'] == null
          ? null
          : DateTime.parse(json['expiryDate'] as String),
      veterinarian: json['veterinarian'] as String?,
      batchNumber: json['batchNumber'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$VaccinationRecordImplToJson(
        _$VaccinationRecordImpl instance) =>
    <String, dynamic>{
      'vaccine': instance.vaccine,
      'date': instance.date.toIso8601String(),
      'expiryDate': instance.expiryDate?.toIso8601String(),
      'veterinarian': instance.veterinarian,
      'batchNumber': instance.batchNumber,
      'notes': instance.notes,
    };

_$PetEmergencyContactImpl _$$PetEmergencyContactImplFromJson(
        Map<String, dynamic> json) =>
    _$PetEmergencyContactImpl(
      name: json['name'] as String,
      phone: json['phone'] as String,
      relationship: json['relationship'] as String?,
    );

Map<String, dynamic> _$$PetEmergencyContactImplToJson(
        _$PetEmergencyContactImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'relationship': instance.relationship,
    };
