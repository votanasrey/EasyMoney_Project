import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLine;
  final Widget? suffix;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.label,
    this.hintText = "",
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLine = 1,
    this.suffix,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            color: ColorConstants.greyPramiryColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: ColorConstants.greyPramiryColor,
            ),
            borderRadius: BorderRadius.circular(12.0),
            color: ColorConstants.whiteColor,
          ),
          child: TextField(
            autocorrect: false,
            keyboardType: keyboardType,
            cursorColor: ColorConstants.blackColor,
            controller: controller,
            style: const TextStyle(
              fontSize: 18.0,
            ),
            obscureText: obscureText,
            maxLines: maxLine,
            decoration: InputDecoration(
              border: InputBorder.none,
              suffix: suffix,
              hintText: hintText,
              helperStyle: const TextStyle(
                fontSize: 18.0,
                color: ColorConstants.greyPramiryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
