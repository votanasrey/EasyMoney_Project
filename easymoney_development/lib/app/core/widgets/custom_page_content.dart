import 'package:flutter/material.dart';

class CustomPageContent extends StatelessWidget {
  final String title;
  final String description;

  const CustomPageContent({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          title,
          style: const TextStyle(
            fontSize: 42.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          description,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
