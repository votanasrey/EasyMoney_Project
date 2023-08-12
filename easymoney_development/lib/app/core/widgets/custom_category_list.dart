import 'package:easy_money/app/data/data.dart';
import 'package:flutter/material.dart';

import 'custom_category_icon.dart';

class CustomCategoryList extends StatelessWidget {
  final List<CategoryModel> categoryList;
  final Function(int) onTap;
  final int selectedCategory;

  const CustomCategoryList({
    Key? key,
    required this.categoryList,
    required this.onTap,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              right: index == (categoryList.length - 1) ? 27 : 10,
              left: index == 0 ? 27 : 0,
            ),
            child: GestureDetector(
              onTap: () => onTap(index),
              child: CustomCategoryIcon(
                category: categoryList[index],
                isSelected: index == selectedCategory,
              )
            ),
          );
        },
      ),
    );
  }
}
