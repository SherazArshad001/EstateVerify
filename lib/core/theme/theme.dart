import 'package:flutter/material.dart';
import 'package:real_estate_app/core/theme/app_pallet.dart';

class AppTheme {
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppPalette.btnColor,
    scaffoldBackgroundColor: AppPalette.backgroundColor,
    cardColor: AppPalette.surface,
    iconTheme: const IconThemeData(color: AppPalette.textPrimary),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppPalette.textPrimary),
      bodyMedium: TextStyle(color: AppPalette.textSecondary),
      bodySmall: TextStyle(color: AppPalette.textHint),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.btnColor,
        foregroundColor: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppPalette.surface,
      hintStyle: const TextStyle(color: AppPalette.textHint),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppPalette.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: AppPalette.btnColor,
      secondary: AppPalette.secondary,
      surface: AppPalette.surface,
      error: AppPalette.errorColor,
    ),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppPalette.btnColor,
    scaffoldBackgroundColor: Colors.black,
    cardColor: const Color(0xFF121212), // Darker surface color
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: AppPalette.textSecondary),
      bodySmall: TextStyle(color: AppPalette.textHint),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppPalette.btnColor,
        foregroundColor: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1E1E1E),
      hintStyle: const TextStyle(color: AppPalette.textHint),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppPalette.borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppPalette.btnColor,
      secondary: AppPalette.secondary,
      surface: const Color(0xFF121212),
      error: AppPalette.errorColor,
    ),
  );
}
