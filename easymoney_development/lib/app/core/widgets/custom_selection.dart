import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSelection extends StatelessWidget {
  final String label;
  final List<String> selectionList;
  final int selected;
  final Function(int) onChanged;

  const CustomSelection({
    Key? key,
    required this.label,
    required this.selectionList,
    required this.selected,
    required this.onChanged,
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
                      scrollController: FixedExtentScrollController(initialItem: selected),
                      children: selectionList
                          .map((e) => Center(child: Text(e)))
                          .toList(),
                    ),
                  ),
                ],
              ),
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
                  selectionList[selected],
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
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
