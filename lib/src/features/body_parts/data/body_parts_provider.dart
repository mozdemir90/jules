import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';
import '../../../common_widgets/asset_helper.dart';

part 'body_parts_provider.g.dart';

class BodyPartsRepository {
  List<FeatureModel> getBodyParts() {
    return [
      FeatureModel(name: 'Eyes', imagePath: AssetHelper.getImagePath('body_parts', 'eyes'), audioPath: AssetHelper.getAudioPath('body_parts', 'eyes').replaceAll('assets/', ''), colorValue: 0xFFD1C4E9),
      FeatureModel(name: 'Nose', imagePath: AssetHelper.getImagePath('body_parts', 'nose'), audioPath: AssetHelper.getAudioPath('body_parts', 'nose').replaceAll('assets/', ''), colorValue: 0xFFC8E6C9),
      FeatureModel(name: 'Hands', imagePath: AssetHelper.getImagePath('body_parts', 'hands'), audioPath: AssetHelper.getAudioPath('body_parts', 'hands').replaceAll('assets/', ''), colorValue: 0xFFFFE0B2),
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
