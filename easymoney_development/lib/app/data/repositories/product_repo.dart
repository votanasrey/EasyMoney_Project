import 'package:easy_money/app/core/constants/api_constants.dart';
import 'package:easy_money/app/core/constants/storage_contants.dart';
import 'package:easy_money/app/data/models/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

String _url = baseUri + 'api/products';

class ProductRepo extends GetConnect {
  Future<List<Product>> getProducts({Map<String, dynamic>? request, bool getMyProduct = false}) async {
    Response response = await this.request(
      getMyProduct? baseUri + 'api/my-products': _url,
      'GET',
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization: HeaderVal.tokenType + box.read(BoxKey.accessToken).toString(),
      },
      body: request,
    );

    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }

    return productFromJson(response.bodyString!);
  }

  Future<Product> postProduct(
    String accessToken, {
    required String title,
    required int price,
    required String description,
    required category,
  }) async {
    Response response = await post(
      _url,
      {
        'title': title,
        'price': price,
        'description': description,
        'category': category,
      },
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization: HeaderVal.tokenType + accessToken,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    Product product = Product.fromJson(response.body);
    return product;
  }

  Future<List<ProductImage>> postProductImage(String accessToken, String productId, {required List<String> paths}) async {
    Response response = await post(
      baseUri+'api/product-images/'+productId,
      {
        'paths': paths,
      },
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization: HeaderVal.tokenType + accessToken,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return productImageFromJson(response.bodyString!);
  }

  Future<List<String>> handleUploadImage(List<XFile> listImage, String productId) async {
    List<String> imageUrl = [];
    try {
      for (int i = 0; i < listImage.length; i++) {
        final storageRef = FirebaseStorage
            .instance
            .ref()
            .child('products/$productId/${DateTime.now().millisecondsSinceEpoch.toString()}');
        final task = storageRef
            .putFile(File(listImage[i].path));
        await task.then((picValue) async {
          await picValue.ref.getDownloadURL().then((downloadUrl) {
            debugPrint("URL : " + downloadUrl);
            imageUrl.add(downloadUrl);
          });
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return imageUrl;
  }

  Future handleDeleteImage(List<String> listImageUrl) async {
    try {
      for (int i = 0; i < listImageUrl.length; i++) {
        FirebaseStorage.instance.refFromURL(listImageUrl[i]).delete();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future deleteProduct(String productId) async {
    Response response = await delete(
      _url+'/'+productId,
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization: HeaderVal.tokenType + box.read(BoxKey.accessToken),
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return response.bodyString;
  }
}
