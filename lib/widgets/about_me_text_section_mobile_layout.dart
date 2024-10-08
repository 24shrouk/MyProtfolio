import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_style.dart';

class AboutMeTextSectionMobileLayout extends StatelessWidget {
  const AboutMeTextSectionMobileLayout({
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
          width: width * 0.9,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1600),
            child: Text(
              "I am a passionate Flutter developer with a strong focus on creating high-performance, visually appealing mobile applications. With a solid foundation in computer science and experience in building responsive, user-friendly apps, I specialize in crafting seamless cross-platform solutions. I am dedicated to continuous learning and always strive to stay updated with the latest trends, ensuring my work delivers quality and attention to detail.",
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
