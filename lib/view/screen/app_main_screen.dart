import 'package:ecommercesystem/controller/app_main_controller.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';

class AppMainScreen extends StatelessWidget {
  const AppMainScreen({super.key});
  static const String path = '/AppMainScreen';

  @override
  Widget build(BuildContext context) {
    Get.put(AppMainControllerImp());
    return GetBuilder<AppMainControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColours.white,
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          elevation: 4,
          backgroundColor: AppColours.white,
          onPressed: () {},
          child: const HugeIcon(icon: HugeIcons.strokeRoundedShoppingBasket01),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: AppColours.white,
          child: Row(
            children: [
              MaterialButton(
                onPressed: () {
                  controller.changePage(0);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedHome01,
                      color: controller.currentPage == 0
                          ? AppColours.pPurple
                          : AppColours.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: controller.currentPage == 0
                            ? AppColours.pPurple
                            : AppColours.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  controller.changePage(1);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedSettings01,
                      color: controller.currentPage == 1
                          ? AppColours.pPurple
                          : AppColours.grey,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: controller.currentPage == 1
                            ? AppColours.pPurple
                            : AppColours.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  controller.changePage(2);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedProfile,
                      color: controller.currentPage == 2
                          ? AppColours.pPurple
                          : AppColours.grey,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: controller.currentPage == 2
                            ? AppColours.pPurple
                            : AppColours.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  controller.changePage(3);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedMailLove01,
                      color: controller.currentPage == 3
                          ? AppColours.pPurple
                          : AppColours.grey,
                    ),
                    Text(
                      'Favorite',
                      style: TextStyle(
                        color: controller.currentPage == 3
                            ? AppColours.pPurple
                            : AppColours.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: controller.pages.elementAt(controller.currentPage),
      ),
    );
  }
}
