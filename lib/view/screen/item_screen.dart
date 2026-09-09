import 'package:ecommercesystem/controller/items_controller.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:ecommercesystem/view/widget/home/custom_app_bar.dart';
import 'package:ecommercesystem/view/widget/global/back_arrow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.category});
  static const String path = '/ItemScreen';
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    ItemsControllerImpl controller = Get.put(ItemsControllerImpl());
    return Scaffold(
      backgroundColor: AppColours.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: const [
            Row(
              children: [
                BackArrow(),
                Expanded(child: CustomAppBar()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
