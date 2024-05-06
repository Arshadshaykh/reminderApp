import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../const/app_colors.dart';
import '../../controller/getx_controller.dart';
import '../../custom_paint/pinted_bottom_bar.dart';
import '../animation/bottom_tile.dart';

Widget bottombar(){
  return GetBuilder<MyController>(
                    builder: (controller) {
                      return Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.passthrough,
                        children: [
                          // Bottom bar boarder
                          ClipPath(
                            clipper: LineClipper(),
                            child: Container(
                              height: 82,
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
                                height: 80,
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
                                    end: 2,
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
                          // controller.currentIndex == 1
                          //     ? Positioned(
                          //         top: -25,
                          //         left: 130,
                          //         child: BottomTileTranslation(
                          //           begin: 0,
                          //           end: 2,
                          //           icon: Icons.event_note_rounded,
                          //         ))
                          //     : Positioned(
                          //         top: 10,
                          //         bottom: 10,
                          //         left: 195,
                          //         child: InkWell(
                          //           onTap: () {
                          //             controller.upDateAppBarTitle(1);
                          //             controller.updateCurrentIndex(1);
                          //           },
                          //           child: Icon(
                          //             Icons.event_note_rounded,
                          //             color: AppColors.white.withOpacity(0.6),
                          //           ),
                          //         ),
                          //       ),
                          controller.currentIndex == 2
                              ? Positioned(
                                  top: -32,
                                  left: 235,
                                  child: BottomTileTranslation(
                                    begin: 0,
                                    end: 2,
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
                  );
}