import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'quiz_success_screen.dart';
import '../../../common_widgets/asset_helper.dart';

class QuizScreen extends StatefulWidget {
  final List<dynamic> items; // Can be NumberModel, AnimalModel, or FeatureModel

  const QuizScreen({super.key, required this.items});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final AudioPlayer _audioPlayer;
  late List<dynamic> _quizQuestions;
  int _currentQuestionIndex = 0;
  List<dynamic> _currentOptions = [];
  dynamic _targetItem;

  // Track wobbling states for incorrect taps
  Map<int, bool> _wobblingIndex = {};

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _generateQuiz();
    _playTargetAudio();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _generateQuiz() {
    final random = Random();
    // Select up to 5 random unique questions from the available items
    final shuffledItems = List.from(widget.items)..shuffle(random);
    _quizQuestions = shuffledItems.take(5).toList();
    if (_quizQuestions.isEmpty) return;

    _setupQuestion();
  }

  void _setupQuestion() {
    if (_currentQuestionIndex >= _quizQuestions.length) {
      // Quiz complete
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const QuizSuccessScreen()),
        );
      });
      return;
    }

    _targetItem = _quizQuestions[_currentQuestionIndex];

    // Select 3 wrong options
    final random = Random();
    final otherItems = widget.items.where((item) => item != _targetItem).toList();
    otherItems.shuffle(random);
    final wrongOptions = otherItems.take(3).toList();

    _currentOptions = [_targetItem, ...wrongOptions];
    _currentOptions.shuffle(random);

    _wobblingIndex.clear();
  }

  void _playTargetAudio() async {
    if (_targetItem == null) return;
    await _audioPlayer.stop();
    try {
      String audioPath = '';
      if (_targetItem.runtimeType.toString() == 'NumberModel') {
        audioPath = AssetHelper.getAudioPath('numbers', _targetItem.digit.toString()).replaceAll('assets/', '');
      } else {
        audioPath = _targetItem.audioPath;
      }
      await _audioPlayer.play(AssetSource(audioPath));
    } catch (e) {
      debugPrint("Ses çalınırken hata oluştu: $e");
    }
  }

  void _handleTap(int index, dynamic tappedItem) {
    if (tappedItem == _targetItem) {
      // Correct!
      setState(() {
        _currentQuestionIndex++;
        if (_currentQuestionIndex < _quizQuestions.length) {
          _setupQuestion();
          _playTargetAudio();
        } else {
          _setupQuestion(); // Will handle navigation
        }
      });
    } else {
      // Wrong! Trigger wobble
      setState(() {
        _wobblingIndex[index] = true;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _wobblingIndex[index] = false;
          });
        }
      });
    }
  }

  Widget _buildOptionCard(int index) {
    if (index >= _currentOptions.length) return const Expanded(child: SizedBox());

    final option = _currentOptions[index];
    String imagePath = '';
    int bgColor = 0xFFEEEEEE;

    if (option.runtimeType.toString() == 'NumberModel') {
      imagePath = AssetHelper.getImagePath('numbers', option.digit.toString());
      bgColor = option.colorValue;
    } else {
      imagePath = option.imagePath;
      bgColor = option.colorValue;
    }

    final isWobbling = _wobblingIndex[index] ?? false;

    return Expanded(
      child: GestureDetector(
        onTap: () => _handleTap(index, option),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: Matrix4.translationValues(
            isWobbling ? sin(DateTime.now().millisecondsSinceEpoch) * 10 : 0, 0, 0
          ),
          child: Card(
            color: Color(bgColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image, size: 64, color: Colors.white);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_quizQuestions.isEmpty || _currentQuestionIndex >= _quizQuestions.length) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentQuestionIndex + 1} of ${_quizQuestions.length}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 100,
                      icon: const Icon(Icons.volume_up, color: Colors.blue),
                      onPressed: _playTargetAudio,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Find this one!',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          _buildOptionCard(0),
                          const SizedBox(width: 16),
                          _buildOptionCard(1),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Row(
                        children: [
                          _buildOptionCard(2),
                          const SizedBox(width: 16),
                          _buildOptionCard(3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
