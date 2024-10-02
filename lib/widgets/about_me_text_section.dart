import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_style.dart';

class AboutMeTextSection extends StatelessWidget {
  const AboutMeTextSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1400),
          child: RichText(
              text: TextSpan(
                  text: 'About ',
                  style: AppStyle.styleBold64(context)
                      .copyWith(color: Colors.white),
                  children: [
                TextSpan(
                  text: 'Me',
                  style: AppStyle.styleBold64(context).copyWith(
                    color: const Color(0xff00ADB5),
                  ),
                )
              ])),
        ),
        SizedBox(
          width: width * 0.5,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1600),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur tempus urna at turpis condimentum lobortis',
              style: AppStyle.styleReguler18(context)
                  .copyWith(color: Colors.white),
              softWrap: true, // Allows text to wrap automatically
              maxLines:
                  null, // No limit on the number of lines (null allows infinite lines)
              overflow: TextOverflow.visible,
            ),
          ),
        ),
        const SizedBox(
          height: 110,
        )
      ],
    );
  }
}
