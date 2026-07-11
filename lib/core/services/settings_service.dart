import 'package:get/get.dart';

import 'services.dart';

class SettingsService {
  static final _prefs = Get.find<Services>().sharedPreferences;

  // Language
  static bool get languageSelected =>
      _prefs.getBool('languageSelected') ?? false;

  static Future<void> setLanguageSelected(bool value) async {
    await _prefs.setBool('languageSelected', value);
  }

  // Onboarding
  static bool get onboardingCompleted =>
      _prefs.getBool('onboardingCompleted') ?? false;

  static Future<void> setOnboardingCompleted(bool value) async {
    await _prefs.setBool('onboardingCompleted', value);
  }

  // First Open
  static bool get isFirstOpen => _prefs.getBool('isFirstOpen') ?? true;

  static Future<void> setFirstOpen(bool value) async {
    await _prefs.setBool('isFirstOpen', value);
  }

  // Login
  static bool get isLoggedIn => _prefs.getBool('isLoggedIn') ?? false;

  static Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool('isLoggedIn', value);
  }

  // Clear all settings (اختياري)
  static Future<void> clear() async {
    await _prefs.clear();
  }
}
