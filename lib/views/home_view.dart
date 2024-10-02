import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/widgets/adabtive_widget.dart';
import 'package:responsive_bmi/widgets/desktop_layout.dart';
import 'package:responsive_bmi/widgets/mobile_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: AdabtiveWidget(
          mobileLayout: (context) => const MobileLayout(),
          tabletLayout: (context) => const DesktopLayout(), //TabletLayout(),
          desktopLayout: (context) => const DesktopLayout(), // DesktopLayout(),
        ));
  }
}
