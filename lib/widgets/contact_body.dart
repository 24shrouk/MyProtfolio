import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_bmi/utils/app_style.dart';
import 'package:responsive_bmi/widgets/contact_text.dart';
import 'package:responsive_bmi/widgets/custom_send_button.dart';
import 'package:responsive_bmi/widgets/custom_text_form_field.dart';

class ContactBody extends StatefulWidget {
  const ContactBody({super.key});

  @override
  State<ContactBody> createState() => _ContactBodyState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController messageController = TextEditingController();

Future sendEmail() async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_s0artlj';
  const templateId = 'template_q8b7yla';
  const userId = 'gNZx71-NWk3FI5avv';

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

    // Print the status code and response
    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print("Email sent successfully");
    } else {
      print("Failed to send email");
    }
  } catch (e) {
    print("Error: $e");
  }
}

class _ContactBodyState extends State<ContactBody> {
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
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height * 0.4,
          bottom: MediaQuery.sizeOf(context).height * 0.2,
          left: 40,
          right: 40),
      child: Form(
        key: formKey,
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
                          onSaved: (value) => nameController.text = value!,
                          controller: nameController,
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
                          onSaved: (value) => emailController.text = value!,
                          controller: emailController,
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
                    alignment:
                        Alignment.centerLeft, // Align the button to the left
                    child: SizedBox(
                      width: 200, // Set a specific width for the button
                      child: CustomSendButton(onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          int statusCode = await sendEmail() ?? 500;
                          if (statusCode == 200) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Email sent successfully')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Failed to send email')),
                            );
                          }
                        }
                      }), // Button will take only this width
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
