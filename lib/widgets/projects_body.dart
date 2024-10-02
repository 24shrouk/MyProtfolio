import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_bmi/utils/app_colors.dart';
import 'package:responsive_bmi/utils/app_images.dart';
import 'package:responsive_bmi/utils/app_style.dart';

class ProjectsBody extends StatefulWidget {
  const ProjectsBody({super.key, required this.crossElementnum});
  final int crossElementnum;

  @override
  State<ProjectsBody> createState() => _ProjectsBodyState();
}

class _ProjectsBodyState extends State<ProjectsBody> {
  final onHoverEffect = Matrix4.identity()..scale(1.0);

  List images = <String>[
    Assets.imagesHadith,
    Assets.imagesHadith,
    Assets.imagesHadith,
    Assets.imagesHadith,
  ];
  var hoverIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FadeInDown(
          duration: const Duration(microseconds: 2000),
          child: Text(
            'Projects',
            style: AppStyle.styleBold64(context).copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GridView.builder(
            itemCount: images.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 280,
              crossAxisCount: widget.crossElementnum,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
            ),
            itemBuilder: (context, index) {
              var image = images[index];
              return FadeInUpBig(
                duration: const Duration(milliseconds: 1600),
                child: InkWell(
                  onTap: () {},
                  onHover: (value) {
                    setState(() {
                      if (value) {
                        hoverIndex = index;
                      } else {
                        hoverIndex = null;
                      }
                    });
                  },
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(image), fit: BoxFit.fill),
                      ),
                    ),
                    Visibility(
                      visible: index == hoverIndex,
                      child: AnimatedContainer(
                        transform: index == hoverIndex ? onHoverEffect : null,
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  AppColors.backgroundColor.withOpacity(0.3),
                                  AppColors.backgroundColor.withOpacity(0.4),
                                  AppColors.backgroundColor.withOpacity(0.5),
                                  AppColors.backgroundColor.withOpacity(0.6),
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Hadith',
                              style: AppStyle.styleBold18(context),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              maxRadius: 25,
                              child: Image.asset(
                                Assets.imagesShare,
                                width: 25,
                                height: 25,
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
                ),
              );
            })
      ],
    );
  }
}
