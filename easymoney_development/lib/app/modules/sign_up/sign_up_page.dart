import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sign_up.dart';

class SignUpPage extends GetView<SigUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> listBody = [
      Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  label: "First Name",
                  controller: controller.firstName,
                  hintText: "Sovann",
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CustomTextField(
                  label: "Last Name",
                  hintText: "Som",
                  controller: controller.lastName,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Obx(() {
            return CustomSelection(
              onChanged: (value) {
                controller.genderSelected.value = value;
              },
              selectionList: controller.genderList,
              selected: controller.genderSelected.value,
              label: 'Gender',
            );
          }),
        ],
      ),
      Column(
        children: [
          Obx(() {
            return CustomDatePicker(
              onChanged: (value) {
                controller.dateOfBirth.value = value;
              },
              initTime: controller.dateOfBirth.value,
              label: 'Date Of Birth',
            );
          }),
          const SizedBox(height: 20),
          CustomTextField(
            label: "Address",
            hintText: "Street 215, Toul Kork, Phnom Penh",
            controller: controller.address,
          ),
        ],
      ),
      Obx(() {
        return Column(
          children: [
            CustomPhoneNumberField(
              phoneController: controller.phoneNumber,
              onCodeChanged: (code) {
                controller.countryCode = code;
                // print(controller.countryCode);
              },
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Password",
              controller: controller.password,
              hintText: "Enter password",
              suffix: GestureDetector(
                onTap: () {
                  controller.hidden.value = !controller.hidden.value;
                },
                child: controller.hidden.value
                    ? const Icon(
                  Icons.visibility,
                  size: 20,
                )
                    : const Icon(
                  Icons.visibility_off,
                  size: 20,
                ),
              ),
              obscureText: controller.hidden.value,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              label: "Confirm Password",
              controller: controller.passwordConf,
              hintText: "Re-enter password",
              suffix: GestureDetector(
                onTap: () {
                  controller.confHidden.value = !controller.confHidden.value;
                },
                child: controller.confHidden.value
                    ? const Icon(
                  Icons.visibility,
                  size: 20,
                )
                    : const Icon(
                  Icons.visibility_off,
                  size: 20,
                ),
              ),
              obscureText: controller.confHidden.value,
            ),
          ],
        );
      }),
    ];

    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: ColorConstants.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.navigate_before, size: 40,),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27),
                  child: CustomPageContent(
                    title: "Sign Up",
                    description: "Fill in your information in to continue.",
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: listBody[controller.pageIndex.value],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(left: 27, right: 27, bottom: 20),
          child: CustomButton(
            name: controller.pageIndex.value == 2 ? "Sign Up" : "Next",
            onTap: () => controller.onTapButton(),
          ),
        ),
      );
    });
  }
}
