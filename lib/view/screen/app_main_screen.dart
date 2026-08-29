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
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(icon: HugeIcons.strokeRoundedHome01),
                    Text('Home'),
                  ],
                ),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  controller.changePage(1);
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(icon: HugeIcons.strokeRoundedHome01),
                    Text('Home'),
                  ],
                ),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  controller.changePage(2);
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(icon: HugeIcons.strokeRoundedHome01),
                    Text('Home'),
                  ],
                ),
              ),
              const Spacer(),
              MaterialButton(
                onPressed: () {
                  controller.changePage(3);
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    HugeIcon(icon: HugeIcons.strokeRoundedHome01),
                    Text('Home'),
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
