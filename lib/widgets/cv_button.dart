import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/utils/app_style.dart';
import 'package:url_launcher/url_launcher.dart';

class CvButton extends StatelessWidget {
  const CvButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        // The Google Drive URL
        final url = Uri.parse(
            'https://drive.google.com/file/d/1L_HxEyy9Q14EH_g_owH2tn31TGG0qRqv/view?usp=drive_link');

        await launchUrl(url, mode: LaunchMode.externalApplication);
      },
      color: AppColors.maintextcolor2,
      splashColor: AppColors.backgroundColor,
      hoverColor: AppColors.maintextcolor3,
      elevation: 6,
      height: 46,
      minWidth: 130,
      focusElevation: 12,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      child: Text(
        'CV',
        style: AppStyle.styleBold18(context).copyWith(color: Colors.white),
      ),
    );
  }
}
