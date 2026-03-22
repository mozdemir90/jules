import 'package:flutter/material.dart';
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KidsLearn')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
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
        ),
      ),
    );
  }
}
