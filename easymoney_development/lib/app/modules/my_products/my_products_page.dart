import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/cutom_posted_product_card.dart';
import 'package:easy_money/app/core/widgets/posted_product_list_tile.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'my_products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyProductPage extends GetView<MyProductsController> {
  const MyProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.lightGreyColor,
      appBar: customBackAppBar(
        title: 'Posted Products',
        // elevation: 0,
      ),
      body: Obx(() {
        return FutureBuilder<List<Product>>(
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
                controller.listProduct.value = snapshot.data!.toList();
                return SingleChildScrollView(
                  child: Obx(() {
                    return Column(
                      children: controller.listProduct.value.map((e) {
                        return Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: CustomPostedProductCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => Get.toNamed(Routes.productDetailRoute, arguments: e),
                                  child: PostedProductListTile(
                                    onTap: () {
                                      _buildOptionSelection(e);
                                    },
                                    dateTime: e.createdAt,
                                    productImage: e.productImages.first.path,
                                    productName: e.title,
                                    price: int.parse(e.price),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                );
              }
            }

            return const SpinKitFadingCube(
              color: ColorConstants.greenPrimaryColor,
              size: 30,
            );
          },
        );
      }),
    );
  }

  _buildOptionSelection(Product product) {
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
                padding:
                const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //edit product info option
                    GestureDetector(
                      onTap: () {
                        debugPrint("Edit Product Option clicked");
                      },
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
                              child: Icon(FeatherIcons.edit3),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Edit Product Details",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Mark as Sold product option
                    GestureDetector(
                      onTap: () {},
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
                              child: Icon(FeatherIcons.dollarSign),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Mark As Sold Product",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    //Delete product Option
                    GestureDetector(
                      onTap: () => controller.deleteImage(product),
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
                            "Delete Product",
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
