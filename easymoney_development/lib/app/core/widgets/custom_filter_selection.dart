import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomFilterSelection extends StatelessWidget {
  final List<String> sortList;
  final int selected;
  final Function(int) onChanged;

  const CustomFilterSelection({
    Key? key,
    required this.sortList,
    required this.selected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SvgPicture.asset(
        IconConstants.filter,
        color: ColorConstants.greenPrimaryColor,
        height: 25,
      ),
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
          padding: const EdgeInsets.symmetric(horizontal: 17),
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
                child: CupertinoPicker(
                  onSelectedItemChanged: onChanged,
                  itemExtent: 50,
                  scrollController:
                      FixedExtentScrollController(initialItem: selected),
                  children: sortList
                      .map((e) => Center(child: Text(e)))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
