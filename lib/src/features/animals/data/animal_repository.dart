import '../domain/animal_model.dart';

class AnimalRepository {
  List<AnimalModel> getAnimals() {
    return [
      const AnimalModel(name: 'Bear', imagePath: 'assets/images/animals/bear.png', audioPath: 'audio/animals/bear.mp3', colorValue: 0xFFD7CCC8),
      const AnimalModel(name: 'Cat', imagePath: 'assets/images/animals/cat.png', audioPath: 'audio/animals/cat.mp3', colorValue: 0xFFFFCDD2),
      const AnimalModel(name: 'Caterpillar', imagePath: 'assets/images/animals/caterpillar.png', audioPath: 'audio/animals/caterpillar.mp3', colorValue: 0xFFC8E6C9),
      const AnimalModel(name: 'Cow', imagePath: 'assets/images/animals/cow.png', audioPath: 'audio/animals/cow.mp3', colorValue: 0xFFDCEDC8),
      const AnimalModel(name: 'Crocodile', imagePath: 'assets/images/animals/crocodile.png', audioPath: 'audio/animals/crocodile.mp3', colorValue: 0xFFE8F5E9),
      const AnimalModel(name: 'Dog', imagePath: 'assets/images/animals/dog.png', audioPath: 'audio/animals/dog.mp3', colorValue: 0xFFB3E5FC),
      const AnimalModel(name: 'Elephant', imagePath: 'assets/images/animals/elephant.png', audioPath: 'audio/animals/elephant.mp3', colorValue: 0xFFE1BEE7),
      const AnimalModel(name: 'Giraffe', imagePath: 'assets/images/animals/giraffe.png', audioPath: 'audio/animals/giraffe.mp3', colorValue: 0xFFFFF9C4),
      const AnimalModel(name: 'Mouse', imagePath: 'assets/images/animals/mouse.png', audioPath: 'audio/animals/mouse.mp3', colorValue: 0xFFF5F5F5),
      const AnimalModel(name: 'Owl', imagePath: 'assets/images/animals/owl.png', audioPath: 'audio/animals/owl.mp3', colorValue: 0xFFFFF3E0),
      const AnimalModel(name: 'Parrot', imagePath: 'assets/images/animals/parrot.png', audioPath: 'audio/animals/parrot.mp3', colorValue: 0xFFF1F8E9),
      const AnimalModel(name: 'Rhino', imagePath: 'assets/images/animals/rhino.png', audioPath: 'audio/animals/rhino.mp3', colorValue: 0xFFECEFF1),
      const AnimalModel(name: 'Zebra', imagePath: 'assets/images/animals/zebra.png', audioPath: 'audio/animals/zebra.mp3', colorValue: 0xFFF5F5F5),
    ];
  }
}
