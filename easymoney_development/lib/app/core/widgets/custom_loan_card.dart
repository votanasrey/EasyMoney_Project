import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomLoanCard extends StatelessWidget {
  final Widget child;

  const CustomLoanCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorConstants.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: ColorConstants.greyPramiryColor,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
