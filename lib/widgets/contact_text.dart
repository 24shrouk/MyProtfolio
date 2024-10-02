import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_bmi/utils/app_images.dart';
import 'package:responsive_bmi/utils/app_style.dart';

class ContactText extends StatelessWidget {
  const ContactText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Got a project in mind?',
          style: AppStyle.styleBold64(context).copyWith(color: Colors.white),
        ),
        SvgPicture.asset(
          Assets.imagesArrow,
          alignment: Alignment.topLeft,
        ),
      ],
    );
  }
}
