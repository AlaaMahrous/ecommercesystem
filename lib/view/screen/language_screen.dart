import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/localization/localization_controller.dart';
import 'package:ecommercesystem/core/services/settings_service.dart';
import 'package:ecommercesystem/view/screen/onboarding_screen.dart';
import 'package:ecommercesystem/view/widget/language/lang_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/state_manager.dart';
import 'package:go_router/go_router.dart';

class LanguageScreen extends GetView<LocalizationController> {
  const LanguageScreen({super.key});
  static const String path = '/LanguageScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 120),
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('1'.tr, style: Theme.of(context).textTheme.headlineLarge),
            const SizedBox(height: 5),
            LangButton(
              text: 'Ar',
              onPressed: () async {
                controller.changeLang("ar");
                final goRouter = GoRouter.of(context);
                await SettingsService.setLanguageSelected(true);
                goRouter.go(OnboardingScreen.path);
              },
            ),
            LangButton(
              text: 'En',
              onPressed: () async {
                controller.changeLang("en");
                final goRouter = GoRouter.of(context);
                await SettingsService.setLanguageSelected(true);
                goRouter.go(OnboardingScreen.path);
              },
            ),
          ],
        ),
      ),
    );
  }
}
