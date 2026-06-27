import 'package:ecommercesystem/data/datasource/static/static.dart';
import 'package:ecommercesystem/view/screen/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

abstract class OnboardingController extends GetxController {
  void next(BuildContext context);
  void onPageChange(int index);
}

class OnboardingControllerImpl extends OnboardingController {
  late PageController pageController;
  int currentPage = 0;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void next(BuildContext context) {
    currentPage++;
    if (currentPage > onboarding.length - 1) {
      context.go(LoginScreen.path);
    } else {
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void onPageChange(int index) {
    currentPage = index;
    update();
  }
}
