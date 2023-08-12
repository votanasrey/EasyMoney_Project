import 'dart:io';

import 'package:easy_money/app/core/constants/api_constants.dart';
import 'package:easy_money/app/data/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

String _url = baseUri + 'api/me';

class UserRepo extends GetConnect {
  Future<User> getUser(String accessToken) async {
    Response response = await get(
      _url,
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization: HeaderVal.tokenType + accessToken,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }
    User user = User.fromJson(response.body);

    return user;
  }

  Future<User> updateUser(String accessToken, Map data) async {
    Response response = await patch(
      _url,
      data,
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization: HeaderVal.tokenType + accessToken,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.bodyString);
    }
    User user = User.fromJson(response.body);

    return user;
  }

  Future<String> handleUploadImage(XFile image, String userId) async {
    String imageUrl = '';
    try {
        final storageRef = FirebaseStorage
            .instance
            .ref()
            .child('users/$userId/${DateTime.now().millisecondsSinceEpoch.toString()}');
        final task = storageRef
            .putFile(File(image.path));
        await task.then((picValue) async {
          await picValue.ref.getDownloadURL().then((downloadUrl) {
            debugPrint("URL : " + downloadUrl);
            imageUrl = downloadUrl;
          });
        });
    } catch (e) {
      debugPrint(e.toString());
    }
    return imageUrl;
  }
}
