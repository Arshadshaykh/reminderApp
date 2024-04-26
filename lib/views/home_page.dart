import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reminder/const/app_colors.dart';
import 'package:reminder/controller/getx_controller.dart';
import 'package:reminder/utils/appbar.dart';
import 'package:reminder/views/main_pages.dart';
import '../const/assets_images.dart';
import '../utils/add_button.dart';
import '../utils/bottomSheet.dart';
import '../utils/bottombar.dart';

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
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: true,
            appBar: CustomAppBar2(
              wantLeading: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
              wantAction: true,
              actions: [
                controller.currentIndex == 0
                    ? addButton(
                        AssetsImages.add,
                        callback: () {
                          Future.delayed(const Duration(milliseconds: 100), ()async {
                            await showMyBottomSheet(context, controller.currentIndex,);
                          });
                        },
                      )
                    : controller.currentIndex == 1
                        ? addButton(
                            AssetsImages.add,
                            callback: () {
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                showMyBottomSheet(
                                    context, controller.currentIndex);
                              });
                            },
                          )
                        : addButton(
                            AssetsImages.add,
                            callback: () {
                              Future.delayed(const Duration(milliseconds: 100),
                                  () {
                                showMyBottomSheet(
                                    context, controller.currentIndex);
                              });
                            },
                          ),
                SizedBox(
                  width: 20,
                )
              ],
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
                  child: bottombar(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
