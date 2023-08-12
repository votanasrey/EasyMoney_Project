import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final bool isOutlined;
  final Function() onTap;

  const CustomButton({
    Key? key,
    required this.name,
    this.isOutlined = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: ColorConstants.greenPrimaryColor),
          borderRadius: BorderRadius.circular(12.0),
          color: isOutlined? ColorConstants.whiteColor: ColorConstants.greenPrimaryColor,
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 18.0,
            color: isOutlined? ColorConstants.greenPrimaryColor: ColorConstants.whiteColor ,
          ),
        ),
      ),
    );
  }
}
