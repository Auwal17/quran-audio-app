import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';

/// Theme Provider - Manages light/dark mode state
final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isDark = prefs.getBool(AppConstants.prefThemeKey) ?? false;
      state = isDark;
    } catch (e) {
      print('Error loading theme preference: $e');
    }
  }

  Future<void> toggleTheme() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      state = !state;
      await prefs.setBool(AppConstants.prefThemeKey, state);
    } catch (e) {
      print('Error toggling theme: $e');
    }
  }
}
