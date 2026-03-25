import '../../completion/presentation/completion_page.dart';
import '../../quiz/presentation/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data/number_provider.dart';
import '../../../common_widgets/flashcard_view.dart';
import '../../../common_widgets/asset_helper.dart';

class NumberScreen extends ConsumerStatefulWidget {
  const NumberScreen({super.key});

  @override
  ConsumerState<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends ConsumerState<NumberScreen> {
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

  void playNumberAudio(int number) async {
    await _audioPlayer.stop();
    try {
      await _audioPlayer.play(AssetSource(AssetHelper.getAudioPath('numbers', number.toString()).replaceAll('assets/', '')));
    } catch (e) {
      debugPrint("Ses çalınırken hata oluştu: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final numbers = ref.watch(numberListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: numbers.length + 1,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                if (index == numbers.length) {
                  return CompletionPage(
                    categoryName: 'Numbers',
                    onPlayQuiz: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(items: numbers),
                        ),
                      );
                    },
                  );
                }
                final number = numbers[index];
                // Resim yolunu dinamik olarak oluşturuyoruz
                final imagePath = AssetHelper.getImagePath('numbers', number.digit.toString());

                return FlashcardView(
                  title: '${number.digit}\n${number.word}',
                  imagePath: imagePath,
                  backgroundColor: number.colorValue,
                  onTap: () {
                    debugPrint('${number.digit} tıklandı');
                    playNumberAudio(number.digit);
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
                numbers.length,
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
