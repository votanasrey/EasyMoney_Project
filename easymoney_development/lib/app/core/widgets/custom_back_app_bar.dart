import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

customBackAppBar({
  String title = "",
  double elevation = 4.0,
  Color color = ColorConstants.whiteColor,
}) {
  return AppBar(
    title: Container(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: ColorConstants.blackColor,
          fontSize: 18.0,
        ),
      ),
    ),
    backgroundColor: color,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(
        Icons.navigate_before,
        size: 30,
        color: ColorConstants.blackColor,
      ),
    ),
    elevation: elevation,
  );
}
