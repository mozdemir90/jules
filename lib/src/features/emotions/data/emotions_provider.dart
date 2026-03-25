import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';
import '../../../common_widgets/asset_helper.dart';

part 'emotions_provider.g.dart';

class EmotionsRepository {
  List<FeatureModel> getEmotions() {
    return [
      FeatureModel(name: 'Happy', imagePath: AssetHelper.getImagePath('emotions', 'happy'), audioPath: AssetHelper.getAudioPath('emotions', 'happy').replaceAll('assets/', ''), colorValue: 0xFFFFF59D),
      FeatureModel(name: 'Sad', imagePath: AssetHelper.getImagePath('emotions', 'sad'), audioPath: AssetHelper.getAudioPath('emotions', 'sad').replaceAll('assets/', ''), colorValue: 0xFF90CAF9),
      FeatureModel(name: 'Surprised', imagePath: AssetHelper.getImagePath('emotions', 'surprised'), audioPath: AssetHelper.getAudioPath('emotions', 'surprised').replaceAll('assets/', ''), colorValue: 0xFFFFAB91),
    ];
  }
}

@riverpod
EmotionsRepository emotionsRepository(Ref ref) {
  return EmotionsRepository();
}

@riverpod
List<FeatureModel> emotionsList(Ref ref) {
  return ref.watch(emotionsRepositoryProvider).getEmotions();
}
