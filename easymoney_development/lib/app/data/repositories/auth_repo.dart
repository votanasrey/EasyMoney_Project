import 'package:easy_money/app/core/constants/api_constants.dart';
import 'package:easy_money/app/data/data.dart';
import 'package:easy_money/app/data/models/user_model.dart';
import 'package:get/get.dart';

class AuthRepo extends GetConnect {
  Future<User> register({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String password,
    required String passwordConfirmation,
    required String gender,
    required DateTime dateOfBirth,
    required String address,
  }) async {
    String url = baseUri + 'api/register';

    Response response = await post(
      url,
      {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "gender": gender,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "address": address,
      },
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }

    User reUser = User.fromJson(response.body);
    return reUser;
  }

  Future<AccessToken> logIn({
    required String phoneNumber,
    required String password,
  }) async {
    String url = baseUri + 'api/login';
    Response response = await post(
      url,
      {
        UserKey.phoneNumber: phoneNumber,
        UserKey.password: password,
      },
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.statusCode);
    }

    AccessToken accessToken = AccessToken.fromJson(response.body);
    return accessToken;
  }

  Future<bool> logout(String accessToken) async {
    String url = baseUri + 'api/logout';
    Response response = await delete(
      url,
      headers: {
        HeaderKey.accept: HeaderVal.json,
        HeaderKey.contentType: HeaderVal.json,
        HeaderKey.authorization: HeaderVal.tokenType + accessToken,
      },
    );

    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return true;
  }
}
