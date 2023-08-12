import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel item;

  const NotificationCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: !item.wasRead
          ? ColorConstants.lightGreenColor.withOpacity(0.5)
          : ColorConstants.whiteColor,
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 27,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.only(top: 8),
            child: SvgPicture.asset(
              IconConstants.checkCircle,
            ),
            decoration: BoxDecoration(
              color: ColorConstants.greenPrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 20),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
