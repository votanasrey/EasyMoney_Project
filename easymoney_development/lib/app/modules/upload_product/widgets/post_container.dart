import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class PostContainer extends StatelessWidget {
  final String title;
  final Widget child;
  final double paddingChild;

  const PostContainer({
    Key? key,
    required this.title,
    required this.child,
    this.paddingChild = 27,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 27),
      margin: const EdgeInsets.only(bottom: 15),
      color: ColorConstants.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingChild),
            child: child,
          ),
        ],
      ),
    );
  }
}
