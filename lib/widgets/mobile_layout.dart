import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/utils/app_style.dart';
import 'package:responsive_bmi/widgets/about_me_text_section.dart';
import 'package:responsive_bmi/widgets/mobile_contact_body.dart';
import 'package:responsive_bmi/widgets/mobile_personal_info.dart';
import 'package:responsive_bmi/widgets/projects_body.dart';

import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  final onMenuHover = Matrix4.identity()..scale(1.0);

  final screenList = const <Widget>[
    MobilePersonalInfo(),
    AboutMeTextSection(),
    ProjectsBody(crossElementnum: 1),
    MobileContactBody(),
  ];

  final menuItems = <String>[
    'Home',
    'About Me',
    'Projects',
    'Contact',
  ];

  var menuIndex = 0;

  Future scrollTo({required int index}) async {
    _itemScrollController
        .scrollTo(
            index: index,
            duration: const Duration(seconds: 2),
            curve: Curves.fastLinearToSlowEaseIn)
        .whenComplete(() {
      setState(() {
        menuIndex = index;
      });
    });
  }

  final yourScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          toolbarHeight: 90,
          titleSpacing: 40,
          elevation: 0,
          backgroundColor: AppColors.backgroundColor,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Portfolio',
                style:
                    AppStyle.styleBold18(context).copyWith(color: Colors.white),
              ),
              const Spacer(),
              PopupMenuButton(
                icon: const Icon(
                  Icons.menu_sharp,
                  size: 32,
                  color: Colors.white,
                ),
                color: AppColors.backgroundColor,
                position: PopupMenuPosition.under,
                constraints: BoxConstraints.tightFor(width: width * 0.9),
                itemBuilder: (BuildContext context) => menuItems
                    .asMap()
                    .entries
                    .map(
                      (e) => PopupMenuItem(
                        textStyle: AppStyle.styleBold18(context)
                            .copyWith(color: Colors.white),
                        onTap: () {
                          scrollTo(index: e.key);
                        },
                        child: Text(
                          e.value,
                          style: AppStyle.styleBold18(context)
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          )),
      body:
          // Scrollbar(
          //   trackVisibility: true,
          //   thumbVisibility: true,
          //   thickness: 8,
          //   interactive: true,
          //   controller: yourScrollController,
          //   child:
          ScrollablePositionedList.builder(
        itemCount: screenList.length,
        itemScrollController: _itemScrollController,
        itemPositionsListener: itemPositionsListener,
        scrollOffsetListener: scrollOffsetListener,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: screenList[index],
          );
        },
      ),
      //  ),
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
