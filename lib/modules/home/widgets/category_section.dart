import 'package:codeedex/core/theme/app_colors.dart' show AppColors;
import 'package:codeedex/models/category_model.dart';
import 'package:codeedex/modules/home/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesSection extends StatelessWidget {
  final List<CategoryModel> categories;
  const CategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 🔸 Title + arrows
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
            Row(
              children: [
                Icon(Icons.chevron_left, color: AppColors.primary),
                Icon(Icons.chevron_right, color: AppColors.primary),
              ],
            ),
          ],
        ),

        const SizedBox(height: 12),

        // 🔸 Horizontal list
        SizedBox(
          height: 120,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategoryItem(image: category.image, title: category.name);
            },
          ),
        ),
      ],
    );
  }
}
