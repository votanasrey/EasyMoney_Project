import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;
  final String title;
  final String? subTitle;

  const MenuListTile({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: ColorConstants.greenPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: ColorConstants.whiteColor,
          ),
        ),
        subtitle: subTitle != null ? Text(subTitle!) : null,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        // trailing: Icon(Icons.navigate_next),
      ),
    );
  }
}
