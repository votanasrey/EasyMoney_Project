import 'package:easy_money/app/modules/home/home.dart';
import 'package:get/get.dart';

class ProcessingRequestLoanController extends GetxController {
  final String pageTitle = "Processing";
  final String pageDesc = "You loan request has been submitted. "
      "We’re checking and confirming your request. "
      "This process could take 5 minutes to complete.";
  HomeController controller = HomeController();
}