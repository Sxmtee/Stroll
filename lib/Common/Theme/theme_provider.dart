import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

//! this is the provider used to switch and change the theme of the app
final themesProvider = StateNotifierProvider<ThemesProvider, ThemeMode?>(
  (_) {
    return ThemesProvider();
  },
);

class ThemesProvider extends StateNotifier<ThemeMode?> {
  static const _themeKey = 'app_theme_mode';

  ThemesProvider() : super(ThemeMode.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themeKey);

    if (savedTheme == 'dark') {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }

  void changeTheme(bool isOn) async {
    final themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    state = themeMode;

    // Save the theme preference
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, isOn ? 'dark' : 'light');
  }

  // Optional: Method to reset to system theme
  void resetToSystemTheme() async {
    state = ThemeMode.system;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_themeKey);
  }
}
