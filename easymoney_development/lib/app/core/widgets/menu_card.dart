import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onTap;

  const MenuCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: getWidth / 4.87,
            width: getWidth / 4.87,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(getWidth / 20.7),
              boxShadow: [
                BoxShadow(
                  color: ColorConstants.blackColor.withOpacity(0.25),
                  blurRadius: 6,
                  offset: const Offset(2, 4),
                )
              ],
            ),
            child: Icon(icon, size: getWidth / 10.35, color: ColorConstants.greenPrimaryColor,),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
