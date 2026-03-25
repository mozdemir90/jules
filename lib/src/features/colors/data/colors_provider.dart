import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';
import '../../../common_widgets/asset_helper.dart';

part 'colors_provider.g.dart';

class ColorsRepository {
  List<FeatureModel> getColors() {
    return [
      FeatureModel(name: 'Red', imagePath: AssetHelper.getImagePath('colors', 'red'), audioPath: AssetHelper.getAudioPath('colors', 'red').replaceAll('assets/', ''), colorValue: 0xFFFF5252),
      FeatureModel(name: 'Blue', imagePath: AssetHelper.getImagePath('colors', 'blue'), audioPath: AssetHelper.getAudioPath('colors', 'blue').replaceAll('assets/', ''), colorValue: 0xFF448AFF),
      FeatureModel(name: 'Yellow', imagePath: AssetHelper.getImagePath('colors', 'yellow'), audioPath: AssetHelper.getAudioPath('colors', 'yellow').replaceAll('assets/', ''), colorValue: 0xFFFFD740),
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
