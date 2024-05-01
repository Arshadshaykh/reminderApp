import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reminder/const/app_colors.dart';
import 'package:reminder/controller/getx_controller.dart';
import 'package:reminder/utils/widgets/appbar.dart';
import 'package:reminder/views/main_pages.dart';
import '../const/assets_images.dart';
import '../controller/notify_utils.dart';
import '../utils/widgets/add_button.dart';
import '../utils/widgets/bottomSheet.dart';
import '../utils/widgets/bottombar.dart';
import '../utils/functions.dart';
import '../utils/widgets/dialogueBox.dart';

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
    requestPermission();
    controller.upDateAppBarTitle(0);
  }
void requestPermission(){

  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialogBox(
          context: context,
          title: 'Grant Notification Permission',
          content: 'Reminder requires notificaion permission',
          btnText: 'ok',
          onPressed: () {
            AwesomeNotifications().requestPermissionToSendNotifications(
            channelKey: 'basic_channel',
            permissions: [
              NotificationPermission.FullScreenIntent,
            ]);
          },
        );
        // This is just a basic example. For real apps, you must show some
        // friendly dialog box before call the request method.
        // This is very important to not harm the user experience
        
      }
    });
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
            color: AppColors.scaffoldBG,
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
                          var id=generateUniqueId();
                          // return;
                              NotificationUtils.requestFullIntentPermission(context);
                          Future.delayed(const Duration(milliseconds: 100), ()async {
                            await showMyBottomSheet(id:id,context, controller.currentIndex,);
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
                              NotificationUtils.requestFullIntentPermission(context);
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
