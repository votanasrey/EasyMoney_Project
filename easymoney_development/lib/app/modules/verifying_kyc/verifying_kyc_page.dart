import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verifying_kyc.dart';

class VerifyingKycPage extends GetView<VerifyingKycController> {
  const VerifyingKycPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStaticContentPage(
      title: controller.pageTitle,
      description: controller.pageDesc,
      bottom: CustomButton(
        onTap: () => Get.back(),
        name: "Go Back",
      ),
    );
  }
}
