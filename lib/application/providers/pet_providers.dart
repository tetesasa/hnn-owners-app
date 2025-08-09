import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repositories/pet_repository.dart';
import '../../data/repositories/firestore_pet_repository.dart';
import 'auth_providers.dart';

part 'pet_providers.g.dart';

// リポジトリプロバイダー
@riverpod
PetRepository petRepository(Ref ref) {
  return FirestorePetRepository(
    firestore: ref.watch(firebaseFirestoreProvider),
    storage: ref.watch(firebaseStorageProvider),
  );
}
