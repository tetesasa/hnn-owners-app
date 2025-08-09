import '../entities/pet.dart';

abstract class PetRepository {
  // ペットの取得
  Future<List<Pet>> getPets({
    String? customerId,
    bool? isActive,
  });

  Future<Pet?> getPetById(String petId);

  Future<List<Pet>> getCustomerPets(
    String customerId, {
    bool activeOnly = true,
  });

  // ペットの作成・更新・削除
  Future<Pet> createPet(Pet pet);

  Future<Pet> updatePet(Pet pet);

  Future<void> deletePet(String petId);

  Future<void> deactivatePet(String petId);

  // ペット写真管理
  Future<String> uploadPetPhoto(
    String petId,
    String imagePath, {
    bool isProfileImage = false,
  });

  Future<void> deletePetPhoto(
    String petId,
    String photoUrl,
  );

  Future<void> updateProfileImage(
    String petId,
    String imageUrl,
  );

  // ヘルスケア管理
  Future<void> updateHealthInfo(
    String petId,
    PetHealthInfo healthInfo,
  );

  Future<void> addVaccination(
    String petId,
    VaccinationRecord vaccination,
  );

  Future<void> updateVaccination(
    String petId,
    VaccinationRecord vaccination,
  );

  Future<void> deleteVaccination(
    String petId,
    String vaccinationId,
  );

  // 行動・性格情報
  Future<void> updateBehaviorInfo(
    String petId,
    PetBehaviorInfo behaviorInfo,
  );

  // ケア指示管理
  Future<void> addCareInstruction(
    String petId,
    PetCareInstruction instruction,
  );

  Future<void> updateCareInstruction(
    String petId,
    PetCareInstruction instruction,
  );

  Future<void> deleteCareInstruction(
    String petId,
    String instructionId,
  );

  Future<List<PetCareInstruction>> getCareInstructions(
    String petId, {
    String? category,
    int? priority,
  });

  // 緊急連絡先管理
  Future<void> addEmergencyContact(
    String petId,
    PetEmergencyContact contact,
  );

  Future<void> updateEmergencyContact(
    String petId,
    PetEmergencyContact contact,
  );

  Future<void> deleteEmergencyContact(
    String petId,
    String contactId,
  );

  // 検索機能
  Future<List<Pet>> searchPets({
    String? customerId,
    String? name,
    PetType? type,
    String? breed,
    bool? isActive,
  });

  // ストリーム監視
  Stream<List<Pet>> watchCustomerPets(String customerId);

  Stream<Pet?> watchPet(String petId);

  // 統計・分析
  Future<Map<String, dynamic>> getPetStatistics(String customerId);

  Future<List<Pet>> getPetsByType(PetType type);

  // バックアップ・エクスポート
  Future<Map<String, dynamic>> exportPetData(String petId);

  Future<List<Map<String, dynamic>>> exportAllPetsData(String customerId);
}
