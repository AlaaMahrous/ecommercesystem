import 'package:ecommercesystem/core/constant/app_theme.dart';
import 'package:ecommercesystem/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  Locale? language;
  Services services = Get.find();
  ThemeData appTheme = themeEnglish;

  void changeLang(String langcode) {
    Locale locale = Locale(langcode);
    services.sharedPreferences.setString('lang', langcode);
    appTheme = langcode == 'ar' ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = services.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
