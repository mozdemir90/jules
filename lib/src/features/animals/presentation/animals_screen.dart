import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data/animal_provider.dart';

class AnimalsScreen extends ConsumerStatefulWidget {
  const AnimalsScreen({super.key});

  @override
  ConsumerState<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends ConsumerState<AnimalsScreen> {
  late final PageController _pageController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void playAnimalAudio(String audioPath) async {
    final player = AudioPlayer();
    try {
      await player.play(AssetSource(audioPath));
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
              itemCount: animals.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final animal = animals[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 32.0,
                  ),
                  child: Card(
                    color: Color(animal.colorValue),
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () {
                        debugPrint('${animal.name} tıklandı');
                        playAnimalAudio(animal.audioPath);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Resim
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  animal.imagePath,
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.image,
                                      color: Colors.white54,
                                      size: 120,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            // Kelime
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Text(
                                animal.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1.5,
                                      shadows: [
                                          const Shadow(
                                            color: Colors.black26,
                                            offset: Offset(4, 4),
                                            blurRadius: 8,
                                          ),
                                        ],
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
