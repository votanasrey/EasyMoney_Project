import 'dart:io';

import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'upload_product.dart';
import 'widgets/widgets.dart';

class UploadProductPage extends GetView<UploadProductController> {
  const UploadProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ScaffoldWithLoading(
        scaffold: Scaffold(
          backgroundColor: ColorConstants.lightGreyColor,
          appBar: customBackAppBar(
            title: "Post Product",
            // elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                PostContainer(
                  title: "Select Category",
                  paddingChild: 0,
                  child: Obx(() {
                    return CustomCategoryList(
                      onTap: (index) {
                        controller.selectedCategory.value = index;
                        // print(controller.selectedCategory.value);
                      },
                      categoryList: controller.categoryList,
                      selectedCategory: controller.selectedCategory.value,
                    );
                  }),
                ),
                PostContainer(
                  title: "Product Detail",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        label: "Title",
                        controller: controller.title,
                        hintText: "Text",
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Price",
                        controller: controller.price,
                        hintText: "Number",
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 15),
                      CustomTextField(
                        label: "Description",
                        controller: controller.description,
                        hintText: "Text",
                        keyboardType: TextInputType.multiline,
                        maxLine: 5,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Images",
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorConstants.greyPramiryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Obx(() {
                        return GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.images.value.length + 1,
                          itemBuilder: (context, index) {
                            if (index == controller.images.value.length) {
                              return GestureDetector(
                                onTap: () => controller.imgFromGallery(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorConstants.lightGreyColor,
                                  ),
                                  child: const Icon(Icons.add, size: 30),
                                ),
                              );
                            }
                            // print(File(controller.images.value[index].path));
                            return Stack(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(
                                        Routes.viewImageRoute,
                                        arguments: {
                                          'imageList': controller.images.value
                                              .map((e) => e.path)
                                              .toList(),
                                          'index': index,
                                          'isNetworkImage': false,
                                        },
                                      ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12.5, right: 12.5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10),
                                        image: DecorationImage(
                                          image: FileImage(
                                            File(controller
                                                .images.value[index].path),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: GestureDetector(
                                    child: Container(
                                      height: 25,
                                      width: 25,
                                      decoration: const BoxDecoration(
                                        color: ColorConstants.lightGreyColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.close),
                                    ),
                                    onTap: () {
                                      controller.deleteImage(
                                          controller.images.value[index]);
                                    },
                                  ),
                                  right: 0,
                                ),
                              ],
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            color: ColorConstants.whiteColor,
            padding: const EdgeInsets.fromLTRB(27, 27, 20, 10),
            child: CustomButton(
              name: "Sell",
              onTap: () => controller.validateCategory(),
            ),
          ),
        ),
        isLoading: controller.isPosting.value,
      );
    });
  }
}
