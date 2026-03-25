import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'body_parts_provider.g.dart';

class BodyPartsRepository {
  List<FeatureModel> getBodyParts() {
    return [
      const FeatureModel(name: 'Eyes', imagePath: 'assets/images/body_parts/eyes.png', audioPath: 'audio/body_parts/eyes.mp3', colorValue: 0xFFD1C4E9),
      const FeatureModel(name: 'Nose', imagePath: 'assets/images/body_parts/nose.png', audioPath: 'audio/body_parts/nose.mp3', colorValue: 0xFFC8E6C9),
      const FeatureModel(name: 'Hands', imagePath: 'assets/images/body_parts/hands.png', audioPath: 'audio/body_parts/hands.mp3', colorValue: 0xFFFFE0B2),
    ];
  }
}

@riverpod
BodyPartsRepository bodyPartsRepository(Ref ref) {
  return BodyPartsRepository();
}

@riverpod
List<FeatureModel> bodyPartsList(Ref ref) {
  return ref.watch(bodyPartsRepositoryProvider).getBodyParts();
}
