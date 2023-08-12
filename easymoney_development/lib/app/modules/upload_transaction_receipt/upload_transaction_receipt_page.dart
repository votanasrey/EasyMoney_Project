import 'dart:io';

import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/custom_back_app_bar.dart';
import 'package:easy_money/app/core/widgets/custom_button.dart';
import 'package:easy_money/app/core/widgets/custom_page_content.dart';
import 'package:easy_money/app/modules/upload_transaction_receipt/upload_transaction_receipt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadTransactionReceiptPage extends GetView<UploadTransactionReceiptController> {
  const UploadTransactionReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBackAppBar(
        title: "Upload Transaction Receipt",
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Upload Text Title
            const CustomPageContent(
              title: "Upload",
              description: "your loan paid payment transaction here.",
            ),
            const SizedBox(height: 30,),
            //Image Upload area
            Expanded(
              child: GestureDetector(
                  onTap: () => _buildOptionSelection,
                  child: Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstants.lightGreyColor,
                        image: DecorationImage(
                          image: FileImage(
                              File(controller.selectedImagePath.value)),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: controller.selectedImagePath.value == ""? const Icon(
                          FeatherIcons.image,
                          size: 40,
                        ):null,
                      ),
                    );
                  })),
            ),
            const SizedBox(height: 30,),
            CustomButton(name: "Submit", onTap: () => debugPrint("Submit Button clicked!"))
          ],
        ),
      ),
    );
  }
  //Bottom Sheet Options for Upload Image
  get _buildOptionSelection {
    return Get.bottomSheet(
      Container(
          height: 260,
          decoration: const BoxDecoration(
            color: ColorConstants.whiteColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Slide bar indicator
              Container(
                margin: const EdgeInsets.only(top: 5),
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: ColorConstants.greyPramiryColor,
                ),
              ),
              //Option List
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Open Camera Option
                    GestureDetector(
                      onTap: () => controller.getImage(ImageSource.camera),
                      child: Row(
                        children: [
                          //Option Icon
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: ColorConstants.lightGreyColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(FeatherIcons.camera),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Open Camera",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Select From Gallery
                    GestureDetector(
                      onTap: () => controller.getImage(ImageSource.gallery),
                      child: Row(
                        children: [
                          //Option Icon
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: ColorConstants.lightGreyColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(FeatherIcons.image),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Select Image From Gallery",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Delete Selected Image
                    GestureDetector(
                      onTap: () => controller.removeImage(),
                      child: Row(
                        children: [
                          //Option Icon
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: ColorConstants.lightGreyColor,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(FeatherIcons.trash),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Remove Selected Image",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      // barrierColor: Colors.red[50],
      isDismissible: true,
      enableDrag: true,
    );
  }
}
