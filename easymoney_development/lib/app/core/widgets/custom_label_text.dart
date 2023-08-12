import 'package:flutter/material.dart';

class CustomLabelText extends StatelessWidget {
  final String title;
  final String description;

  const CustomLabelText({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
