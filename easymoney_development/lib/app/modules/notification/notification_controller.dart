import 'package:easy_money/app/data/models/models.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  List<NotificationModel> notifyList = [
    NotificationModel(
      title: "Your loan request accepted.",
      description: "Now you can confirm the amount you want to loan and complete your loan.",
    ),
    NotificationModel(
      title: "Account Verified",
      description: "Now you can request a loan and access many feature made for verified account.",
      wasRead: true,
    ),
    NotificationModel(
      title: "Account Create",
      description: "You can verify your account to access verified account features.",
      wasRead: true,
    ),
  ];
}
