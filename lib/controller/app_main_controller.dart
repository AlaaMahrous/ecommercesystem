import 'package:ecommercesystem/view/screen/favorite_screen.dart';
import 'package:ecommercesystem/view/screen/home_screen.dart';
import 'package:ecommercesystem/view/screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppMainController extends GetxController {
  void changePage(int currentPage);
}

class AppMainControllerImp extends AppMainController {
  int currentPage = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const SettingsScreen(),
    const Center(child: Text('3')),
    const FavoriteScreen(),
  ];
  @override
  void changePage(int i) {
    currentPage = i;
    update();
  }
}
