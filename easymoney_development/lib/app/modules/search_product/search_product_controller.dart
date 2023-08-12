import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/data/repositories/product_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

ProductRepo _productRepo = ProductRepo();

class SearchProductController extends GetxController {
  final TextEditingController searchCtr = TextEditingController();
  Rx<List<Product>> searchList = Rx<List<Product>>([]);
  List<Product> _listProduct = [];

  RxBool isLoading = true.obs;

  void delayLoading() async {
    await Future.delayed(DurationConstants.duration4s).then((value) {
      isLoading.value = false;
    });
  }

  void onSubmitted(String str) {
    if (str.trim().isNotEmpty) {
      isSearching.value = false;
      _productRepo.getProducts(
        request: {
          "search": str,
        },
      ).then((value) {
        _listProduct = value;
        searchList.value = value;
      }).catchError((e) {
        debugPrint(e.toString());
      });
    }
  }

  RxInt index = (-1).obs;
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

  void onCategoryTap(int num) {
    if (num != index.value) {
      index.value = num;
      searchList.value = _listProduct
          .where((element) => element.category.contains(
                categoryList[num].name,
              ))
          .toList();
    } else {
      index.value = -1;
      searchList.value = _listProduct;
    }
  }

  final ScrollController scrollController = ScrollController();
  RxBool isScrolled = false.obs;

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

  final List<String> sortList = [
    'Low to high prices',
    'High to low prices',
    'Alphabet',
  ];
  RxInt indexOfSort = 0.obs;

  void onSortChanged(int num) {
    indexOfSort.value = num;
  }

  RxBool isSearching = true.obs;

  @override
  void onInit() {
    scrollController.addListener(scrollHandle);
    super.onInit();
  }
}
