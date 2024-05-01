import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reminder/controller/getx_controller.dart';
import 'package:reminder/controller/notification_controller.dart';
import 'package:reminder/views/home_page.dart';

import 'controller/awes_notify_controller.dart';
import 'controller/object_box.dart';
import 'views/home.dart';

late ObjectBox objectbox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AwesomeNotifySevices.initAwesomeNotification();
  
  // await LocalNotification.init();
  objectbox = await ObjectBox.create();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyController controller = Get.put(MyController());

   MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Reminder Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
