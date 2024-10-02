import 'package:flutter/material.dart';
import 'package:responsive_bmi/widgets/build_home_personal_info.dart';
import 'package:responsive_bmi/widgets/profile_animation.dart';

class MobilePersonalInfo extends StatelessWidget {
  const MobilePersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      BuildHomePersonalInfo(),
      ProfileAnimation(),
      SizedBox(
        height: 110,
      )
    ]);
  }
}
