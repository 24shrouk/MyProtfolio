import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/utils/app_style.dart';
import 'package:responsive_bmi/widgets/about_me_body.dart';
import 'package:responsive_bmi/widgets/contact_body.dart';
import 'package:responsive_bmi/widgets/desktop_home_body.dart';
import 'package:responsive_bmi/widgets/projects_body.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class TabletLayout extends StatefulWidget {
  const TabletLayout({super.key});

  @override
  State<TabletLayout> createState() => _TabletLayoutState();
}

class _TabletLayoutState extends State<TabletLayout> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  final onMenuHover = Matrix4.identity()..scale(1.0);

  final screenList = const <Widget>[
    DesktopHomeBody(),
    AboutMeBody(),
    ProjectsBody(
      crossElementnum: 3,
    ),
    ContactBody(),
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
    // double width = MediaQuery.sizeOf(context).width;
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
                style: AppStyle.styleReguler18(context)
                    .copyWith(color: Colors.white),
              ),
              const Spacer(),
              SizedBox(
                height: 30,
                child: ListView.separated(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, child) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        scrollTo(index: index);
                      },
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
                ),
              ),
              const SizedBox(width: 30),
            ],
          )),
      body: ScrollablePositionedList.builder(
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
