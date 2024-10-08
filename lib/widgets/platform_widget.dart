import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';

class PlatForms extends StatelessWidget {
  const PlatForms({super.key, required this.image, required this.onTap});

  final String image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.maintextcolor2, width: 2.0),
        color: AppColors.backgroundColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(500),
        splashColor: AppColors.maintextcolor2,
        hoverColor: AppColors.backgroundColor,
        onTap: onTap,
        child: Image.asset(
          image,
          width: 20,
          height: 24,
          fit: BoxFit.contain,
          color: AppColors.maintextcolor2,
        ),
      ),
    );
  }
}
