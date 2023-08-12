import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/modules/product_detail/product_detail.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBackAppBar(
        title: "Product Detail",
      ),
      body: Container(
        width: getWidth,
        height: getHeight,
        color: ColorConstants.lightGreyColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // images
              Stack(
                children: [
                  SizedBox(
                    height: getWidth,
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //     image: CachedNetworkImageProvider("https://firebasestorage.googleapis.com/v0/b/easy-money-76612.appspot.com/o/11_3.jpg?alt=media&token=ae625b37-e940-4965-805c-dc3d9b3c1b23"),
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    child: controller.product.productImages.isNotEmpty
                        ? PageView.builder(
                            itemCount: controller.product.productImages.length,
                            onPageChanged: (index) =>
                                controller.onImageChange(index),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => Get.toNamed(
                                  Routes.viewImageRoute,
                                  arguments: {
                                    'imageList': controller
                                        .product.productImages
                                        .map((e) => e.path)
                                        .toList(),
                                    'index': controller.imageIndex,
                                    'isNetworkImage': true,
                                  },
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: controller
                                      .product.productImages[index].path,
                                  fit: BoxFit.scaleDown,
                                ),
                              );
                            },
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                "https://www.theiasilver.com/index.php/images/products/16062082195fbccadbcb27c.jpg",
                            fit: BoxFit.cover,
                          ),
                  ),
                  if (controller.product.productImages.length > 1)
                    Positioned(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 29,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorConstants.blackColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Obx(() {
                          return Text(
                            (controller.imageIndex.value + 1).toString() +
                                "/" +
                                controller.product.productImages.length
                                    .toString(),
                            style: const TextStyle(
                              color: ColorConstants.whiteColor,
                              fontSize: 16,
                            ),
                          );
                        }),
                      ),
                      bottom: 30,
                      right: 15,
                    ),
                ],
              ),
              // title and price
              Container(
                color: ColorConstants.whiteColor,
                width: getWidth,
                padding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.product.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "US \$" + controller.product.price.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ColorConstants.greenPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Description
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 27,
                  vertical: 20,
                ),
                color: ColorConstants.whiteColor,
                width: getWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      controller.product.description,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Seller info
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 27,
                  vertical: 20,
                ),
                color: ColorConstants.whiteColor,
                width: getWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Seller Info",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Obx(() {
                          return Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(controller.profileImage.value),
                                fit: BoxFit.cover,
                              ),
                              color: ColorConstants.lightGreyColor,
                            ),
                          );
                        }),
                        Text(
                              controller.product.user.firstName +
                              " " +
                              controller.product.user.lastName +
                              "\n" +
                              controller.product.user.phoneNumber,
                          // "\n Email : " +
                          // controller.sellerModel.email,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 27, vertical: 20),
                child: Text(
                  "Similar products",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: FutureBuilder<List<Product>>(
                  future: controller.futureProducts,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        List<Product> _listProduct = snapshot.data!.toList();
                        _listProduct.removeWhere(
                            (element) => element.id == controller.product.id);
                        _listProduct.shuffle();
                        return CustomListProduct(
                          productList: _listProduct,
                          replace: true,
                        );
                      }
                    }

                    return const SpinKitFadingCube(
                      color: ColorConstants.greenPrimaryColor,
                      size: 30,
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.only(
      //     left: 27,
      //     right: 27,
      //     bottom: 20,
      //     top: 10,
      //   ),
      //   child: CustomButton(
      //     name: "Buy",
      //     onTap: () => debugPrint("Buy clicked"),
      //   ),
      // ),
    );
  }
}
