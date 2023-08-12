import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'verifying_transaction.dart';

class VerifyingTransactionPage extends GetView<VerifyingTransactionController> {
  const VerifyingTransactionPage({Key? key}) : super(key: key);

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
