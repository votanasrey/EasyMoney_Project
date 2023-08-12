import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/constants/constants.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/modules/sign_in/sign_in.dart';
import 'package:easy_money/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: getHeight,
          padding: const EdgeInsets.symmetric(horizontal: 27),
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomPageContent(
                      title: "Sign In",
                      description: "Please sign in to be continue",
                    ),
                    const SizedBox(height: 42.0),
                    CustomPhoneNumberField(
                      phoneController: controller.phoneNumber,
                      onCodeChanged: (code) {
                        controller.countryCode = code;
                        // print(controller.countryCode);
                      },
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return CustomTextField(
                        label: "password",
                        controller: controller.password,
                        hintText: "Your password",
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
                      );
                    }),
                    const SizedBox(
                      height: 35.0,
                    ),
                    CustomButton(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        controller.onTapSignIn();
                      },
                      name: 'Sign In',
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ], //children
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? ",
                      style: TextStyle(fontSize: 14.0)),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.signUpRoute),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 25),
                      child: Text(
                        "Sign Up now",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: ColorConstants.greenPrimaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
