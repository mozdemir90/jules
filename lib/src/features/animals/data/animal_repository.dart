import '../domain/animal_model.dart';
import '../../../common_widgets/asset_helper.dart';

class AnimalRepository {
  List<AnimalModel> getAnimals() {
    return [
      AnimalModel(
        name: 'Cat',
        imagePath: AssetHelper.getImagePath('animals', 'cat'),
        audioPath: AssetHelper.getAudioPath('animals', 'cat').replaceAll('assets/', ''),
        colorValue: 0xFFFFCDD2,
      ),
      AnimalModel(
        name: 'Dog',
        imagePath: AssetHelper.getImagePath('animals', 'dog'),
        audioPath: AssetHelper.getAudioPath('animals', 'dog').replaceAll('assets/', ''),
        colorValue: 0xFFB3E5FC,
      ),
      AnimalModel(
        name: 'Cow',
        imagePath: AssetHelper.getImagePath('animals', 'cow'),
        audioPath: AssetHelper.getAudioPath('animals', 'cow').replaceAll('assets/', ''),
        colorValue: 0xFFDCEDC8,
      ),
    ];
  }
}
