import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:ecommercesystem/view/widget/global/back_arrow.dart';
import 'package:ecommercesystem/view/widget/home/custom_app_bar.dart';
import 'package:ecommercesystem/view/widget/items/silver_items_grid.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.category});

  static const String path = '/ItemScreen';

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColours.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    BackArrow(),
                    SizedBox(width: 10),
                    Expanded(child: CustomAppBar()),
                  ],
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: 20)),
              SilverItemsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
