import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/custom_back_app_bar.dart';
import 'package:easy_money/app/core/widgets/custom_button.dart';
import 'package:easy_money/app/core/widgets/custom_label_text.dart';
import 'package:easy_money/app/core/widgets/custom_page_content.dart';
import 'package:easy_money/app/modules/terms_and_conditions/terms_and_conditions.dart';
import 'package:easy_money/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsPage extends GetView<TermsAndConditionsController> {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: customBackAppBar(
        title: "Terms and Conditions",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomPageContent(
                title: "Terms and Conditions",
                description: "Terms and Conditions of requesting a loan with EasyMoney.",
              ),
              const SizedBox(
                height: 30,
              ),
              //Terms and Conditions List
              Column(
                children: controller.termsAndConditionsList.map((e) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CustomLabelText(
                      title: e.title,
                      description: e.description,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40,),
              //Accept Button
              CustomButton(name: "Agree", onTap: () => Get.offNamed(Routes.processingLoanRoute, arguments: Get.arguments))
            ],
          ),
        ),
      ),
    );
  }
}
