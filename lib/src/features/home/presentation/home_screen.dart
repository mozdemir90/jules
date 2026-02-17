import 'package:flutter/material.dart';
import '../../../common_widgets/primary_button.dart';
import '../../numbers/presentation/number_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('KidsLearn')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
              text: 'Learn Numbers',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const NumberScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
