import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCategoryIcon extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;

  const CustomCategoryIcon({
    Key? key,
    required this.category,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 65,
          width: 65,
          alignment: Alignment.center,
          child: SvgPicture.asset(category.icon),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isSelected
                ? ColorConstants.lightGreenColor
                : ColorConstants.lightGreyColor,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          category.name,
          style: const TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
