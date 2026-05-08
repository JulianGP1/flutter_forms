 import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeProvider =
    StateNotifierProvider<ThemeNotifier, bool>((ref) {
  return ThemeNotifier();
});
 
class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    _loadTheme();
  }

  void _loadTheme() async {
    final pref = await SharedPreferences.getInstance();
    state = pref.getBool("isDarkMode") ?? false;
  }

  void toggleTheme() async {
    final pref = await SharedPreferences.getInstance();
    state = !state;
    await pref.setBool("isDarkMode", state);
  }
}