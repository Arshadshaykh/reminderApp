import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reminder/const/app_colors.dart';
import 'package:reminder/controller/getx_controller.dart';
import 'package:reminder/utils/appbar.dart';
import 'package:reminder/views/main_pages.dart';

import '../const/assets_images.dart';
import '../custom_paint/pinted_bottom_bar.dart';
import '../utils/animation/bottom_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool reminder = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.upDateAppBarTitle(0);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      alarmScreenWidget(),
      reminderScreenWidget(),
      todoScreenWidget()
    ];
    int currentIndex = 0;
    MyController controller = Get.find();
    return SafeArea(
      child: Stack(
        children: [
          // backGround
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xff242C3B),
          ),
          // background image
          Positioned(
              left: -300,
              top: -60,
              child: Image.asset(
                AssetsImages.scaffoldBG,
              )),

          Scaffold(
            appBar: CustomAppBar2(
              wantLeading: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: AppColors.transparent,
            body: Stack(
              children: [
                GetBuilder<MyController>(builder: (MyController controller) {
                  return screens[controller.currentIndex].animate().slide();
                }).animate().slide(),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GetBuilder<MyController>(
                    builder: (controller) {
                      return Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.passthrough,
                        children: [
                          // Bottom bar boarder
                          ClipPath(
                            clipper: LineClipper(),
                            child: Container(
                              height: 102,
                              decoration: BoxDecoration(
                                color: AppColors.gray,
                              ),
                            ),
                          ),
                          // Bottom bar front
                          Positioned(
                            bottom: 0,
                            left: 2,
                            right: 2,
                            child: ClipPath(
                              clipper: LineClipper(),
                              child: Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [
                                        AppColors.translucentBlack2,
                                        AppColors.black2
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      stops: [0.1, 1]),
                                ),
                              ),
                            ),
                          ),
                          controller.currentIndex == 0
                              ? Positioned(
                                  top: -20,
                                  left: 10,
                                  child: BottomTileTranslation(
                                    begin: 0,
                                    end: 10,
                                    icon: Icons.alarm_rounded,
                                  ))
                              : Positioned(
                                  top: 10,
                                  bottom: 10,
                                  left: 85,
                                  child: InkWell(
                                    onTap: () {
                                      controller.upDateAppBarTitle(0);
                                      controller.updateCurrentIndex(0);
                                    },
                                    child: Icon(
                                      Icons.alarm_rounded,
                                      color: AppColors.white.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                          controller.currentIndex == 1
                              ? Positioned(
                                  top: -25,
                                  left: 130,
                                  child: BottomTileTranslation(
                                    begin: 0,
                                    end: 10,
                                    icon: Icons.event_note_rounded,
                                  ))
                              : Positioned(
                                  top: 10,
                                  bottom: 10,
                                  left: 195,
                                  child: InkWell(
                                    onTap: () {
                                      controller.upDateAppBarTitle(1);
                                      controller.updateCurrentIndex(1);
                                    },
                                    child: Icon(
                                      Icons.event_note_rounded,
                                      color: AppColors.white.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                          controller.currentIndex == 2
                              ? Positioned(
                                  top: -32,
                                  left: 235,
                                  child: BottomTileTranslation(
                                    begin: 0,
                                    end: 10,
                                    icon: Icons.task_alt_rounded,
                                  ))
                              : Positioned(
                                  top: 10,
                                  bottom: 10,
                                  left: 300,
                                  child: InkWell(
                                    onTap: () {
                                      controller.upDateAppBarTitle(2);
                                      controller.updateCurrentIndex(2);
                                    },
                                    child: Icon(
                                      Icons.task_alt_rounded,
                                      color: AppColors.white.withOpacity(0.6),
                                    ),
                                  ),
                                )
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
