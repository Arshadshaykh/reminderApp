import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reminder/const/app_colors.dart';
import 'package:reminder/utils/appbar.dart';

import '../const/assets_images.dart';

class Challange extends StatefulWidget {
  const Challange({super.key});

  @override
  State<Challange> createState() => CchallangeState();
}

class CchallangeState extends State<Challange> {
  bool reminder = true;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: Color(0xff242C3B),
        ),
        Positioned(
            left: -300,
            top: -60,
            child: Image.asset(
              AssetsImages.scaffoldBG,
            )),
        SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.transparent,
            body: Container(
              margin: EdgeInsets.only(top: 5, right: 25, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Custom Appbar
                  CustomAppBar(
                      title: "Title", backgroundColor: AppColors.black),
                  SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.hardEdge,
                            elevation: 0,
                            color: AppColors.transparent,
                            shadowColor: AppColors.transparent,
                            surfaceTintColor: AppColors.transparent,
                            margin: EdgeInsets.only(bottom: 20),
                            child: ClipRect(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                                child: Container(
                                  width: double.infinity,
                                  // height: 200,
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color:
                                            Color.fromARGB(255, 77, 88, 113)),
                                    gradient: LinearGradient(colors: [
                                      Color(0xff353F54).withOpacity(0.8),
                                      Color(0xff222834).withOpacity(0.7)
                                    ]),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        AssetsImages.sun,
                                        height: 35,
                                      ),
                                      Text(
                                        'Reminder Name',
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                      Text(
                                        'Reminder Time',
                                        style:
                                            TextStyle(color: AppColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.translucentBlack2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.alarm_rounded,
                  color: AppColors.white.withOpacity(0.6),
                ),
                Icon(
                  Icons.notifications_active_outlined,
                  color: AppColors.white.withOpacity(0.6),
                ),
                Icon(
                  Icons.task_alt_rounded,
                  color: AppColors.white.withOpacity(0.6),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
