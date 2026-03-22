import '../domain/animal_model.dart';

class AnimalRepository {
  List<AnimalModel> getAnimals() {
    return [
      const AnimalModel(
        name: 'Cat',
        imagePath: 'assets/images/animals/cat.png',
        audioPath: 'audio/animals/cat.mp3',
        colorValue: 0xFFFFCDD2,
      ),
      const AnimalModel(
        name: 'Dog',
        imagePath: 'assets/images/animals/dog.png',
        audioPath: 'audio/animals/dog.mp3',
        colorValue: 0xFFB3E5FC,
      ),
      const AnimalModel(
        name: 'Cow',
        imagePath: 'assets/images/animals/cow.png',
        audioPath: 'audio/animals/cow.mp3',
        colorValue: 0xFFDCEDC8,
      ),
    ];
  }
}
