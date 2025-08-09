import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../domain/entities/pet.dart';
import '../../domain/repositories/pet_repository.dart';

class FirestorePetRepository implements PetRepository {
  FirestorePetRepository({
    required FirebaseFirestore firestore,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _storage = storage;

  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  static const String _petsCollection = 'PETS';

  @override
  Future<List<Pet>> getPets({
    String? customerId,
    bool? isActive,
  }) async {
    try {
      Query query = _firestore.collection(_petsCollection);

      if (customerId != null) {
        query = query.where('customerId', isEqualTo: customerId);
      }

      if (isActive != null) {
        query = query.where('isActive', isEqualTo: isActive);
      }

      query = query.orderBy('name');

      final snapshot = await query.get();

      return snapshot.docs
          .map((doc) => Pet.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('ペット一覧の取得に失敗しました: $e');
    }
  }

  @override
  Future<Pet?> getPetById(String petId) async {
    try {
      final doc = await _firestore.collection(_petsCollection).doc(petId).get();

      if (!doc.exists || doc.data() == null) return null;

      return Pet.fromFirestore(doc.data()!);
    } catch (e) {
      throw Exception('ペット情報の取得に失敗しました: $e');
    }
  }

  @override
  Future<List<Pet>> getCustomerPets(
    String customerId, {
    bool activeOnly = true,
  }) async {
    return getPets(
      customerId: customerId,
      isActive: activeOnly ? true : null,
    );
  }

  @override
  Future<Pet> createPet(Pet pet) async {
    try {
      final docRef = _firestore.collection(_petsCollection).doc();

      final newPet = pet.copyWith(
        id: docRef.id,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      await docRef.set(newPet.toFirestore());

      return newPet;
    } catch (e) {
      throw Exception('ペットの登録に失敗しました: $e');
    }
  }

  @override
  Future<Pet> updatePet(Pet pet) async {
    try {
      final updatedPet = pet.copyWith(
        updatedAt: DateTime.now(),
      );

      await _firestore
          .collection(_petsCollection)
          .doc(pet.id)
          .update(updatedPet.toFirestore());

      return updatedPet;
    } catch (e) {
      throw Exception('ペット情報の更新に失敗しました: $e');
    }
  }

  @override
  Future<void> deletePet(String petId) async {
    try {
      // 実際には削除せず、非アクティブにする
      await deactivatePet(petId);
    } catch (e) {
      throw Exception('ペットの削除に失敗しました: $e');
    }
  }

  @override
  Future<void> deactivatePet(String petId) async {
    try {
      await _firestore.collection(_petsCollection).doc(petId).update({
        'isActive': false,
        'IS_ACTIVE': false,
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('ペットの非アクティブ化に失敗しました: $e');
    }
  }

  @override
  Future<String> uploadPetPhoto(
    String petId,
    String imagePath, {
    bool isProfileImage = false,
  }) async {
    try {
      final file = File(imagePath);
      final fileName =
          '${DateTime.now().millisecondsSinceEpoch}_${file.path.split('/').last}';
      final storageRef = _storage
          .ref()
          .child('pets')
          .child(petId)
          .child(isProfileImage ? 'profile' : 'photos')
          .child(fileName);

      final uploadTask = storageRef.putFile(file);
      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      // ペットドキュメントを更新
      final updateData = <String, dynamic>{
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      };

      if (isProfileImage) {
        updateData['profileImageUrl'] = downloadUrl;
        updateData['PROFILE_IMAGE_URL'] = downloadUrl;
      } else {
        updateData['photoUrls'] = FieldValue.arrayUnion([downloadUrl]);
        updateData['PHOTO_URLS'] = FieldValue.arrayUnion([downloadUrl]);
      }

      await _firestore
          .collection(_petsCollection)
          .doc(petId)
          .update(updateData);

      return downloadUrl;
    } catch (e) {
      throw Exception('ペット写真のアップロードに失敗しました: $e');
    }
  }

  @override
  Future<void> deletePetPhoto(
    String petId,
    String photoUrl,
  ) async {
    try {
      // Storageから画像を削除
      final ref = _storage.refFromURL(photoUrl);
      await ref.delete();

      // ペットドキュメントから画像URLを削除
      await _firestore.collection(_petsCollection).doc(petId).update({
        'photoUrls': FieldValue.arrayRemove([photoUrl]),
        'PHOTO_URLS': FieldValue.arrayRemove([photoUrl]),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('ペット写真の削除に失敗しました: $e');
    }
  }

  @override
  Future<void> updateProfileImage(
    String petId,
    String imageUrl,
  ) async {
    try {
      await _firestore.collection(_petsCollection).doc(petId).update({
        'profileImageUrl': imageUrl,
        'PROFILE_IMAGE_URL': imageUrl,
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('プロフィール画像の更新に失敗しました: $e');
    }
  }

  @override
  Future<void> updateHealthInfo(
    String petId,
    PetHealthInfo healthInfo,
  ) async {
    try {
      await _firestore.collection(_petsCollection).doc(petId).update({
        'healthInfo': healthInfo.toJson(),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('ヘルスケア情報の更新に失敗しました: $e');
    }
  }

  @override
  Future<void> addVaccination(
    String petId,
    VaccinationRecord vaccination,
  ) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) throw Exception('ペットが見つかりません');

      final updatedVaccinations = [
        ...(pet.healthInfo?.vaccinations ?? []),
        vaccination,
      ];

      final updatedHealthInfo =
          (pet.healthInfo ?? const PetHealthInfo()).copyWith(
        vaccinations: updatedVaccinations,
      );

      await updateHealthInfo(petId, updatedHealthInfo);
    } catch (e) {
      throw Exception('ワクチン記録の追加に失敗しました: $e');
    }
  }

  @override
  Future<void> updateVaccination(
    String petId,
    VaccinationRecord vaccination,
  ) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) throw Exception('ペットが見つかりません');

      final updatedVaccinations = pet.healthInfo?.vaccinations
              .map((v) => v.vaccine == vaccination.vaccine ? vaccination : v)
              .toList() ??
          [vaccination];

      final updatedHealthInfo =
          (pet.healthInfo ?? const PetHealthInfo()).copyWith(
        vaccinations: updatedVaccinations,
      );

      await updateHealthInfo(petId, updatedHealthInfo);
    } catch (e) {
      throw Exception('ワクチン記録の更新に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteVaccination(
    String petId,
    String vaccinationId,
  ) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) throw Exception('ペットが見つかりません');

      final updatedVaccinations = pet.healthInfo?.vaccinations
              .where((v) => v.vaccine != vaccinationId)
              .toList() ??
          [];

      final updatedHealthInfo =
          (pet.healthInfo ?? const PetHealthInfo()).copyWith(
        vaccinations: updatedVaccinations,
      );

      await updateHealthInfo(petId, updatedHealthInfo);
    } catch (e) {
      throw Exception('ワクチン記録の削除に失敗しました: $e');
    }
  }

  @override
  Future<void> updateBehaviorInfo(
    String petId,
    PetBehaviorInfo behaviorInfo,
  ) async {
    try {
      await _firestore.collection(_petsCollection).doc(petId).update({
        'behaviorInfo': behaviorInfo.toJson(),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('行動情報の更新に失敗しました: $e');
    }
  }

  @override
  Future<void> addCareInstruction(
    String petId,
    PetCareInstruction instruction,
  ) async {
    try {
      await _firestore.collection(_petsCollection).doc(petId).update({
        'careInstructions': FieldValue.arrayUnion([instruction.toJson()]),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('ケア指示の追加に失敗しました: $e');
    }
  }

  @override
  Future<void> updateCareInstruction(
    String petId,
    PetCareInstruction instruction,
  ) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) throw Exception('ペットが見つかりません');

      final updatedInstructions = pet.careInstructions
          .map((i) => i.id == instruction.id ? instruction : i)
          .toList();

      await _firestore.collection(_petsCollection).doc(petId).update({
        'careInstructions': updatedInstructions.map((e) => e.toJson()).toList(),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('ケア指示の更新に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteCareInstruction(
    String petId,
    String instructionId,
  ) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) throw Exception('ペットが見つかりません');

      final updatedInstructions =
          pet.careInstructions.where((i) => i.id != instructionId).toList();

      await _firestore.collection(_petsCollection).doc(petId).update({
        'careInstructions': updatedInstructions.map((e) => e.toJson()).toList(),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('ケア指示の削除に失敗しました: $e');
    }
  }

  @override
  Future<List<PetCareInstruction>> getCareInstructions(
    String petId, {
    String? category,
    int? priority,
  }) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) return [];

      var instructions = pet.careInstructions;

      if (category != null) {
        instructions =
            instructions.where((i) => i.category == category).toList();
      }

      if (priority != null) {
        instructions =
            instructions.where((i) => i.priority == priority).toList();
      }

      return instructions;
    } catch (e) {
      throw Exception('ケア指示の取得に失敗しました: $e');
    }
  }

  @override
  Future<void> addEmergencyContact(
    String petId,
    PetEmergencyContact contact,
  ) async {
    try {
      await _firestore.collection(_petsCollection).doc(petId).update({
        'emergencyContacts': FieldValue.arrayUnion([contact.toJson()]),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('緊急連絡先の追加に失敗しました: $e');
    }
  }

  @override
  Future<void> updateEmergencyContact(
    String petId,
    PetEmergencyContact contact,
  ) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) throw Exception('ペットが見つかりません');

      final updatedContacts = pet.emergencyContacts
          .map((c) => c.name == contact.name ? contact : c)
          .toList();

      await _firestore.collection(_petsCollection).doc(petId).update({
        'emergencyContacts': updatedContacts.map((e) => e.toJson()).toList(),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('緊急連絡先の更新に失敗しました: $e');
    }
  }

  @override
  Future<void> deleteEmergencyContact(
    String petId,
    String contactId,
  ) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) throw Exception('ペットが見つかりません');

      final updatedContacts =
          pet.emergencyContacts.where((c) => c.name != contactId).toList();

      await _firestore.collection(_petsCollection).doc(petId).update({
        'emergencyContacts': updatedContacts.map((e) => e.toJson()).toList(),
        'updatedAt': DateTime.now().toIso8601String(),
        'UPDATED_AT': DateTime.now().toIso8601String(),
      });
    } catch (e) {
      throw Exception('緊急連絡先の削除に失敗しました: $e');
    }
  }

  @override
  Future<List<Pet>> searchPets({
    String? customerId,
    String? name,
    PetType? type,
    String? breed,
    bool? isActive,
  }) async {
    try {
      Query query = _firestore.collection(_petsCollection);

      if (customerId != null) {
        query = query.where('customerId', isEqualTo: customerId);
      }

      if (type != null) {
        query = query.where('type', isEqualTo: type.value);
      }

      if (isActive != null) {
        query = query.where('isActive', isEqualTo: isActive);
      }

      final snapshot = await query.get();
      var pets = snapshot.docs
          .map((doc) => Pet.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();

      // クライアントサイドフィルタリング
      if (name != null && name.isNotEmpty) {
        pets = pets
            .where((pet) => pet.name.toLowerCase().contains(name.toLowerCase()))
            .toList();
      }

      if (breed != null && breed.isNotEmpty) {
        pets = pets
            .where((pet) =>
                pet.breed?.toLowerCase().contains(breed.toLowerCase()) == true)
            .toList();
      }

      return pets;
    } catch (e) {
      throw Exception('ペット検索に失敗しました: $e');
    }
  }

  @override
  Stream<List<Pet>> watchCustomerPets(String customerId) {
    return _firestore
        .collection(_petsCollection)
        .where('customerId', isEqualTo: customerId)
        .where('isActive', isEqualTo: true)
        .orderBy('name')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Pet.fromFirestore(doc.data())).toList());
  }

  @override
  Stream<Pet?> watchPet(String petId) {
    return _firestore
        .collection(_petsCollection)
        .doc(petId)
        .snapshots()
        .map((doc) {
      if (!doc.exists || doc.data() == null) return null;
      return Pet.fromFirestore(doc.data()!);
    });
  }

  @override
  Future<Map<String, dynamic>> getPetStatistics(String customerId) async {
    try {
      final pets = await getCustomerPets(customerId, activeOnly: false);

      final stats = <String, dynamic>{
        'totalPets': pets.length,
        'activePets': pets.where((p) => p.isActive).length,
        'inactivePets': pets.where((p) => !p.isActive).length,
        'petTypes': <String, int>{},
        'averageAge': 0.0,
      };

      // ペット種類の統計
      for (final pet in pets.where((p) => p.isActive)) {
        final type = pet.type.value;
        stats['petTypes'][type] = (stats['petTypes'][type] ?? 0) + 1;
      }

      // 平均年齢の計算
      final petsWithBirthDate = pets.where((p) => p.birthDate != null).toList();
      if (petsWithBirthDate.isNotEmpty) {
        final totalAge = petsWithBirthDate.fold<double>(0.0, (total, pet) {
          final age = DateTime.now().difference(pet.birthDate!).inDays / 365.25;
          return total + age;
        });
        stats['averageAge'] = totalAge / petsWithBirthDate.length;
      }

      return stats;
    } catch (e) {
      throw Exception('ペット統計の取得に失敗しました: $e');
    }
  }

  @override
  Future<List<Pet>> getPetsByType(PetType type) async {
    return getPets();
  }

  @override
  Future<Map<String, dynamic>> exportPetData(String petId) async {
    try {
      final pet = await getPetById(petId);
      if (pet == null) throw Exception('ペットが見つかりません');

      return pet.toJson();
    } catch (e) {
      throw Exception('ペットデータのエクスポートに失敗しました: $e');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> exportAllPetsData(
      String customerId) async {
    try {
      final pets = await getCustomerPets(customerId, activeOnly: false);
      return pets.map((pet) => pet.toJson()).toList();
    } catch (e) {
      throw Exception('全ペットデータのエクスポートに失敗しました: $e');
    }
  }
}
