import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'colors_provider.g.dart';

class ColorsRepository {
  List<FeatureModel> getColors() {
    return [
      const FeatureModel(name: 'Red', imagePath: 'assets/images/colors/red.png', audioPath: 'audio/colors/red.mp3', colorValue: 0xFFFF5252),
      const FeatureModel(name: 'Blue', imagePath: 'assets/images/colors/blue.png', audioPath: 'audio/colors/blue.mp3', colorValue: 0xFF448AFF),
      const FeatureModel(name: 'Yellow', imagePath: 'assets/images/colors/yellow.png', audioPath: 'audio/colors/yellow.mp3', colorValue: 0xFFFFD740),
      const FeatureModel(name: 'Green', imagePath: 'assets/images/colors/green.png', audioPath: 'audio/colors/green.mp3', colorValue: 0xFF4CAF50),
      const FeatureModel(name: 'Orange', imagePath: 'assets/images/colors/orange.png', audioPath: 'audio/colors/orange.mp3', colorValue: 0xFFFF9800),
      const FeatureModel(name: 'Purple', imagePath: 'assets/images/colors/purple.png', audioPath: 'audio/colors/purple.mp3', colorValue: 0xFF9C27B0),
      const FeatureModel(name: 'Pink', imagePath: 'assets/images/colors/pink.png', audioPath: 'audio/colors/pink.mp3', colorValue: 0xFFE91E63),
      const FeatureModel(name: 'Brown', imagePath: 'assets/images/colors/brown.png', audioPath: 'audio/colors/brown.mp3', colorValue: 0xFF795548),
      const FeatureModel(name: 'Gray', imagePath: 'assets/images/colors/gray.png', audioPath: 'audio/colors/gray.mp3', colorValue: 0xFF9E9E9E),
      const FeatureModel(name: 'Black', imagePath: 'assets/images/colors/black.png', audioPath: 'audio/colors/black.mp3', colorValue: 0xFF212121),
    ];
  }
}

@riverpod
ColorsRepository colorsRepository(Ref ref) {
  return ColorsRepository();
}

@riverpod
List<FeatureModel> colorsList(Ref ref) {
  return ref.watch(colorsRepositoryProvider).getColors();
}
