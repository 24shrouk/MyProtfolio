import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/size_config.dart';

abstract class AppStyle {
  static TextStyle styleBold18(BuildContext context) {
    return const TextStyle(
      fontSize: 16,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold30(BuildContext context) {
    return const TextStyle(
      fontSize: 30,
      fontFamily: 'Oswald',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleReguler18(BuildContext context) {
    return const TextStyle(
      fontSize: 18,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleBold96(BuildContext context) {
    return const TextStyle(
      fontSize: 96,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold64(BuildContext context) {
    return const TextStyle(
      fontSize: 64,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
    );
  }
}

double getResponsiveFontSize({required context, required double fontSize}) {
  double scaleFactor = getScalerFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScalerFactor(context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 550;
  } else if (width < SizeConfig.desktop) {
    return width / 1000;
  } else {
    return width / 1550;
  }
}
