import 'my_products.dart';
import 'package:get/get.dart';

class MyProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyProductsController>(() => MyProductsController());
  }

}