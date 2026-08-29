import 'package:ecommercesystem/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppMainController extends GetxController {
  void changePage(int currentPage);
}

class AppMainControllerImp extends AppMainController {
  int currentPage = 0;
  List<Widget> pages = [
    const HomeScreen(),
    const Center(child: Text('settings 2')),
    const Center(child: Text('3')),
    const Center(child: Text('4')),
  ];
  @override
  void changePage(int i) {
    currentPage = i;
    update();
  }
}
