import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:easy_money/app/data/repositories/product_repo.dart';
import 'package:get/get.dart';

ProductRepo _productRepo = ProductRepo();

class CategoryProductController extends GetxController {
  late CategoryModel category;

  late Future<List<Product>> futureProducts;

  void getProduct() {
    futureProducts = _productRepo.getProducts(
      request: {"category": category.name},
    );
  }

  @override
  void onInit() {
    category = Get.arguments;
    getProduct();
    super.onInit();
  }
}
