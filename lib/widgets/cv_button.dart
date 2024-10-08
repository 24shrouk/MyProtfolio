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
            'https://drive.google.com/file/d/1fchOo6brjTqzajzAv8Tjr_PZBgqPzUo2/view?usp=drive_link');

        // Check if the URL can be launched and then launch it
        if (await canLaunchUrl(url)) {
          await launchUrl(
            url,
            mode: LaunchMode
                .externalApplication, // Launches in a new window or browser
          );
        } else {
          // If the URL cannot be launched, show an error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Could not launch URL')),
          );
        }
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
        'Download CV',
        style: AppStyle.styleBold18(context).copyWith(color: Colors.white),
      ),
    );
  }
}
