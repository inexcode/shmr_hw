import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 103, 80, 164),
      ).copyWith(
        primaryContainer: ThemeColors.lightGreen,
        primary: ThemeColors.toxicGreen,
        error: ThemeColors.lightRed,
      ),
  useMaterial3: true,
  navigationBarTheme: const NavigationBarThemeData(
    indicatorColor: ThemeColors.lightGreen,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: ThemeColors.toxicGreen,
    centerTitle: true,
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ThemeColors.toxicGreen,
    foregroundColor: Colors.white,
    shape: CircleBorder(),
  ),
);

abstract final class ThemeColors {
  static const Color lightGreen = Color.fromARGB(255, 212, 250, 230);
  static const Color toxicGreen = Color.fromARGB(255, 42, 232, 129);
  static const Color lightRed = Color.fromARGB(255, 228, 105, 98);
}
