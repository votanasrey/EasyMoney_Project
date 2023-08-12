import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/data/repositories/product_repo.dart';
import 'package:get/get.dart';

ProductRepo _productRepo = ProductRepo();

class ProductDetailController extends GetxController {
  late Product product;

  RxString profileImage =
      'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'.obs;

  late Future<List<Product>> futureProducts;

  void getProduct() {
    futureProducts = _productRepo.getProducts(
      request: {"category": product.category},
    );
  }

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments;
    if (product.user.userProfile != null) {
      profileImage.value = product.user.userProfile.toString();
    }
    getProduct();
  }

  var imageIndex = 0.obs;

  void onImageChange(int index) {
    imageIndex.value = index;
    update();
  }
}
