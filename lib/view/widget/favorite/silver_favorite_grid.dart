import 'package:ecommercesystem/controller/favorite_controller.dart';
import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/constant/app_images.dart';
import 'package:ecommercesystem/core/functions/translate_database.dart';
import 'package:ecommercesystem/view/screen/item_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SilverFavoriteGrid extends StatelessWidget {
  const SilverFavoriteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteControllerImpl>(
      init: FavoriteControllerImpl(),
      builder: (controller) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = controller.itemsList[index];

              return InkWell(
                onTap: () {
                  context.push(ItemDetailsScreen.path, extra: item);
                },
                borderRadius: BorderRadius.circular(16),
                child: Hero(
                  tag: item.itemId,
                  child: Card(
                    color: AppColours.white,
                    elevation: 3,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ================= IMAGE =================
                        Expanded(
                          flex: 5,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            child: Container(
                              width: double.infinity,
                              color: Colors.grey.shade100,
                              child: Image.asset(
                                '${AppImages.imagesRoot}/${item.itemImage}',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons.image_outlined,
                                      size: 45,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        // ================= PRODUCT INFO =================
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ================= NAME =================
                                Text(
                                  translateDatabase(
                                    item.itemNameAr,
                                    item.itemName,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                // ================= DESCRIPTION =================
                                Expanded(
                                  child: Text(
                                    item.itemDesc,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 5),

                                // ================= PRICE =================
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '\$${item.itemPrice.toStringAsFixed(2)}',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: AppColours.pPurple,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        if (item.isFavorite) {
                                          // remove.php
                                        } else {
                                          // add.php
                                        }
                                      },
                                      padding: const EdgeInsets.all(8),
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: AppColours.pPurple,
                                        size: 21,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },

            // هنا بدل 10
            childCount: controller.itemsList.length,
          ),

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.68,
          ),
        );
      },
    );
  }
}
