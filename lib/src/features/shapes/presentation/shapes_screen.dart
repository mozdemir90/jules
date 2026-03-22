import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data/shapes_provider.dart';
import '../../../common_widgets/flashcard_view.dart';

class ShapesScreen extends ConsumerStatefulWidget {
  const ShapesScreen({super.key});

  @override
  ConsumerState<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends ConsumerState<ShapesScreen> {
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

  void playAudio(String audioPath) async {
    await _audioPlayer.stop();
    try {
      await _audioPlayer.play(AssetSource(audioPath));
    } catch (e) {
      debugPrint("Ses çalınırken hata oluştu: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = ref.watch(shapesListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Shapes')),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              onPageChanged: (index) => setState(() => _currentPageIndex = index),
              itemBuilder: (context, index) {
                final item = items[index];
                return FlashcardView(
                  title: item.name,
                  imagePath: item.imagePath,
                  backgroundColor: item.colorValue,
                  onTap: () => playAudio(item.audioPath),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0, top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                items.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  height: 12.0,
                  width: _currentPageIndex == index ? 24.0 : 12.0,
                  decoration: BoxDecoration(
                    color: _currentPageIndex == index ? Theme.of(context).primaryColor : Colors.grey.shade400,
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
