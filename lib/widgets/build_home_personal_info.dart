import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_style.dart';
import 'package:responsive_bmi/widgets/cv_button.dart';
import 'package:responsive_bmi/widgets/my_accounts.dart';

class BuildHomePersonalInfo extends StatelessWidget {
  const BuildHomePersonalInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1200),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'Shrouk Ahmed',
              style:
                  AppStyle.styleBold64(context).copyWith(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        FadeInLeft(
          duration: const Duration(milliseconds: 1400),
          child: AnimatedTextKit(animatedTexts: [
            TyperAnimatedText(
              'Flutter Developer ',
              textStyle: AppStyle.styleBold30(context)
                  .copyWith(color: const Color(0xff00ADB5)),
            )
          ]),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const MyAccounts(),
          const SizedBox(
            width: 8,
          ),
          FadeInRight(
              duration: const Duration(milliseconds: 1600),
              child: const CvButton()),
        ]),
      ],
    );
  }
}
