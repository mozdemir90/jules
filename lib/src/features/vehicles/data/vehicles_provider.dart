import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'vehicles_provider.g.dart';

class VehiclesRepository {
  List<FeatureModel> getVehicles() {
    return [
      const FeatureModel(name: 'Car', imagePath: 'assets/images/vehicles/car.png', audioPath: 'audio/vehicles/car.mp3', colorValue: 0xFFB3E5FC),
      const FeatureModel(name: 'Bus', imagePath: 'assets/images/vehicles/bus.png', audioPath: 'audio/vehicles/bus.mp3', colorValue: 0xFFFFE0B2),
      const FeatureModel(name: 'Train', imagePath: 'assets/images/vehicles/train.png', audioPath: 'audio/vehicles/train.mp3', colorValue: 0xFFCFD8DC),
      const FeatureModel(name: 'Airplane', imagePath: 'assets/images/vehicles/airplane.png', audioPath: 'audio/vehicles/airplane.mp3', colorValue: 0xFFE1BEE7),
      const FeatureModel(name: 'Ship', imagePath: 'assets/images/vehicles/ship.png', audioPath: 'audio/vehicles/ship.mp3', colorValue: 0xFFB2EBF2),
      const FeatureModel(name: 'Motorcycle', imagePath: 'assets/images/vehicles/motorcycle.png', audioPath: 'audio/vehicles/motorcycle.mp3', colorValue: 0xFFFFEBEE),
      const FeatureModel(name: 'Truck', imagePath: 'assets/images/vehicles/truck.png', audioPath: 'audio/vehicles/truck.mp3', colorValue: 0xFFF5F5F5),
      const FeatureModel(name: 'Bulldozer', imagePath: 'assets/images/vehicles/bulldozer.png', audioPath: 'audio/vehicles/bulldozer.mp3', colorValue: 0xFFFFF9C4),
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
