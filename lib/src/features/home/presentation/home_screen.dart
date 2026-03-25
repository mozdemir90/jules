import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common_widgets/category_button.dart';
import '../../numbers/presentation/number_screen.dart';
import '../../animals/presentation/animals_screen.dart';
import '../../colors/presentation/colors_screen.dart';
import '../../shapes/presentation/shapes_screen.dart';
import '../../body_parts/presentation/body_parts_screen.dart';
import '../../fruits_vegetables/presentation/fruits_vegetables_screen.dart';
import '../../vehicles/presentation/vehicles_screen.dart';
import '../../clothes/presentation/clothes_screen.dart';
import '../../emotions/presentation/emotions_screen.dart';
import '../../quiz/presentation/quiz_screen.dart';
import '../../numbers/data/number_provider.dart';
import '../../animals/data/animal_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KidsLearn')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, sin(_controller.value * pi) * -20),
                      child: child,
                    );
                  },
                  child: Image.asset(
                    'assets/images/mascot/mascot.png',
                    height: 150,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.pets, size: 100, color: Colors.orange);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.9,
                  children: [
                    CategoryButton(
                      text: 'Numbers',
                      iconEmoji: '🔢',
                      backgroundColor: const Color(0xFF64B5F6),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const NumberScreen()),
                      ),
                    ),
                    CategoryButton(
                      text: 'Animals',
                      iconEmoji: '🐶',
                      backgroundColor: const Color(0x81C784FF),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const AnimalsScreen()),
                      ),
                    ),
                    CategoryButton(
                      text: 'Colors',
                      iconEmoji: '🎨',
                      backgroundColor: const Color(0xFFFFB74D),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ColorsScreen()),
                      ),
                    ),
                    CategoryButton(
                      text: 'Shapes',
                      iconEmoji: '🟦',
                      backgroundColor: const Color(0xFFBA68C8),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ShapesScreen()),
                      ),
                    ),
                    CategoryButton(
                      text: 'Body Parts',
                      iconEmoji: '👀',
                      backgroundColor: const Color(0xFFFF8A65),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const BodyPartsScreen()),
                      ),
                    ),
                    CategoryButton(
                      text: 'Food',
                      iconEmoji: '🍎',
                      backgroundColor: const Color(0xFF4DB6AC),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const FruitsVegetablesScreen()),
                      ),
                    ),
                    CategoryButton(
                      text: 'Vehicles',
                      iconEmoji: '🚗',
                      backgroundColor: const Color(0xFF7986CB),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const VehiclesScreen()),
                      ),
                    ),
                    CategoryButton(
                      text: 'Clothes',
                      iconEmoji: '👕',
                      backgroundColor: const Color(0xFFA1887F),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const ClothesScreen()),
                      ),
                    ),
                    CategoryButton(
                      text: 'Emotions',
                      iconEmoji: '😊',
                      backgroundColor: const Color(0xFFF06292),
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const EmotionsScreen()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  icon: const Icon(Icons.star, size: 32),
                  label: const Text('Play Quiz Mode!', style: TextStyle(fontSize: 24)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    final numbers = ref.read(numberListProvider);
                    final animals = ref.read(animalListProvider);
                    final allItems = [...numbers, ...animals];

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => QuizScreen(items: allItems),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
