import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class LoanListTile extends StatelessWidget {
  final String? title;
  final DateTime? dateTime;
  final int? price;
  final bool isGreyColor;

  List<String> get _months => [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  const LoanListTile({
    Key? key,
    this.title,
    this.dateTime,
    this.price,
    this.isGreyColor = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) Text(
              title!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ColorConstants.greyPramiryColor,
              ),
            ),
            if (dateTime != null) Text(
              dateTime!.day.toString() +
                  " " +
                  _months[
                  dateTime!.month] +
                  " " +
                  dateTime!.year
                      .toString(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
        if (price != null) Text(
          "\$" + price!.toString(),
          style: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.bold,
            color: isGreyColor? ColorConstants.greyPramiryColor: ColorConstants.greenPrimaryColor,
          ),
        ),
      ],
    );
  }
}
