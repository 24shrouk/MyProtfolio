import 'package:flutter/material.dart';

import 'package:responsive_bmi/utils/app_style.dart';
import 'package:responsive_bmi/widgets/contact_text.dart';
import 'package:responsive_bmi/widgets/custom_send_button.dart';
import 'package:responsive_bmi/widgets/custom_text_form_field.dart';

class ContactBody extends StatelessWidget {
  const ContactBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.4,
          bottom: MediaQuery.sizeOf(context).height * 0.2,
          left: 40,
          right: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: ContactText(),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // No stretching here
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormFiled(
                        label: Text(
                          'Your name',
                          style: AppStyle.styleBold18(context),
                        ),
                        hint: 'Name',
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: CustomTextFormFiled(
                        label: Text(
                          'Your email',
                          style: AppStyle.styleBold18(context),
                        ),
                        hint: 'Email',
                      ),
                    ),
                  ],
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
                  alignment:
                      Alignment.centerLeft, // Align the button to the left
                  child: SizedBox(
                    width: 200, // Set a specific width for the button
                    child:
                        CustomSendButton(), // Button will take only this width
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
