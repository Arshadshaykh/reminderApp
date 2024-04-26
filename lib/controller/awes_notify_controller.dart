import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class AwesomeNotifySevices {
  static Future initAwesomeNotification() async {
    await AwesomeNotifications().initialize(
        // set the icon to null if you want to use the default app icon
        null,
        [
          NotificationChannel(
              channelGroupKey: 'basic_channel_group',
              channelKey: 'basic_channel',
              channelName: 'Basic notifications',
              channelDescription: 'Notification channel for basic tests',
              defaultColor: Color(0xFF9D50DD),
              enableVibration: true,
              enableLights: true,
              ledColor: Colors.white)
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);
  }
  
Future showScheduleNotification({int? hour,int? min}) async{
   String localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  String utcTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 0,
          channelKey: 'basic_channel',
          title: 'Notification every single minute',
          body:
              'This notification was scheduled to repeat every minute.',
          // notificationLayout: NotificationLayout.BigPicture,
          // bigPicture: 'asset://assets/images/melted-clock.png',
          category: NotificationCategory.Alarm,
          wakeUpScreen: true,
          autoDismissible: false
          ),
      // schedule: NotificationInterval(interval: 60, timeZone: localTimeZone, repeats: true,allowWhileIdle: true)
      schedule: NotificationCalendar(hour: hour,minute: min,preciseAlarm: true,allowWhileIdle: true,repeats:true ),
      
      );
}
}
