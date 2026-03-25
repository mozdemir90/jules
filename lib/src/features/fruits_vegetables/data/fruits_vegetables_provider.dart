import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'fruits_vegetables_provider.g.dart';

class FruitsVegetablesRepository {
  List<FeatureModel> getFruitsVegetables() {
    return [
      const FeatureModel(name: 'Apple', imagePath: 'assets/images/fruits_vegetables/apple.png', audioPath: 'audio/fruits_vegetables/apple.mp3', colorValue: 0xFFFFCDD2),
      const FeatureModel(name: 'Banana', imagePath: 'assets/images/fruits_vegetables/banana.png', audioPath: 'audio/fruits_vegetables/banana.mp3', colorValue: 0xFFFFF9C4),
      const FeatureModel(name: 'Carrot', imagePath: 'assets/images/fruits_vegetables/carrot.png', audioPath: 'audio/fruits_vegetables/carrot.mp3', colorValue: 0xFFFFE0B2),
    ];
  }
}

@riverpod
FruitsVegetablesRepository fruitsVegetablesRepository(Ref ref) {
  return FruitsVegetablesRepository();
}

@riverpod
List<FeatureModel> fruitsVegetablesList(Ref ref) {
  return ref.watch(fruitsVegetablesRepositoryProvider).getFruitsVegetables();
}
