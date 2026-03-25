import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../common_widgets/feature_model.dart';

part 'emotions_provider.g.dart';

class EmotionsRepository {
  List<FeatureModel> getEmotions() {
    return [
      const FeatureModel(name: 'Happy', imagePath: 'assets/images/emotions/happy.png', audioPath: 'audio/emotions/happy.mp3', colorValue: 0xFFFFF9C4),
      const FeatureModel(name: 'Sad', imagePath: 'assets/images/emotions/sad.png', audioPath: 'audio/emotions/sad.mp3', colorValue: 0xFFB3E5FC),
      const FeatureModel(name: 'Surprised', imagePath: 'assets/images/emotions/surprised.png', audioPath: 'audio/emotions/surprised.mp3', colorValue: 0xFFFFCDD2),
    ];
  }
}

@riverpod
EmotionsRepository emotionsRepository(Ref ref) {
  return EmotionsRepository();
}

@riverpod
List<FeatureModel> emotionsList(Ref ref) {
  return ref.watch(emotionsRepositoryProvider).getEmotions();
}
