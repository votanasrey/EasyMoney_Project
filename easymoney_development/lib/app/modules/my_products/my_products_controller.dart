import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/data/repositories/product_repo.dart';
import 'package:get/get.dart';

ProductRepo _productRepo = ProductRepo();
class MyProductsController extends GetxController {
  Rx<Future<List<Product>>> futureProducts = Rx(_productRepo.getProducts(getMyProduct: true));
  Rx<List<Product>> listProduct = Rx<List<Product>>([]);

  void getMyProduct() {
    futureProducts.value = _productRepo.getProducts(getMyProduct: true);
  }

  void deleteImage(Product product) async {
    _productRepo.deleteProduct(product.id).then((value) {
      getMyProduct();
    });
    _productRepo.handleDeleteImage(
      product.productImages.map((e) => e.path).toList()
    );
    Get.back();
  }

  @override
  void onInit() {
    getMyProduct();
    super.onInit();
  }
}
