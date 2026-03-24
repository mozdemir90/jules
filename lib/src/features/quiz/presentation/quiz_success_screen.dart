import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class QuizSuccessScreen extends StatefulWidget {
  const QuizSuccessScreen({super.key});

  @override
  State<QuizSuccessScreen> createState() => _QuizSuccessScreenState();
}

class _QuizSuccessScreenState extends State<QuizSuccessScreen> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 4));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiController.play();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'You Did It!',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 32),
                Image.asset(
                  'assets/images/mascot/abu_karinca.png',
                  height: 200,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.bug_report,
                      color: Colors.orange,
                      size: 200,
                    );
                  },
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {
                    // Pop back to the HomeScreen
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                    elevation: 8,
                  ),
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: const [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.purple],
            ),
          ),
        ],
      ),
    );
  }
}
