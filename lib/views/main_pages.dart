import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/controller/getx_controller.dart';
import '../const/app_colors.dart';
import '../const/assets_images.dart';
import '../custom_paint/pinted_bottom_bar.dart';

MyController controller = Get.find();

Widget alarmScreenWidget() {
  return Container(
    margin: EdgeInsets.only(right: 25, left: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
                      filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                      child: Container(
                        width: double.infinity,
                        // height: 200,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Color.fromARGB(255, 77, 88, 113)),
                          gradient: LinearGradient(colors: [
                            Color(0xff222834).withOpacity(0.7),
                            Color(0xff353F54).withOpacity(0.8),
                          ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AssetsImages.sun,
                              height: 35,
                            ),
                            Text(
                              'Reminder Name',
                              style: TextStyle(color: AppColors.white),
                            ),
                            Text(
                              'Reminder Time',
                              style: TextStyle(color: AppColors.white),
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
  );
}

Widget reminderScreenWidget() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: ((context, index) => 
      // Stack(
      //       alignment: Alignment.center,
      //       children: [
              ClipPath(
                clipper: NotesCard(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff222834).withOpacity(0.7),
                      Color(0xff353F54).withOpacity(0.8),
                    ]),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 100,
                  width: 100,
                ),
              )
              // ClipPath(
              //   clipper: NotesCard(),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(colors: [
              //         Color(0xff222834).withOpacity(0.7),
              //         Color(0xff353F54).withOpacity(0.8),
              //       ]),
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     height: 200,
              //     width: 200,
              //   ),
              // ),
          //   ],
          // )
          ),
    ),
  );
}

Widget todoScreenWidget() {
  return Container();
}


// Card(
//                   clipBehavior: Clip.none,
//                   elevation: 0,
//                   color: AppColors.transparent,
//                   shadowColor: AppColors.transparent,
//                   surfaceTintColor: AppColors.transparent,
//                   margin: EdgeInsets.only(bottom: 20),
//                   child: ClipRect(
//                     clipBehavior: Clip.none,
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
//                       child: Container(
//                         width: double.infinity,
//                         // height: 200,
//                         padding: EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               width: 2, color: Color.fromARGB(255, 77, 88, 113)),
//                           gradient: LinearGradient(colors: [
//                             Color(0xff222834).withOpacity(0.7),
//                             Color(0xff353F54).withOpacity(0.8),
//                           ]),
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Heading',
//                               style: TextStyle(
//                                   color: AppColors.white,
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w700),
//                             ),
//                             Text(
//                               'Detail',
//                               style: TextStyle(
//                                   color: AppColors.white,
//                                   fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),