import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/utils/app_style.dart';
import 'package:responsive_bmi/widgets/contact_text.dart';
import 'package:responsive_bmi/widgets/custom_send_button.dart';
import 'package:responsive_bmi/widgets/custom_text_form_field.dart';
import 'package:http/http.dart' as http;

class MobileContactBody extends StatefulWidget {
  const MobileContactBody({super.key});

  @override
  State<MobileContactBody> createState() => _MobileContactBodyState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController messageController = TextEditingController();

Future sendEmail() async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_s0artlj';
  const templateId = 'template_q8b7yla';
  const userId = 'gNZx71-NWk3FI5avv';
//   final response = await http.post(url,
//       headers: {'Content-Type': 'application/json'},
//       body: json.encode({
//         'Service_id': serviceId,
//         'template_id': templateId,
//         'user_id': userId,
//         'template_params': {
//           'name': nameController.text,
//           'message': messageController.text,
//           'email': emailController.text,
//         }
//       }));
//   return response.statusCode;
  try {
    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'name': nameController.text,
            'message': messageController.text,
            'email': emailController.text,
          }
        }));

    if (response.statusCode == 200) {
      // Email sent successfully
      print('email send succefully');
    } else {
      // Failed to send email
      print('faild to send email');
    }
  } catch (error) {
    // Handle any errors that occur during the request

    print(error);
  }
}

class _MobileContactBodyState extends State<MobileContactBody> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    // Delay EmailJS initialization until after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Initialize EmailJS
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ContactText(),
          const SizedBox(
            height: 24,
          ),
          CustomTextFormFiled(
            onSaved: (value) => nameController.text = value!,
            controller: nameController,
            label: Text(
              'Your name',
              style: AppStyle.styleBold18(context),
            ),
            hint: 'Name',
          ),
          const SizedBox(height: 20),
          CustomTextFormFiled(
            onSaved: (value) => emailController.text = value!,
            controller: emailController,
            label: Text(
              'Your email',
              style: AppStyle.styleBold18(context),
            ),
            hint: 'Email',
          ),
          const SizedBox(height: 20),
          CustomTextFormFiled(
            onSaved: (value) => messageController.text = value!,
            controller: messageController,
            label: Text(
              'Your message',
              style: AppStyle.styleBold18(context),
            ),
            hint: 'Message',
            maxlines: 5,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft, // Align the button to the left
            child: SizedBox(
              width: 200, // Set a specific width for the button
              child: CustomSendButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    int statusCode = await sendEmail() ?? 500;
                    if (statusCode == 200) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            padding: EdgeInsets.all(16),
                            backgroundColor: AppColors.maintextcolor3,
                            content: Text(
                              'Email sent successfully',
                              style: TextStyle(color: Colors.white),
                            )),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            padding: EdgeInsets.all(16),
                            backgroundColor: AppColors.maintextcolor3,
                            content: Text(
                              'Email sent successfully',
                              style: TextStyle(color: Colors.white),
                            )),
                      );
                    }
                  }
                },
              ), // Button will take only this width
            ),
          ),
        ],
      ),
    );
  }
}
