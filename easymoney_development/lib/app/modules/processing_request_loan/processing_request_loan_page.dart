import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'processing_request_loan.dart';

class ProcessingRequestLoanPage extends GetView<ProcessingRequestLoanController> {
  const ProcessingRequestLoanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomStaticContentPage(
      title: controller.pageTitle,
      description: controller.pageDesc,
      bottom: CustomButton(
        onTap: () {
          Get.back();
          controller.controller.pageIndex.value = 0;
        },
        name: "Go Back",
      ),
    );
  }
}
