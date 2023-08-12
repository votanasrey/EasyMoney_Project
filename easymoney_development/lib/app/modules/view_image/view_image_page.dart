import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view_image.dart';

class ViewImagePage extends GetView<ViewImageController> {
  const ViewImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.blackColor,
        leading: IconButton(
          onPressed: () => Get.back(
            closeOverlays: true,
          ),
          icon: const Icon(
            Icons.close,
            color: ColorConstants.whiteColor,
          ),
        ),
        title: Center(
          child: Obx(() {
            return Text(
              (controller.index.value + 1).toString() +
                  "/" +
                  controller.imageList.length.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
              ),
            );
          }),
        ),
        actions: const [
          SizedBox(
            width: 50,
          ),
        ],
      ),
      body: PageView.builder(
        controller: PageController(initialPage: controller.index.value),
        itemCount: controller.imageList.length,
        onPageChanged: (index) {
          controller.index.value = index;
        },
        itemBuilder: (context, index) {
          return Container(
            color: ColorConstants.blackColor,
            child: controller.isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: controller.imageList[index],
                    fit: BoxFit.contain,
                  )
                : Image.file(
                    File(controller.imageList[index]),
                    fit: BoxFit.contain,
                  ),
          );
        },
      ),
    );
  }
}
