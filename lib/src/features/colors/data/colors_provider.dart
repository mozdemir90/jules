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
