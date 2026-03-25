import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'shapes_provider.g.dart';

class ShapesRepository {
  List<FeatureModel> getShapes() {
    return [
      const FeatureModel(name: 'Circle', imagePath: 'assets/images/shapes/circle.png', audioPath: 'audio/shapes/circle.mp3', colorValue: 0xFFFFCDD2),
      const FeatureModel(name: 'Square', imagePath: 'assets/images/shapes/square.png', audioPath: 'audio/shapes/square.mp3', colorValue: 0xFFB3E5FC),
      const FeatureModel(name: 'Triangle', imagePath: 'assets/images/shapes/triangle.png', audioPath: 'audio/shapes/triangle.mp3', colorValue: 0xFFDCEDC8),
      const FeatureModel(name: 'Star', imagePath: 'assets/images/shapes/star.png', audioPath: 'audio/shapes/star.mp3', colorValue: 0xFFFFF9C4),
      const FeatureModel(name: 'Rectangle', imagePath: 'assets/images/shapes/rectangle.png', audioPath: 'audio/shapes/rectangle.mp3', colorValue: 0xFFFFE0B2),
      const FeatureModel(name: 'Pentagon', imagePath: 'assets/images/shapes/pentagon.png', audioPath: 'audio/shapes/pentagon.mp3', colorValue: 0xFFE1BEE7),
      const FeatureModel(name: 'Cube', imagePath: 'assets/images/shapes/cube.png', audioPath: 'audio/shapes/cube.mp3', colorValue: 0xFFCFD8DC),
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
