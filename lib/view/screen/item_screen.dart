import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:ecommercesystem/view/widget/home/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.category});
  static const String path = '/ItemScreen';
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(children: const [CustomAppBar()]),
      ),
    );
  }
}
