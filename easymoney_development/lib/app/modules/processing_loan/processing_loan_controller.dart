import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/data/repositories/loan_request_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

LoanRequestRepo _repo = LoanRequestRepo();

class ProcessingLoanController extends GetxController {
  TextEditingController occupation = TextEditingController();
  TextEditingController workAddress = TextEditingController();
  TextEditingController loanPurpose = TextEditingController();
  TextEditingController moneyIncome = TextEditingController();
  TextEditingController term = TextEditingController();
  TextEditingController numberOfExperiences = TextEditingController();
  TextEditingController loanAmount = TextEditingController(text: "0");
  TextEditingController installmentAmount = TextEditingController();

  var selectedImagePath = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
    Get.back();
  }

  RxInt formIndex = 0.obs;

  void removeImage() {
    selectedImagePath.value = "";
    Get.back();
  }

  RxBool isRequesting = false.obs;

  void onTapButton() async {
    if (formIndex.value == 0) {
      if (moneyIncome.text.isNotEmpty && numberOfExperiences.text.isNotEmpty) {
        formIndex.value++;
      } else {
        Get.snackbar(
          "Error",
          "Please fill all requirements",
          backgroundColor: ColorConstants.dangerColor,
        );
      }
    } else if (formIndex.value == 1) {
      if (term.text.isNotEmpty &&
          installmentAmount.text.isNotEmpty) {
        formIndex.value++;
      } else {
        Get.snackbar(
          "Error",
          "Please fill all requirements",
          backgroundColor: ColorConstants.dangerColor,
        );
      }
    } else {
      if (selectedImagePath.value != '') {
        isRequesting.value = true;
        await _repo
            .handleUploadImage(XFile(selectedImagePath.value))
            .then((value) async {
          await _repo.requestLoan(
            installment: int.parse(installmentAmount.text),
            term: int.parse(term.text),
            borrowerMonthIncome: int.parse(moneyIncome.text),
            borrowerLengthExperience: int.parse(numberOfExperiences.text),
            homeOwnership: homeOwnerShipSelect.value,
            addressState: propertyAreaSelect.value,
            loanAmount: int.parse(loanAmount.text),
            bankStatement: value,
          ).then((value) async {
            Get.back();
            getListLoanRequests();
          }).catchError((e) {
            debugPrint(e.toString());
          });
        });
      } else {
        Get.snackbar(
          "Error",
          "Please upload document",
          backgroundColor: ColorConstants.dangerColor,
        );
      }
    }
  }

  var relationshipSelect = 0.obs;
  var relationshipList = ["Single", "Married", "Widow"];

  var workStatusSelect = 0.obs;
  var workStatusList = ["Employed", "Unemployed", "Freelancer"];

  var homeOwnerShipSelect = 0.obs;
  var homeOwnerShipList = ["Own", "Rent", "Mortgage", "Any"];

  var propertyAreaSelect = 0.obs;
  var propertyAreaList = ["Urban Area", "Rural Area"];
}
