import 'package:flutter/material.dart';

class AppColors {
  // =========================
  // Main Colors
  // =========================

  static const Color primary = Color.fromARGB(255, 72, 76, 175);

  // =========================
  // Task Colors
  // =========================

  static const Color blue = Color(0xFF4A90E2);

  static const Color green = Color(0xFF4CAF50);

  static const Color orange = Color(0xFFFF9800);

  static const Color purple = Color(0xFF9C27B0);

  static const Color red = Color(0xFFE53935);

  static const Color teal = Color(0xFF009688);

  // =========================
  // Text Colors
  // =========================

  static const Color textPrimary = Color(0xFF1D1D1D);

  static const Color textSecondary = Color(0xFF777777);

  // =========================
  // Background Colors
  // =========================

  static const Color cardBackground = Colors.white;

  static const Color background = Color(0xFFF7F7F7);
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    // Background
    scaffoldBackgroundColor: AppColors.background,

    // Main color
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

    // =========================
    // Text Fields
    // =========================

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 15,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: AppColors.primary,
          width: 1.5,
        ),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Colors.red,
          width: 1.5,
        ),
      ),
    ),

    // =========================
    // Buttons
    // =========================

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,

        minimumSize: const Size(
          double.infinity,
          52,
        ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        elevation: 0,
      ),
    ),

    // =========================
    // AppBar
    // =========================

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    // =========================
    // Floating Action Button
    // =========================

    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),
  );
}