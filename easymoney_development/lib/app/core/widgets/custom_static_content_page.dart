import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'custom_page_content.dart';
import 'custom_back_app_bar.dart';

class CustomStaticContentPage extends StatelessWidget {
  final String title;
  final String description;
  final Widget bottom;

  const CustomStaticContentPage({
    Key? key,
    required this.title,
    required this.description,
    required this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBackAppBar(
        elevation: 0,
        color: ColorConstants.lightGreenColor.withOpacity(0.75),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            color: ColorConstants.lightGreenColor.withOpacity(0.75),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: CustomPageContent(
                title: title,
                description: description,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 27,
              vertical: 20,
            ),
            child: bottom,
          ),
        ],
      ),
    );
  }
}
