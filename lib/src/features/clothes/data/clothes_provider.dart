import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'clothes_provider.g.dart';

class ClothesRepository {
  List<FeatureModel> getClothes() {
    return [
      const FeatureModel(name: 'T-shirt', imagePath: 'assets/images/clothes/tshirt.png', audioPath: 'audio/clothes/tshirt.mp3', colorValue: 0xFFB2DFDB),
      const FeatureModel(name: 'Hat', imagePath: 'assets/images/clothes/hat.png', audioPath: 'audio/clothes/hat.mp3', colorValue: 0xFFFFE0B2),
      const FeatureModel(name: 'Shoes', imagePath: 'assets/images/clothes/shoes.png', audioPath: 'audio/clothes/shoes.mp3', colorValue: 0xFFD7CCC8),
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
