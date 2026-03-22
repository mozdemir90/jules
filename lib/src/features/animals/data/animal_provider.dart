import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'animal_repository.dart';
import '../domain/animal_model.dart';

part 'animal_provider.g.dart';

@riverpod
AnimalRepository animalRepository(Ref ref) {
  return AnimalRepository();
}

@riverpod
List<AnimalModel> animalList(Ref ref) {
  return ref.watch(animalRepositoryProvider).getAnimals();
}
