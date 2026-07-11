import 'package:ecommercesystem/controller/onboarding_controller.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/services/settings_service.dart';
import 'package:ecommercesystem/data/datasource/static/static.dart';
import 'package:ecommercesystem/view/screen/auth/login_screen.dart';
import 'package:ecommercesystem/view/widget/onboarding/circular_arrow_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends GetView<OnboardingControllerImpl> {
  const OnboardingScreen({super.key});
  static const String path = '/OnboardingScreen';

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingControllerImpl());
    return Scaffold(
      backgroundColor: AppColours.white,
      body: SafeArea(
        child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: (value) {
            controller.onPageChange(value);
          },
          itemCount: onboarding.length,
          itemBuilder: (context, i) => Column(
            children: [
              const SizedBox(height: 35),
              Text(
                onboarding[i].title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 70),
              Image.asset(
                onboarding[i].imageUrl!,
                width: 230,
                height: 250, //Get.width / 1.2,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 56),
              Text(
                onboarding[i].body!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                  color: AppColours.grey,
                  fontSize: 15.5,
                ),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () {
                  controller.next(context);
                },
                child: CircularArrowProgress(
                  progress: (i + 1) / onboarding.length,
                ),
              ),
              const SizedBox(height: 25),
              InkWell(
                onTap: () async {
                  await SettingsService.setOnboardingCompleted(true);
                  Get.offNamed(LoginScreen.path);
                },
                child: Container(
                  width: 65,
                  height: 33,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 244, 244, 244),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      '2'.tr,
                      style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.5,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
