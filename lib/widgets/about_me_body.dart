import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_bmi/utils/app_images.dart';
import 'package:responsive_bmi/widgets/about_me_text_section.dart';

class AboutMeBody extends StatelessWidget {
  const AboutMeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 40,
        right: 24,
        bottom: MediaQuery.sizeOf(context).height * 0.3,
        top: MediaQuery.sizeOf(context).height * 0.1,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AboutMeTextSection(),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: SizedBox(
              width: 400,
              child: SvgPicture.asset(
                Assets.imagesAboutme,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
