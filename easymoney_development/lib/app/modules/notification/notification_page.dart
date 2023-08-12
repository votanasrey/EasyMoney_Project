import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notification.dart';
import 'widgets/widgets.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBackAppBar(
        title: "Notifications",
      ),
      body: Container(
        color: ColorConstants.whiteColor,
        child: ListView.builder(
          itemCount: controller.notifyList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.toNamed(Routes.confirmLoanRequestRoute),
              child: NotificationCard(
                item: controller.notifyList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
