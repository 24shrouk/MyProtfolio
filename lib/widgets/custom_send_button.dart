import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_style.dart';

class CustomSendButton extends StatelessWidget {
  const CustomSendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xff00ADB5))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Send Message',
              style:
                  AppStyle.styleBold18(context).copyWith(color: Colors.white),
            ),
            const Icon(
              Icons.send,
              color: Colors.white,
            )
          ],
        ));
  }
}
