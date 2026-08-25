import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/core/constant/app_images.dart';
import 'package:ecommercesystem/data/model/item_model.dart';
import 'package:flutter/material.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key, required this.items});

  final List<ItemModel> items;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            final double newPrice =
                item.itemPrice - (item.itemPrice * item.itemDiscount / 100);

            return Container(
              width: 160,
              margin: const EdgeInsets.only(right: 13, left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            height: 120,
                            width: double.infinity,
                            color: Colors.grey.shade100,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  '${AppImages.imagesRoot}/${item.itemImage}',
                                  fit: BoxFit.contain,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.image,
                                      size: 40,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),

                        if (item.itemDiscount > 0)
                          Positioned(
                            top: 8,
                            left: 6,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "-${item.itemDiscount}%",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),

                    const SizedBox(height: 11),

                    Text(
                      item.itemName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        if (item.itemDiscount > 0)
                          Text(
                            "${item.itemPrice} \$",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),

                        const SizedBox(width: 5),

                        Text(
                          "${newPrice.toStringAsFixed(0)} \$",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColours.pPurple,
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
