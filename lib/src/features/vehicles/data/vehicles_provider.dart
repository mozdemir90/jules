import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';
import '../../../common_widgets/asset_helper.dart';

part 'vehicles_provider.g.dart';

class VehiclesRepository {
  List<FeatureModel> getVehicles() {
    return [
      FeatureModel(name: 'Car', imagePath: AssetHelper.getImagePath('vehicles', 'car'), audioPath: AssetHelper.getAudioPath('vehicles', 'car').replaceAll('assets/', ''), colorValue: 0xFFFFCDD2),
      FeatureModel(name: 'Train', imagePath: AssetHelper.getImagePath('vehicles', 'train'), audioPath: AssetHelper.getAudioPath('vehicles', 'train').replaceAll('assets/', ''), colorValue: 0xFFC8E6C9),
      FeatureModel(name: 'Airplane', imagePath: AssetHelper.getImagePath('vehicles', 'airplane'), audioPath: AssetHelper.getAudioPath('vehicles', 'airplane').replaceAll('assets/', ''), colorValue: 0xFFB3E5FC),
    ];
  }
}

@riverpod
VehiclesRepository vehiclesRepository(Ref ref) {
  return VehiclesRepository();
}

@riverpod
List<FeatureModel> vehiclesList(Ref ref) {
  return ref.watch(vehiclesRepositoryProvider).getVehicles();
}
