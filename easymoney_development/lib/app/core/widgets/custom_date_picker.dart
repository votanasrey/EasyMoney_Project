import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final String label;
  final DateTime initTime;
  final Function(DateTime) onChanged;

  const CustomDatePicker({
    Key? key,
    required this.label,
    required this.onChanged,
    required this.initTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> _months = [
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
        GestureDetector(
          onTap: () => showCupertinoModalPopup(
            context: context,
            builder: (_) => Container(
              height: 250,
              decoration: const BoxDecoration(
                color: ColorConstants.whiteColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 5),
                    width: 50,
                    height: 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: ColorConstants.greyPramiryColor,
                    ),
                  ),
                  Expanded(
                    child: CupertinoDatePicker(
                      initialDateTime: initTime,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: onChanged,
                    ),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 17),
            ),
          ),
          child: Container(
            height: 55,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (_months[initTime.month - 1] +
                      " " +
                      initTime.day.toString() +
                      " " +
                      initTime.year.toString()),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Icon(
                  Icons.calendar_today_outlined,
                  color: ColorConstants.greyPramiryColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
