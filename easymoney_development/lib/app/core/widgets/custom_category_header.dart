import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/widgets/custom_category_icon.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:flutter/material.dart';

class CustomCategoryHeader extends StatelessWidget {
  final CategoryModel category;

  const CustomCategoryHeader({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          SizedBox(
            width: getWidth / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Browse products in " + category.name + " category.",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          // Icon
          CustomCategoryIcon(
            category: category,
            isSelected: true,
          ),
        ],
      ),
    );
  }
}
