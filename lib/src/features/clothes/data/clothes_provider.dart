import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';
import '../../../common_widgets/asset_helper.dart';

part 'clothes_provider.g.dart';

class ClothesRepository {
  List<FeatureModel> getClothes() {
    return [
      FeatureModel(name: 'T-Shirt', imagePath: AssetHelper.getImagePath('clothes', 'tshirt'), audioPath: AssetHelper.getAudioPath('clothes', 'tshirt').replaceAll('assets/', ''), colorValue: 0xFFFFCC80),
      FeatureModel(name: 'Shoes', imagePath: AssetHelper.getImagePath('clothes', 'shoes'), audioPath: AssetHelper.getAudioPath('clothes', 'shoes').replaceAll('assets/', ''), colorValue: 0xFFBCAAA4),
      FeatureModel(name: 'Hat', imagePath: AssetHelper.getImagePath('clothes', 'hat'), audioPath: AssetHelper.getAudioPath('clothes', 'hat').replaceAll('assets/', ''), colorValue: 0xFFCE93D8),
    ];
  }
}

@riverpod
ClothesRepository clothesRepository(Ref ref) {
  return ClothesRepository();
}

@riverpod
List<FeatureModel> clothesList(Ref ref) {
  return ref.watch(clothesRepositoryProvider).getClothes();
}
