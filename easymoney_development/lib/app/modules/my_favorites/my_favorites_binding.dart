import 'my_favorites.dart';
import 'package:get/get.dart';

class MyFavoritesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyFavoritesController>(() => MyFavoritesController());
  }

}