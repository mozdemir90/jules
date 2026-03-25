import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';
import '../../../common_widgets/asset_helper.dart';

part 'shapes_provider.g.dart';

class ShapesRepository {
  List<FeatureModel> getShapes() {
    return [
      FeatureModel(name: 'Circle', imagePath: AssetHelper.getImagePath('shapes', 'circle'), audioPath: AssetHelper.getAudioPath('shapes', 'circle').replaceAll('assets/', ''), colorValue: 0xFFFFCDD2),
      FeatureModel(name: 'Square', imagePath: AssetHelper.getImagePath('shapes', 'square'), audioPath: AssetHelper.getAudioPath('shapes', 'square').replaceAll('assets/', ''), colorValue: 0xFFB3E5FC),
      FeatureModel(name: 'Triangle', imagePath: AssetHelper.getImagePath('shapes', 'triangle'), audioPath: AssetHelper.getAudioPath('shapes', 'triangle').replaceAll('assets/', ''), colorValue: 0xFFDCEDC8),
    ];
  }
}

@riverpod
ShapesRepository shapesRepository(Ref ref) {
  return ShapesRepository();
}

@riverpod
List<FeatureModel> shapesList(Ref ref) {
  return ref.watch(shapesRepositoryProvider).getShapes();
}
