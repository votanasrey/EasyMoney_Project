import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomPostedProductCard extends StatelessWidget {
  final Widget child;

  const CustomPostedProductCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ColorConstants.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
      child: child,
    );
  }

}