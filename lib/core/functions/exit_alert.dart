import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<dynamic> exitAlert() {
  return Get.defaultDialog(
    title: "Alert",
    middleText: "Do you want to exit app?",
    actions: [
      ElevatedButton(
        onPressed: () {
          SystemNavigator.pop();
        },
        child: const Text("yes"),
      ),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("cancel"),
      ),
    ],
  );
}
