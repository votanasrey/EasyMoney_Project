import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ScaffoldWithLoading extends StatelessWidget {
  final Scaffold scaffold;
  final bool isLoading;

  const ScaffoldWithLoading({
    Key? key,
    required this.scaffold,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        scaffold,
        if (isLoading)
          Scaffold(
            backgroundColor: Colors.black.withOpacity(0.6),
            body: SizedBox(
              width: getWidth,
              height: getHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SpinKitFadingCube(
                    color: ColorConstants.greenPrimaryColor,
                    size: 30,
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Uploading . . .",
                    style: TextStyle(
                      color: ColorConstants.greenPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
