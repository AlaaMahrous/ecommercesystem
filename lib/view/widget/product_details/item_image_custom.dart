import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/constant/app_images.dart';
import 'package:ecommercesystem/data/model/item_model.dart';
import 'package:flutter/material.dart';

class ItemImageCustom extends StatelessWidget {
  const ItemImageCustom({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Purple Background
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColours.pPurple,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
          ),

          // Product Image
          Positioned(
            bottom: -10,
            left: 0,
            right: 0,
            child: Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Hero(
                  tag: item.itemId,
                  child: Image.asset(
                    '${AppImages.imagesRoot}/${item.itemImage}',
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
