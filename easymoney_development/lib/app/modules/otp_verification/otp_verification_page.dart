import 'package:easy_money/app/core/constants/colors.dart';
import 'package:easy_money/app/core/widgets/widgets.dart';
import 'package:easy_money/app/modules/otp_verification/otp_verification.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPVerificationPage extends GetView<OTPController> {
  const OTPVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBackAppBar(
        elevation: 0.0,
      ),
      body: InkWell(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          color: ColorConstants.whiteColor,
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPageContent(
                        title: "OTP Verification",
                        description: controller.otpDesc),
                    const SizedBox(height: 20),
                    const PinFieldAutoFill(
                      decoration: BoxLooseDecoration(
                        textStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        radius: Radius.circular(12),
                        bgColorBuilder: FixedColorBuilder(
                          ColorConstants.lightGreyColor,
                        ),
                        strokeColorBuilder: FixedColorBuilder(
                          ColorConstants.lightGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => debugPrint("Resend OTP clicked"),
                child: const Text(
                  'Resend OTP',
                  style: TextStyle(
                    color: ColorConstants.greenPrimaryColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                name: "Continue",
                onTap: () => controller.goto(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
