import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/repositories/product_repo.dart';
import 'package:easy_money/app/modules/marketplace/marketplace.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

ProductRepo _productRepo = ProductRepo();

class UploadProductController extends GetxController {
  RxInt selectedCategory = (-1).obs;

  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController description = TextEditingController();

  late String accessToken;
  late MarketplaceController _marketplaceController;

  @override
  void onInit() {
    accessToken = box.read(BoxKey.accessToken);
    _marketplaceController = Get.arguments;
    super.onInit();
  }

  List<CategoryModel> categoryList = [
    CategoryModel(
      name: "Phones",
      icon: IconConstants.smartphone,
    ),
    CategoryModel(
      name: "Accessories",
      icon: IconConstants.headphones,
    ),
    CategoryModel(
      name: "Cars",
      icon: IconConstants.truck,
    ),
    CategoryModel(
      name: "House",
      icon: IconConstants.home,
    ),
    CategoryModel(
      name: "Lands",
      icon: IconConstants.map,
    ),
  ];
  Rx<List<XFile>> images = Rx<List<XFile>>([]);

  void deleteImage(XFile value) {
    List<XFile> _tmpImage = images.value;
    _tmpImage.remove(value);
    images.update((val) {
      val = _tmpImage;
    });
  }

  void imgFromGallery() async {
    ImagePicker _picker = ImagePicker();
    List<XFile> _pickedImages = [];

    _pickedImages = (await _picker.pickMultiImage())!;
    if (_pickedImages.isNotEmpty) {
      // for store old image list
      List<XFile> _tmpImages = [];
      _tmpImages = images.value;
      images.value = _tmpImages + _pickedImages;
    }
  }

  void validateCategory() {
    if (selectedCategory.value == -1) {
      Get.snackbar(
        "Error",
        "You didn't choose category",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      _validateTitle();
    }
  }

  void _validateTitle() {
    if (title.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Title is required",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      _validatePrice();
    }
  }

  void _validatePrice() {
    if (price.text.trim().isEmpty) {
      Get.snackbar(
        "Error",
        "Price is required",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      _validateDescription();
    }
  }

  void _validateDescription() {
    if (description.text.trim().length < 20) {
      Get.snackbar(
        "Error",
        "We need more detail on your product",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      _validateImage();
    }
  }

  void _validateImage() {
    if (images.value.length < 3) {
      Get.snackbar(
        "Error",
        "We need 3 images or more",
        backgroundColor: ColorConstants.dangerColor,
      );
    } else {
      _uploadProduct();
    }
  }

  RxBool isPosting = false.obs;
  void _uploadProduct() async {
    isPosting.value = true;
    await _productRepo
        .postProduct(
      accessToken,
      title: title.text.trim(),
      price: int.parse(price.text),
      description: description.text,
      category: categoryList[selectedCategory.value].name,
    )
        .then((value) async {
      List<String> listUrl = await _productRepo.handleUploadImage(images.value, value.id);
      _productRepo.postProductImage(accessToken, value.id, paths: listUrl).then((value) {
        Get.back();
        _marketplaceController.readData();
        isPosting.value = false;
      });
    }).catchError((e) {
      isPosting.value = false;
      debugPrint(e.toString());
    });
  }
}
