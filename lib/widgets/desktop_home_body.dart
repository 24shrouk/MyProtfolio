import 'package:flutter/material.dart';
import 'package:responsive_bmi/widgets/build_home_personal_info.dart';
import 'package:responsive_bmi/widgets/profile_animation.dart';

class DesktopHomeBody extends StatelessWidget {
  const DesktopHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: BuildHomePersonalInfo()),
        const ProfileAnimation(),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
        )
      ],
    );
  }
}
