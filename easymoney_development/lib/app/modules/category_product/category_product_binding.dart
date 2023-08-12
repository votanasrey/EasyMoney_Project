import 'package:get/get.dart';

import 'category_product.dart';

class CategoryProductBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryProductController>(
      () => CategoryProductController(),
    );
  }
}
