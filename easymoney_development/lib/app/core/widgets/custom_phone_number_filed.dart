import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_money/app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomPhoneNumberField extends StatelessWidget {
  final TextEditingController phoneController;
  final Function(CountryCode) onCodeChanged;

  const CustomPhoneNumberField({
    Key? key,
    required this.phoneController,
    required this.onCodeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Phone Number",
          style: TextStyle(
            fontSize: 18,
            color: ColorConstants.greyPramiryColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 55,
          padding: const EdgeInsets.only(right: 12.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: ColorConstants.greyPramiryColor,
            ),
            borderRadius: BorderRadius.circular(12.0),
            color: ColorConstants.whiteColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: CountryCodePicker(
                  onChanged: onCodeChanged,
                  initialSelection: 'kh',
                  favorite: const ['+855', 'KH'],
                  padding: const EdgeInsets.only(left: 0),
                  textStyle: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                  // optional. Shows only country name and flag
                  showCountryOnly: false,
                  // optional. Shows only country name and flag when popup is closed.
                  showOnlyCountryWhenClosed: false,
                  showFlagDialog: true,
                  // showFlag: false,
                  // optional. aligns the flag and the Text left
                  alignLeft: true,
                ),
                width: 130,
              ),
              Container(
                color: ColorConstants.greyPramiryColor,
                width: 1,
                margin: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              ),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  cursorColor: ColorConstants.blackColor,
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                  controller: phoneController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "12345678",
                    helperStyle: TextStyle(
                      fontSize: 18.0,
                      color: ColorConstants.greyPramiryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
