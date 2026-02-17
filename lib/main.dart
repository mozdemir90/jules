import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/constants/app_theme.dart';
import 'src/features/home/presentation/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: KidsLearnApp()));
}

class KidsLearnApp extends StatelessWidget {
  const KidsLearnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KidsLearn',
      theme: AppTheme.theme,
      home: const HomeScreen(),
    );
  }
}
