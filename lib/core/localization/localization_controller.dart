import 'package:ecommercesystem/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController {
  Locale? language;
  Services services = Get.find();
  void changeLang(String langcode) {
    Locale locale = Locale(langcode);
    services.sharedPreferences.setString('lang', langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = services.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
