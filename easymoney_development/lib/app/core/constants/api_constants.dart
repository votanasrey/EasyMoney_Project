// local api for ios simulator or ios device
// String baseUri = 'http://localhost:8000/';

// local api for Android emulator or Android device
// String baseUri = 'http://10.0.0.2:8000/';

// deployed api
String baseUri = 'https://easymoney-kh.herokuapp.com/';

class HeaderKey {
  static const accept = 'Accept';
  static const contentType = 'Content-Type';
  static const authorization = 'Authorization';
}

class HeaderVal {
  static const String json = 'application/json';
  static const String tokenType = 'Bearer ';
}

class UserKey {
  static const phoneNumber = 'phone_number';
  static const password = 'password';
}