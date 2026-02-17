import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: const Color(0xFFFFF9E6), // Light yellow background
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        color: Colors.black87,
      ),
    ),
  );

  static const List<Color> cardColors = [
    Color(0xFFFFCDD2), // Red 100
    Color(0xFFE1BEE7), // Purple 100
    Color(0xFFC5CAE9), // Indigo 100
    Color(0xFFB3E5FC), // Light Blue 100
    Color(0xFFB2DFDB), // Teal 100
    Color(0xFFDCEDC8), // Light Green 100
    Color(0xFFFFF9C4), // Yellow 100
    Color(0xFFFFE0B2), // Orange 100
    Color(0xFFD7CCC8), // Brown 100
    Color(0xFFCFD8DC), // Blue Grey 100
  ];
}
