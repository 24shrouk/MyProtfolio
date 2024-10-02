// import 'package:flutter/material.dart';
// import 'package:responsive_bmi/utils/app_colors.dart';
// import 'package:responsive_bmi/utils/app_style.dart';

// class CustomMobileAppBar extends StatefulWidget {
//   const CustomMobileAppBar({super.key});

//   @override
//   State<CustomMobileAppBar> createState() => _CustomMobileAppBarState();
// }

// class _CustomMobileAppBarState extends State<CustomMobileAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     final menuItems = <String>[
//       'Home',
//       'About',
//       'Services',
//       'Portfolio',
//       'Contact',
//     ];
//  var menuIndex = 0;
//  final onMenuHover = Matrix4.identity()..scale(1.0);
//     Future scrollTo({required int index}) async {
//       _itemScrollController
//           .scrollTo(
//               index: index,
//               duration: const Duration(seconds: 2),
//               curve: Curves.fastLinearToSlowEaseIn)
//           .whenComplete(() {
//         setState(() {
//           menuIndex = index;
//         });
//       });
//     }

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         const Text('Portfolio'),
//         const Spacer(),
//         SizedBox(
//           height: 30,
//           child: ListView.separated(
//             itemCount: menuItems.length,
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             separatorBuilder: (context, child) => const SizedBox(
//               width: 8,
//             ),
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   scrollTo(index: index);
//                 },
//                 borderRadius: BorderRadius.circular(100),
//                 onHover: (value) {
//                   setState(() {
//                     if (value) {
//                       menuIndex = index;
//                     } else {
//                       menuIndex = 0;
//                     }
//                   });
//                 },
//                 child: buildNavBarAnimatedContainer(
//                     index, menuIndex == index ? true : false),
//               );
//             },
//           ),
//         ),
//         const SizedBox(width: 30),
//       ],
//     );
//   }

//   AnimatedContainer buildNavBarAnimatedContainer(
//       int index, BuildContext context, bool hover) {
//     return AnimatedContainer(
//       alignment: Alignment.center,
//       width: hover ? 95 : 90,
//       transform: hover ? onMenuHover : null,
//       duration: const Duration(
//         milliseconds: 200,
//       ),
//       child: Text(
//         menuItems[index],
//         style: AppStyle.styleReguler18(context)
//             .copyWith(color: hover ? AppColors.maintextcolor2 : Colors.white),
//       ),
//     );
//   }
// }
