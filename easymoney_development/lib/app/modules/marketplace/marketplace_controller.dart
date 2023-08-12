import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/data/repositories/product_repo.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

ProductRepo _productRepo = ProductRepo();

class MarketplaceController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxBool isScrolled = false.obs;
  Rx<Future<List<Product>>> futureProducts = Rx(_productRepo.getProducts());

  void scrollHandle() {
    if (scrollController.position.pixels > 300) {
      isScrolled.value = true;
      // print("hello");
    } else {
      // print("hi");
      isScrolled.value = false;
    }
  }

  void onTapToTop() {
    scrollController.animateTo(
      0,
      duration: DurationConstants.duration600ms,
      curve: Curves.ease,
    );
  }

  bool isLogged = false;
  void updateLogged() {
    var data = box.read(BoxKey.isLogged);
    if (data != null) {
      isLogged = box.read(BoxKey.isLogged);
    }
  }

  Rx<List<Product>> productList = Rx<List<Product>>([]);

  void readData() {
    futureProducts.value = _productRepo.getProducts(
      request: {
        "limit": 100
      }
    );
  }

  void onTapSell(MarketplaceController marketplaceController){
    updateLogged();
    if (isLogged) {
      Get.toNamed(Routes.uploadProductRoute, arguments: marketplaceController);
    } else {
      Get.offAllNamed(Routes.signInRoute);
    }
  }

  @override
  void onInit() {
    readData();
    scrollController.addListener(scrollHandle);
    super.onInit();
  }

  List<CategoryModel> categoryList = [
    CategoryModel(
      name: "Phones",
      icon: IconConstants.smartphone,
    ),
    CategoryModel(
      name: "Accessories",
      icon: IconConstants.headphones,
    ),
    CategoryModel(
      name: "Cars",
      icon: IconConstants.truck,
    ),
    CategoryModel(
      name: "House",
      icon: IconConstants.home,
    ),
    CategoryModel(
      name: "Lands",
      icon: IconConstants.map,
    ),
  ];
}
