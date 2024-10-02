import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/utils/app_images.dart';

// class MyAccounts extends StatefulWidget {
//   const MyAccounts({
//     super.key,
//   });

//   @override
//   State<MyAccounts> createState() => _MyAccountsState();
// }

// class _MyAccountsState extends State<MyAccounts> {
//   var socialBI;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         FadeInRight(
//             duration: const Duration(milliseconds: 1600),
//             child: const PlatForms(image: Assets.imagesGithub)),
//         const SizedBox(
//           width: 12,
//         ),
//         FadeInRight(
//             duration: const Duration(milliseconds: 1600),
//             child: const PlatForms(image: Assets.imagesLinkedin)),
//         const SizedBox(
//           width: 12,
//         ),
//         FadeInRight(
//             duration: const Duration(milliseconds: 1600),
//             child: const CvButton()),
//       ],
//     );
//   }
// }

class MyAccounts extends StatefulWidget {
  const MyAccounts({super.key});

  @override
  State<MyAccounts> createState() => _MyAccountsState();
}

class _MyAccountsState extends State<MyAccounts> {
  final socialButtons = <String>[
    Assets.imagesGithub,
    Assets.imagesLinkedin,
  ];
  var socialBI;
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 1600),
      child: SizedBox(
        height: 48,
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              onHover: (value) {
                setState(() {
                  if (value) {
                    socialBI = index;
                  } else {
                    socialBI = null;
                  }
                });
              },
              borderRadius: BorderRadius.circular(550),
              //hoverColor: AppColors.backgroundColor,
              splashColor: AppColors.maintextcolor2,
              child: BuildSocialButton(
                  asset: socialButtons[index],
                  hover: socialBI == index ? true : false,
                  context: context),
            );
          },
          separatorBuilder: (context, child) => const SizedBox(
            width: 8,
          ),
          itemCount: socialButtons.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Ink BuildSocialButton(
      {required String asset,
      required bool hover,
      required BuildContext context}) {
    return Ink(
      width: 45,
      height: 45,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.backgroundColor,
          border: Border.all(color: AppColors.maintextcolor2, width: 2.0)),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        // color: hover ? AppColors.maintextcolor2 : null,
      ),
    );
  }
}
