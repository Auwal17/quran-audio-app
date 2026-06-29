import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

/// Application Theme Configuration
class AppTheme {
  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColors.emeraldGreen,
        onPrimary: AppColors.white,
        primaryContainer: AppColors.emeraldGreenLight,
        onPrimaryContainer: AppColors.emeraldGreenDark,
        secondary: AppColors.gold,
        onSecondary: AppColors.black,
        secondaryContainer: AppColors.goldLight,
        onSecondaryContainer: AppColors.goldDark,
        error: AppColors.error,
        onError: AppColors.white,
        background: AppColors.lightBackground,
        onBackground: AppColors.lightText,
        surface: AppColors.lightSurface,
        onSurface: AppColors.lightText,
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightSurface,
        foregroundColor: AppColors.lightText,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.headlineMedium.copyWith(
          color: AppColors.lightText,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightSurface,
        indicatorColor: AppColors.emeraldGreen.withOpacity(0.1),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: AppColors.emeraldGreen);
          }
          return IconThemeData(color: AppColors.lightTextSecondary);
        }),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppTypography.labelSmall.copyWith(
              color: AppColors.emeraldGreen,
            );
          }
          return AppTypography.labelSmall.copyWith(
            color: AppColors.lightTextSecondary,
          );
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.emeraldGreen,
        foregroundColor: AppColors.white,
      ),
      cardTheme: CardTheme(
        color: AppColors.lightSurface,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.lightBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lightBackground,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.lightBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.emeraldGreen, width: 2),
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.lightTextSecondary,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(
          color: AppColors.lightText,
        ),
        displayMedium: AppTypography.displayMedium.copyWith(
          color: AppColors.lightText,
        ),
        headlineLarge: AppTypography.headlineLarge.copyWith(
          color: AppColors.lightText,
        ),
        headlineMedium: AppTypography.headlineMedium.copyWith(
          color: AppColors.lightText,
        ),
        headlineSmall: AppTypography.headlineSmall.copyWith(
          color: AppColors.lightText,
        ),
        bodyLarge: AppTypography.bodyLarge.copyWith(
          color: AppColors.lightText,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: AppColors.lightText,
        ),
        bodySmall: AppTypography.bodySmall.copyWith(
          color: AppColors.lightTextSecondary,
        ),
        labelLarge: AppTypography.labelLarge.copyWith(
          color: AppColors.lightText,
        ),
      ),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColors.emeraldGreen,
        onPrimary: AppColors.darkBackground,
        primaryContainer: AppColors.emeraldGreenDark,
        onPrimaryContainer: AppColors.emeraldGreenLight,
        secondary: AppColors.gold,
        onSecondary: AppColors.darkBackground,
        secondaryContainer: AppColors.goldDark,
        onSecondaryContainer: AppColors.goldLight,
        error: AppColors.error,
        onError: AppColors.darkBackground,
        background: AppColors.darkBackground,
        onBackground: AppColors.darkText,
        surface: AppColors.darkSurface,
        onSurface: AppColors.darkText,
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkSurface,
        foregroundColor: AppColors.darkText,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.headlineMedium.copyWith(
          color: AppColors.darkText,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkSurface,
        indicatorColor: AppColors.emeraldGreen.withOpacity(0.15),
        iconTheme: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: AppColors.emeraldGreen);
          }
          return IconThemeData(color: AppColors.darkTextSecondary);
        }),
        labelTextStyle: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return AppTypography.labelSmall.copyWith(
              color: AppColors.emeraldGreen,
            );
          }
          return AppTypography.labelSmall.copyWith(
            color: AppColors.darkTextSecondary,
          );
        }),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.emeraldGreen,
        foregroundColor: AppColors.darkBackground,
      ),
      cardTheme: CardTheme(
        color: AppColors.darkSurface,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: AppColors.darkBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkBackground,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.emeraldGreen, width: 2),
        ),
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.darkTextSecondary,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: AppTypography.displayLarge.copyWith(
          color: AppColors.darkText,
        ),
        displayMedium: AppTypography.displayMedium.copyWith(
          color: AppColors.darkText,
        ),
        headlineLarge: AppTypography.headlineLarge.copyWith(
          color: AppColors.darkText,
        ),
        headlineMedium: AppTypography.headlineMedium.copyWith(
          color: AppColors.darkText,
        ),
        headlineSmall: AppTypography.headlineSmall.copyWith(
          color: AppColors.darkText,
        ),
        bodyLarge: AppTypography.bodyLarge.copyWith(
          color: AppColors.darkText,
        ),
        bodyMedium: AppTypography.bodyMedium.copyWith(
          color: AppColors.darkText,
        ),
        bodySmall: AppTypography.bodySmall.copyWith(
          color: AppColors.darkTextSecondary,
        ),
        labelLarge: AppTypography.labelLarge.copyWith(
          color: AppColors.darkText,
        ),
      ),
    );
  }
}
