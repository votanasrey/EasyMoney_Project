import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'category_product.dart';

class CategoryProductPage extends GetView<CategoryProductController> {
  const CategoryProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBackAppBar(
        title: "Browse Product",
      ),
      backgroundColor: ColorConstants.lightGreyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            const SizedBox(height: 20),
            CustomCategoryHeader(
              category: controller.category,
            ),
            const SizedBox(height: 20),
            // Product
            // CustomListProduct
          FutureBuilder<List<Product>>(
            future: controller.futureProducts,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<Product> _listProduct = snapshot.data!.toList();
                  _listProduct.shuffle();
                  return _listProduct.isNotEmpty
                      ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 27),
                    child: CustomListProduct(
                      productList: _listProduct,
                    ),
                  )
                      : const Center(
                    child: Text("Nothing in category"),
                  );
                }
              }

              return const SpinKitFadingCube(
                color: ColorConstants.greenPrimaryColor,
                size: 30,
              );
            },
          ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
