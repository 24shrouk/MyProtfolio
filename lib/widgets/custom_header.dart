import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/utils/app_style.dart';

class CustomHeader extends StatefulWidget {
  const CustomHeader({
    super.key,
  });

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  final onMenuHover = Matrix4.identity()..scale(1.0);
  final menuItems = <String>[
    'Home',
    'About me',
    'Projects',
    'Contact',
  ];
  var menuIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Protfolio',
          style: AppStyle.styleReguler18(context).copyWith(
            color: Colors.white,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 30,
          child: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(100),
                onHover: (value) {
                  setState(() {
                    if (value) {
                      menuIndex = index;
                    } else {
                      menuIndex = 0;
                    }
                  });
                },
                child: buildNavBarAnimatedContainer(
                    index, context, menuIndex == index ? true : false),
              );
            },
            separatorBuilder: (context, child) => const SizedBox(
              width: 8,
            ),
            itemCount: menuItems.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildNavBarAnimatedContainer(
      int index, BuildContext context, bool hover) {
    return AnimatedContainer(
      alignment: Alignment.center,
      width: hover ? 95 : 90,
      transform: hover ? onMenuHover : null,
      duration: const Duration(
        milliseconds: 200,
      ),
      child: Text(
        menuItems[index],
        style: AppStyle.styleReguler18(context)
            .copyWith(color: hover ? AppColors.maintextcolor2 : Colors.white),
      ),
    );
  }
}
