import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

final languajeProvider =
    StateNotifierProvider<languajeNotifier, Locale>((ref) {
  return languajeNotifier();
});

class languajeNotifier extends StateNotifier<Locale> {
  languajeNotifier() : super(const Locale('es')) {
    _loadLocale();
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString("languageCode") ?? 'es';
    state = Locale(langCode);
  }

  void toggleLanguage() async {
    final prefs = await SharedPreferences.getInstance();

   
    final newLang = state.languageCode == 'es' ? 'en' : 'es';

    state = Locale(newLang);
    await prefs.setString("languageCode", newLang);
  }
}