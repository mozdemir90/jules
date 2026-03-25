import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';
import '../../../common_widgets/asset_helper.dart';

part 'fruits_vegetables_provider.g.dart';

class FruitsVegetablesRepository {
  List<FeatureModel> getFruitsVegetables() {
    return [
      FeatureModel(name: 'Apple', imagePath: AssetHelper.getImagePath('fruits_vegetables', 'apple'), audioPath: AssetHelper.getAudioPath('fruits_vegetables', 'apple').replaceAll('assets/', ''), colorValue: 0xFFFFCDD2),
      FeatureModel(name: 'Banana', imagePath: AssetHelper.getImagePath('fruits_vegetables', 'banana'), audioPath: AssetHelper.getAudioPath('fruits_vegetables', 'banana').replaceAll('assets/', ''), colorValue: 0xFFFFF9C4),
      FeatureModel(name: 'Carrot', imagePath: AssetHelper.getImagePath('fruits_vegetables', 'carrot'), audioPath: AssetHelper.getAudioPath('fruits_vegetables', 'carrot').replaceAll('assets/', ''), colorValue: 0xFFFFE0B2),
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
