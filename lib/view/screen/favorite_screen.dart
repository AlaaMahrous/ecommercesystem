import 'package:ecommercesystem/view/widget/favorite/silver_favorite_grid.dart';
import 'package:ecommercesystem/view/widget/global/back_arrow.dart';
import 'package:ecommercesystem/view/widget/home/custom_app_bar.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  static const String path = '/FavoriteScreen';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
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
            SilverFavoriteGrid(),
          ],
        ),
      ),
    );
  }
}
