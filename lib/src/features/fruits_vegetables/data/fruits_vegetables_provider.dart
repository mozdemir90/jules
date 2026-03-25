import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'fruits_vegetables_provider.g.dart';

class FruitsVegetablesRepository {
  List<FeatureModel> getFruitsVegetables() {
    return [
      const FeatureModel(name: 'Apple', imagePath: 'assets/images/fruits_vegetables/apple.png', audioPath: 'audio/fruits_vegetables/apple.mp3', colorValue: 0xFFFFCDD2),
      const FeatureModel(name: 'Avocado', imagePath: 'assets/images/fruits_vegetables/avocado.png', audioPath: 'audio/fruits_vegetables/avocado.mp3', colorValue: 0xFFDCEDC8),
      const FeatureModel(name: 'Banana', imagePath: 'assets/images/fruits_vegetables/banana.png', audioPath: 'audio/fruits_vegetables/banana.mp3', colorValue: 0xFFFFF9C4),
      const FeatureModel(name: 'Carrot', imagePath: 'assets/images/fruits_vegetables/carrot.png', audioPath: 'audio/fruits_vegetables/carrot.mp3', colorValue: 0xFFFFE0B2),
      const FeatureModel(name: 'Cucumber', imagePath: 'assets/images/fruits_vegetables/cucumber.png', audioPath: 'audio/fruits_vegetables/cucumber.mp3', colorValue: 0xFFE8F5E9),
      const FeatureModel(name: 'Grapes', imagePath: 'assets/images/fruits_vegetables/grapes.png', audioPath: 'audio/fruits_vegetables/grapes.mp3', colorValue: 0xFFE1BEE7),
      const FeatureModel(name: 'Onion', imagePath: 'assets/images/fruits_vegetables/onion.png', audioPath: 'audio/fruits_vegetables/onion.mp3', colorValue: 0xFFF5F5F5),
      const FeatureModel(name: 'Orange', imagePath: 'assets/images/fruits_vegetables/orange.png', audioPath: 'audio/fruits_vegetables/orange.mp3', colorValue: 0xFFFFE0B2),
      const FeatureModel(name: 'Pepper', imagePath: 'assets/images/fruits_vegetables/pepper.png', audioPath: 'audio/fruits_vegetables/pepper.mp3', colorValue: 0xFFFFEBEE),
      const FeatureModel(name: 'Pineapple', imagePath: 'assets/images/fruits_vegetables/pineapple.png', audioPath: 'audio/fruits_vegetables/pineapple.mp3', colorValue: 0xFFFFF9C4),
      const FeatureModel(name: 'Potato', imagePath: 'assets/images/fruits_vegetables/potato.png', audioPath: 'audio/fruits_vegetables/potato.mp3', colorValue: 0xFFD7CCC8),
      const FeatureModel(name: 'Strawberry', imagePath: 'assets/images/fruits_vegetables/strawberry.png', audioPath: 'audio/fruits_vegetables/strawberry.mp3', colorValue: 0xFFFFCDD2),
      const FeatureModel(name: 'Tomato', imagePath: 'assets/images/fruits_vegetables/tomato.png', audioPath: 'audio/fruits_vegetables/tomato.mp3', colorValue: 0xFFFFEBEE),
      const FeatureModel(name: 'Watermelon', imagePath: 'assets/images/fruits_vegetables/watermelon.png', audioPath: 'audio/fruits_vegetables/watermelon.mp3', colorValue: 0xFFC8E6C9),
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
