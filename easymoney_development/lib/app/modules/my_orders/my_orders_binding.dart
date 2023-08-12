import 'my_orders.dart';
import 'package:get/get.dart';

class MyOrdersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyOrdersController>(() => MyOrdersController());
  }

}