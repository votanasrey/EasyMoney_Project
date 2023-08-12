import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchBar extends StatelessWidget {
  final List<Product> productList;
  final List<CategoryModel> categoryList;
  final int categoryIndex;
  final Widget filter;

  const CustomSearchBar({
    Key? key,
    required this.productList,
    required this.categoryList,
    required this.categoryIndex,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: ColorConstants.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 27),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => Get.toNamed(
                Routes.searchProductRoute,
                arguments: {
                  'productList': productList,
                  'categoryList': categoryList,
                  'categoryIndex': categoryIndex,
                },
              ),
              child: Container(
                height: 45,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: ColorConstants.lightGreyColor,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: ColorConstants.greenPrimaryColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Find something you want",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          filter,
        ],
      ),
    );
  }
}
