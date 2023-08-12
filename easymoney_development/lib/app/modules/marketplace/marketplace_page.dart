import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'marketplace.dart';

class MarketplacePage extends GetView<MarketplaceController> {
  const MarketplacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: ColorConstants.lightGreyColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: ColorConstants.blackColor),
          // elevation: 0,
          backgroundColor: ColorConstants.whiteColor,
          title: const Text(
            "Marketplace",
            style: TextStyle(
              color: ColorConstants.blackColor,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.toNamed(Routes.searchProductRoute),
              child: SizedBox(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  IconConstants.search,
                ),
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.readData();
          },
          child: SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: ColorConstants.whiteColor,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 27),
                        child: const Text(
                          "Browse products by category",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.only(bottom: 20),
                        height: 105,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: controller.categoryList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                right: index ==
                                    (controller.categoryList.length - 1)
                                    ? 27
                                    : 10,
                                left: index == 0 ? 27 : 0,
                              ),
                              child: GestureDetector(
                                onTap: () =>
                                    Get.toNamed(
                                      Routes.categoryProductRoute,
                                      arguments: controller.categoryList[index],
                                    ),
                                child: CustomCategoryIcon(
                                  category: controller.categoryList[index],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 27),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Divider(),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Sell product",
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              name: "Sell Now",
                              onTap: () => controller.onTapSell(controller),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 27, bottom: 20, top: 20),
                  child: Text(
                    "Recently Added Products",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: FutureBuilder<List<Product>>(
                    future: controller.futureProducts.value,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return const Center(child: Text("No Items"));
                          }
                          controller.productList.value =
                              snapshot.data!.toList();
                          return Obx(() {
                            return CustomListProduct(
                                productList: controller.productList.value);
                          });
                        }
                      }

                      return const SpinKitFadingCube(
                        color: ColorConstants.greenPrimaryColor,
                        size: 30,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(() {
          if (!controller.isScrolled.value) {
            return const SizedBox();
          }
          return FloatingActionButton(
            onPressed: () => controller.onTapToTop(),
            backgroundColor: ColorConstants.greenPrimaryColor,
            child: const Icon(
              Icons.keyboard_arrow_up_outlined,
              size: 30,
            ),
          );
        }),
      );
    });
  }
}
