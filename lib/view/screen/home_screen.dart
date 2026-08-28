import 'package:ecommercesystem/controller/home_controller.dart';
import 'package:ecommercesystem/core/class/handling_data_view.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/view/widget/home/cash_card.dart';
import 'package:ecommercesystem/view/widget/home/categories_vew.dart';
import 'package:ecommercesystem/view/widget/home/custom_app_bar.dart';
import 'package:ecommercesystem/view/widget/home/items_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String path = '/HomeScreen';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      init: HomeControllerImp(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: AppColours.white,
          body: SafeArea(
            child: HandlingDataView(
              statusRequest: controller.itStatusRequest,
              widget: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Column(
                    spacing: 10.5,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(),
                      const CashCard(),
                      CategoriesVew(categories: controller.categoryList),
                      const Text(
                        '  Product For You',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ItemsView(items: controller.itemsList),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
