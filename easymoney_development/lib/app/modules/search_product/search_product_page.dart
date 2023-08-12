import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'search_product.dart';

class SearchProductPage extends GetView<SearchProductController> {
  const SearchProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorConstants.lightGreyColor,
        appBar: AppBar(
          backgroundColor: ColorConstants.whiteColor,
          // elevation: 0,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.navigate_before,
              color: ColorConstants.blackColor,
              size: 30,
            ),
          ),
          title: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: ColorConstants.lightGreyColor,
              borderRadius: BorderRadius.circular(7),
            ),
            child: TextField(
              textInputAction: TextInputAction.search,
              cursorColor: ColorConstants.blackColor,
              autofocus: true,
              controller: controller.searchCtr,
              decoration: const InputDecoration(
                hintText: "Find something you want",
                border: InputBorder.none,
              ),
              onSubmitted: (cc) => controller.onSubmitted(cc),
              onTap: () {
                if (!controller.isSearching.value) {
                  controller.isSearching.value = true;
                }
                debugPrint("hello");
              },
            ),
          ),
          actions: [
            if (!controller.isSearching.value)
              CustomFilterSelection(
                sortList: controller.sortList,
                selected: controller.indexOfSort.value,
                onChanged: (number) => controller.onSortChanged(number),
              ),
            if (!controller.isSearching.value) const SizedBox(width: 15),
          ],
        ),
        body: SingleChildScrollView(
          controller: controller.scrollController,
          child: controller.isSearching.value
              ? const SizedBox()
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      color: ColorConstants.whiteColor,
                      child: CustomCategoryList(
                        categoryList: controller.categoryList,
                        onTap: (index) => controller.onCategoryTap(index),
                        selectedCategory: controller.index.value,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(27, 30, 27, 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.searchList.value.isEmpty)
                            Obx(() {
                              controller.delayLoading();
                              return Center(
                                child: !controller.isLoading.value
                                    ? const Text("We have found nothing.")
                                    : const SpinKitFadingCube(
                                  color: ColorConstants.greenPrimaryColor,
                                  size: 30,
                                ),
                              );
                            }),
                          if (controller.searchList.value.isNotEmpty)
                            Text(
                              "We found " +
                                  controller.searchList.value.length
                                      .toString() +
                                  " product" +
                                  (controller.searchList.value.length > 1
                                      ? "s"
                                      : ""),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          const SizedBox(height: 20),
                          if (controller.searchList.value.isNotEmpty)
                            CustomListProduct(
                              productList: controller.searchList.value,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
        floatingActionButton: controller.isScrolled.value
            ? FloatingActionButton(
                onPressed: () => controller.onTapToTop(),
                backgroundColor: ColorConstants.greenPrimaryColor,
                child: const Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 30,
                ),
              )
            : const SizedBox(),
      );
    });
  }
}
