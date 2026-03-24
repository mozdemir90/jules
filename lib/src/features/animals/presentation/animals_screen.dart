import '../../completion/presentation/completion_page.dart';
import '../../quiz/presentation/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data/animal_provider.dart';
import '../../../common_widgets/flashcard_view.dart';

class AnimalsScreen extends ConsumerStatefulWidget {
  const AnimalsScreen({super.key});

  @override
  ConsumerState<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends ConsumerState<AnimalsScreen> {
  late final PageController _pageController;
  int _currentPageIndex = 0;
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void playAnimalAudio(String audioPath) async {
    await _audioPlayer.stop();
    try {
      await _audioPlayer.play(AssetSource(audioPath));
    } catch (e) {
      debugPrint("Ses çalınırken hata oluştu: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final animals = ref.watch(animalListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: animals.length + 1,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                if (index == animals.length) {
                  return CompletionPage(
                    categoryName: 'Animals',
                    onPlayQuiz: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(items: animals),
                        ),
                      );
                    },
                  );
                }
                final animal = animals[index];

                return FlashcardView(
                  title: animal.name,
                  imagePath: animal.imagePath,
                  backgroundColor: animal.colorValue,
                  onTap: () {
                    debugPrint('${animal.name} tıklandı');
                    playAnimalAudio(animal.audioPath);
                  },
                );
              },
            ),
          ),
          // Dot indicators
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0, top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                animals.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 12.0,
                  width: _currentPageIndex == index ? 24.0 : 12.0,
                  decoration: BoxDecoration(
                    color: _currentPageIndex == index
                        ? Theme.of(context).primaryColor
                        : Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
