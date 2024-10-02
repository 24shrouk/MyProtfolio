import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/utils/app_style.dart';

class CvButton extends StatelessWidget {
  const CvButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
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
