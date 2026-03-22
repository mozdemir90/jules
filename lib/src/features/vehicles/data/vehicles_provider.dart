import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'vehicles_provider.g.dart';

class VehiclesRepository {
  List<FeatureModel> getVehicles() {
    return [
      const FeatureModel(name: 'Car', imagePath: 'assets/images/vehicles/car.png', audioPath: 'audio/vehicles/car.mp3', colorValue: 0xFFB3E5FC),
      const FeatureModel(name: 'Train', imagePath: 'assets/images/vehicles/train.png', audioPath: 'audio/vehicles/train.mp3', colorValue: 0xFFCFD8DC),
      const FeatureModel(name: 'Airplane', imagePath: 'assets/images/vehicles/airplane.png', audioPath: 'audio/vehicles/airplane.mp3', colorValue: 0xFFE1BEE7),
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
