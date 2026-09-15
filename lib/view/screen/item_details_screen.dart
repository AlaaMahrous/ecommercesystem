import 'package:ecommercesystem/core/constant/app_colours.dart';
import 'package:ecommercesystem/data/model/item_model.dart';
import 'package:ecommercesystem/view/widget/product_details/custombottom_navigation_bar.dart';
import 'package:ecommercesystem/view/widget/product_details/item_image_custom.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatelessWidget {
  const ItemDetailsScreen({super.key, required this.item});

  static const String path = '/ItemDetailsScreen';

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.white,
      bottomNavigationBar: const CustombottomNavigationBar(),
      body: ListView(
        children: [
          ItemImageCustom(item: item),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                spacing: 22,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.itemName,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: AppColours.pPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add, color: AppColours.white),
                        ),
                      ),
                      const Text(
                        '1',
                        style: TextStyle(
                          fontSize: 23,
                          color: AppColours.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColours.pPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.remove,
                            color: AppColours.white,
                          ),
                        ),
                      ),
                      Text(
                        '${item.itemPrice.ceil().toString()} \$',
                        style: const TextStyle(
                          fontSize: 23,
                          color: AppColours.pPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    item.itemDesc,
                    style: const TextStyle(
                      fontSize: 19,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Color',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: List.generate(3, (index) {
                      final colors = ['Red', 'Blue', 'Green'];

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColours.pPurple),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              colors[index],
                              style: const TextStyle(
                                color: AppColours.pPurple,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
