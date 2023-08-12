import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextCard extends StatelessWidget {
  final String title;
  final String description;

  const CustomTextCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: ColorConstants.blackColor.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(2, 4),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Text(
              description,
              style: const TextStyle(fontSize: 14, color: ColorConstants.greyPramiryColor,)),
        ],
      ),
    );
  }
}
