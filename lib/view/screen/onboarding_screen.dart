import 'package:ecommercesystem/controller/onboarding_controller.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/data/datasource/static/static.dart';
import 'package:ecommercesystem/view/screen/auth/login_screen.dart';
import 'package:ecommercesystem/view/widget/onboarding/circular_arrow_progress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 70),
              Image.asset(
                onboarding[i].imageUrl!,
                width: 230,
                height: 250,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 56),
              Text(
                onboarding[i].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
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
                onTap: () {
                  context.go(LoginScreen.path);
                },
                child: Container(
                  width: 65,
                  height: 33,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 244, 244, 244),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: const Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
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
