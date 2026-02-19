import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data/number_provider.dart';

class NumberScreen extends ConsumerWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numbers = ref.watch(numberListProvider);

    void playNumberAudio(int number) async {
      final player = AudioPlayer();
      try {
        await player.play(AssetSource('audio/numbers/$number.mp3'));
      } catch (e) {
        debugPrint("Ses çalınırken hata oluştu: $e");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Numbers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            // Kartları biraz daha uzun yaptık ki her şey sığsın
            childAspectRatio: 0.75,
          ),
          itemCount: numbers.length,
          itemBuilder: (context, index) {
            final number = numbers[index];
            // Resim yolunu dinamik olarak oluşturuyoruz: assets/images/numbers/1.png
            final imagePath = 'assets/images/numbers/${number.digit}.png';

            return Card(
              color: Color(number.colorValue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () {
                  debugPrint('${number.digit} tıklandı');
                  playNumberAudio(number.digit);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0), // İçeriğe biraz boşluk
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // YENİ: Hayvan Resmi
                      Expanded( // Resmin, kalan boşluğu doldurmasını sağlar
                        flex: 3, // Resim alandan daha fazla pay alsın
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.contain, // Resmi bozmadan kutuya sığdırır
                            errorBuilder: (context, error, stackTrace) {
                              // Eğer resim dosyası henüz yoksa, yerine geçici bir ikon gösterir
                              return const Icon(Icons.image, color: Colors.white54, size: 60);
                            },
                          ),
                        ),
                      ),
                      // Sayı
                      Expanded(
                        flex: 2,
                        child: Center(
                           child: Text(
                          '${number.digit}',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize: 56, // Sayıyı biraz küçülttük
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  const Shadow(
                                    color: Colors.black26,
                                    offset: Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                        ),
                        )
                      ),
                      // Kelime
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          number.word,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}