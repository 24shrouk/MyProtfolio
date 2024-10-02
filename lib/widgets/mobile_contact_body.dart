import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_style.dart';
import 'package:responsive_bmi/widgets/contact_text.dart';
import 'package:responsive_bmi/widgets/custom_send_button.dart';
import 'package:responsive_bmi/widgets/custom_text_form_field.dart';

class MobileContactBody extends StatelessWidget {
  const MobileContactBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const ContactText(),
        const SizedBox(
          height: 24,
        ),
        CustomTextFormFiled(
          label: Text(
            'Your name',
            style: AppStyle.styleBold18(context),
          ),
          hint: 'Name',
        ),
        const SizedBox(height: 20),
        CustomTextFormFiled(
          label: Text(
            'Your email',
            style: AppStyle.styleBold18(context),
          ),
          hint: 'Email',
        ),
        const SizedBox(height: 20),
        CustomTextFormFiled(
          label: Text(
            'Your message',
            style: AppStyle.styleBold18(context),
          ),
          hint: 'Message',
          maxlines: 5,
        ),
        const SizedBox(height: 20),
        const Align(
          alignment: Alignment.centerLeft, // Align the button to the left
          child: SizedBox(
            width: 200, // Set a specific width for the button
            child: CustomSendButton(), // Button will take only this width
          ),
        ),
      ],
    );
  }
}
