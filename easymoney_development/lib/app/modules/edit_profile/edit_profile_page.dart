import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/widgets/custom_back_app_bar.dart';
import 'package:easy_money/app/core/widgets/custom_text_field.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends GetView<EditProfileController> {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBackAppBar(
        title: 'Edit your profile',
        // elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorConstants.whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //profile image
              InkWell(
                onTap: () => _buildOptionSelection,
                child: Stack(
                  children: [
                    Obx(() {
                      return Container(
                        width: getWidth / 3.45,
                        height: getWidth / 3.45,
                        decoration: BoxDecoration(
                          color: ColorConstants.lightGreyColor,
                          borderRadius: BorderRadius.circular(getWidth / 14),
                          image: controller.selectedImagePath.value != ''
                              ? DecorationImage(
                                  image: FileImage(
                                      File(controller.selectedImagePath.value)),
                                  fit: BoxFit.cover,
                                )
                              : DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      controller.profileImage.value),
                                  fit: BoxFit.cover,
                                ),
                        ),
                      );
                    }),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorConstants.greenPrimaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          FeatherIcons.camera,
                          color: ColorConstants.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              //First name and last name
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: "First Name",
                      controller: controller.firstName,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextField(
                      label: "Last Name",
                      controller: controller.lastName,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //Gender
              Obx(() {
                return CustomSelection(
                  onChanged: (value) {
                    controller.genderSelected.value = value;
                  },
                  selectionList: controller.genderList,
                  selected: controller.genderSelected.value,
                  label: 'Gender',
                );
              }),
              const SizedBox(height: 20),
              //Date of Birth
              Obx(() {
                return CustomDatePicker(
                  onChanged: (value) {
                    controller.dateOfBirth.value = value;
                  },
                  initTime: controller.dateOfBirth.value,
                  label: 'Date Of Birth',
                );
              }),
              const SizedBox(height: 20),
              //Address
              CustomTextField(
                label: "Address",
                controller: controller.address,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 36),
              CustomButton(
                name: "Save Change",
                onTap: () => controller.updateUser(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Bottom Sheet Options for Upload Image
  get _buildOptionSelection {
    return Get.bottomSheet(
      Obx(() {
        return Container(
            height: controller.selectedImagePath.value == '' ? 200 : 260,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
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
                      if (controller.selectedImagePath.value != '')
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
            ));
      }),
      // barrierColor: Colors.red[50],
      isDismissible: true,
      enableDrag: true,
    );
  }
}
