import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListProduct extends StatelessWidget {
  final List<Product> productList;
  final bool replace;

  const CustomListProduct({
    Key? key,
    required this.productList,
    this.replace = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 3 / 4.5,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      children: productList
          .map(
            (e) => InkWell(
              onTap: () {
                if (replace) {
                  Get.back();
                  Future.delayed(DurationConstants.duration400ms).then((value) {
                    Get.toNamed(Routes.productDetailRoute, arguments: e);
                  });
                  // Get.offAndToNamed(Routes.productDetailRoute, arguments: e);
                } else {
                  Get.toNamed(Routes.productDetailRoute, arguments: e);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ColorConstants.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(e
                                  .productImages.isNotEmpty
                              ? e.productImages.first.path
                              : "https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              e.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "US \$" + e.price.toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
