import 'package:easy_money/app/data/models/terms_and_conditions_model.dart';
import 'package:get/get.dart';

class TermsAndConditionsController extends GetxController {
  List<TermsAndConditionsModel> termsAndConditionsList = [
    TermsAndConditionsModel(
      title: "Basic Qualification",
      description: "- Age 18-65 years old\n"
          "– Valid National ID card or Passport"
          "- Provide contactable telephone number for both home and working place.\n"
              "– Minimum \$100 monthly income\n"
              "– Working in the current company for at least 3 months (for employee)\n"
              "– Living in current residence for at least 3 months\n",
    ),
    TermsAndConditionsModel(
      title: "Basic Required Documents for applying loan",
      description:
        "– Valid National ID card or Passport (remain at least 3 months of validation)\n"

    "– Proof of Income (Pay slip or Bank Statement or Working Contract)\n"

    "– Proof of Residence (Family book or Resident Book or Resident Certificate from Commune/Sangkat)\n"

        "- The Loan Term for Personal Loan is starting from 6, 12, 18, to 24 months.\n"

    ),
    TermsAndConditionsModel(
      title: "Benefits",
      description:
      "There is no need to have either third party person or any collateral certification to make the loan process even more complicated and take much time\n\n"

    "Online Loan Application: "
    "Apply online without the hassle of visiting the branch\n\n"

    "Fast  Process: "
    "Loan is provided based on your qualification , if you have a good credit , you will be provided more , instead of that, if you aren't eligible enough , you will be offered with another amount of money which suits your requested application.\n\n"

    "Loan approved and disbursed within 5 minutes long of applying and Flexible duration and repayment plan\n"
    ),
  ];
}
