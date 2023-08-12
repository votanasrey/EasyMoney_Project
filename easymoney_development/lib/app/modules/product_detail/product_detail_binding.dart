import 'package:get/get.dart';
import 'product_detail.dart';

class ProductDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailController>(
      () => ProductDetailController(),
    );
  }
}
