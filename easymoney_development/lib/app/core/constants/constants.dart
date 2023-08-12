import 'package:flutter/material.dart';
import 'package:get/get.dart';

const String textNA = "-";

bool isLoggedIn = false;

///
///=x=x=x=x=x=x=x=x=x= Durations =x=x=x=x=x=x=x=x=x=
///
class DurationConstants {
  static const Duration duration300ms = Duration(milliseconds: 300);
  static const Duration duration400ms = Duration(milliseconds: 400);
  static const Duration duration600ms = Duration(milliseconds: 600);
  static const Duration duration1500ms = Duration(milliseconds: 1500);
  static const Duration duration2s = Duration(seconds: 2);
  static const Duration duration3s = Duration(seconds: 3);
  static const Duration duration4s = Duration(seconds: 4);
  static const Duration duration7s = Duration(seconds: 7);
}

///
///=x=x=x=x=x=x=x=x=x= Durations =x=x=x=x=x=x=x=x=x=
///
///
///=x=x=x=x=x=x=x=x=x= Images =x=x=x=x=x=x=x=x=x=
///
class ImageConstants {
  static const String easyMoneyLogoSvg =
      'assets/svgs/easy_money_logo.svg';
  static const String easyMoneyLogoPng =
      'assets/images/easy_money_Logo.png';
}

///
///=x=x=x=x=x=x=x=x=x= Icons =x=x=x=x=x=x=x=x=x=
///

class IconConstants {
  static const bellI = 'assets/svgs/bell.svg';
  static const calendar = 'assets/svgs/calendar.svg';
  static const camera = 'assets/svgs/camera.svg';
  static const download = 'assets/svgs/download.svg';
  static const headphones = 'assets/svgs/headphones.svg';
  static const home = 'assets/svgs/home.svg';
  static const image = 'assets/svgs/image.svg';
  static const map = 'assets/svgs/map.svg';
  static const search = 'assets/svgs/search.svg';
  static const setting = 'assets/svgs/setting.svg';
  static const smartphone = 'assets/svgs/smartphone.svg';
  static const switchIcon = 'assets/svgs/switch.svg';
  static const trash = 'assets/svgs/trash.svg';
  static const truck = 'assets/svgs/truck.svg';
  static const upload = 'assets/svgs/upload.svg';
  static const checkCircle = 'assets/svgs/check-circle.svg';
  static const filter = 'assets/svgs/filter.svg';
}

///
///=x=x=x=x=x=x=x=x=x= Images =x=x=x=x=x=x=x=x=x=
///
///
///=x=x=x=x=x=x=x=x=x= Fonts =x=x=x=x=x=x=x=x=x=
///

///
///=x=x=x=x=x=x=x=x=x= Fonts =x=x=x=x=x=x=x=x=x=
///
///
///=x=x=x=x=x=x=x=x=x= MediaSizeConstants =x=x=x=x=x=x=x=x=x=
///
double getWidth = Get.width;
double getHeight = Get.height;

///
///=x=x=x=x=x=x=x=x=x= MediaSizeConstants =x=x=x=x=x=x=x=x=x=
///
///
///=x=x=x=x=x=x=x=x=x= API Endpoints =x=x=x=x=x=x=x=x=x=
///
class APIEndPoints {
  // static const baseUrl = 'http://localhost:port/route';
}
///
///=x=x=x=x=x=x=x=x=x= API Endpoints =x=x=x=x=x=x=x=x=x=
///

List<Locale> countries = [
  const Locale("af"),
  const Locale("am"),
  const Locale("ar"),
  const Locale("az"),
  const Locale("be"),
  const Locale("bg"),
  const Locale("bn"),
  const Locale("bs"),
  const Locale("ca"),
  const Locale("cs"),
  const Locale("da"),
  const Locale("de"),
  const Locale("el"),
  const Locale("en"),
  const Locale("es"),
  const Locale("et"),
  const Locale("fa"),
  const Locale("fi"),
  const Locale("fr"),
  const Locale("gl"),
  const Locale("ha"),
  const Locale("he"),
  const Locale("hi"),
  const Locale("hr"),
  const Locale("hu"),
  const Locale("hy"),
  const Locale("id"),
  const Locale("is"),
  const Locale("it"),
  const Locale("ja"),
  const Locale("ka"),
  const Locale("kk"),
  const Locale("km"),
  const Locale("ko"),
  const Locale("ku"),
  const Locale("ky"),
  const Locale("lt"),
  const Locale("lv"),
  const Locale("mk"),
  const Locale("ml"),
  const Locale("mn"),
  const Locale("ms"),
  const Locale("nb"),
  const Locale("nl"),
  const Locale("nn"),
  const Locale("no"),
  const Locale("pl"),
  const Locale("ps"),
  const Locale("pt"),
  const Locale("ro"),
  const Locale("ru"),
  const Locale("sd"),
  const Locale("sk"),
  const Locale("sl"),
  const Locale("so"),
  const Locale("sq"),
  const Locale("sr"),
  const Locale("sv"),
  const Locale("ta"),
  const Locale("tg"),
  const Locale("th"),
  const Locale("tk"),
  const Locale("tr"),
  const Locale("tt"),
  const Locale("uk"),
  const Locale("ug"),
  const Locale("ur"),
  const Locale("uz"),
  const Locale("vi"),
  const Locale("zh")
];
