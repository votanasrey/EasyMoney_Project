import 'package:get/get.dart';

import 'search_product.dart';

class SearchProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchProductController>(
      () => SearchProductController(),
    );
  }
}
