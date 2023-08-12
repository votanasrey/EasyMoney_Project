import 'package:get/get.dart';

class ViewImageController extends GetxController {
  late List<String> imageList;
  bool isNetworkImage = true;
  RxInt index = 0.obs;

  @override
  void onInit() {
    super.onInit();
    imageList = Get.arguments['imageList'];
  }
}