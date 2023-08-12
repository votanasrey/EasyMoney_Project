import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ask_to_verify_kyc.dart';

class AskToVerifyKycPage extends GetView<AskToVerifyKycController> {
  const AskToVerifyKycPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStaticContentPage(
      title: controller.pageTitle,
      description: controller.pageDesc,
      bottom: Column(
        children: [
          CustomButton(
            onTap: () => Get.offAllNamed(Routes.homeRoute),
            name: "Do Later",
            isOutlined: true,
          ),
          const SizedBox(height: 20),
          CustomButton(
            onTap: () => debugPrint("Verify Now clicked"),
            name: "Verify Now",
          ),
        ],
      ),
    );
  }
}
