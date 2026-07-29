import 'package:ecommercesystem/core/constant/app_images.dart';
import 'package:ecommercesystem/data/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoriesVew extends StatelessWidget {
  const CategoriesVew({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 102,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];

          return Padding(
            padding: const EdgeInsets.only(right: 25, left: 4),
            child: Column(
              children: [
                Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(13.5),
                    child: Image.asset(
                      '${AppImages.imagesRoot}/${category.categoryImage}',

                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.category,
                          size: 35,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  category.categoryName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
