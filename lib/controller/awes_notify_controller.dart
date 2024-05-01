import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import '../utils/widgets/dialogueBox.dart';

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
              ledColor: Colors.white,
              importance: NotificationImportance.Max,
              criticalAlerts: true,),
              
               NotificationChannel(
              channelGroupKey: 'category_tests',
              channelKey: 'call_channel',
              channelName: 'Calls Channel',
              channelDescription: 'Channel with call ringtone',
              defaultColor: const Color(0xFF9D50DD),
              importance: NotificationImportance.Max,
              ledColor: Colors.white,
              channelShowBadge: true,
              locked: true,
              defaultRingtoneType: DefaultRingtoneType.Ringtone),
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);
  }

  Future showScheduleNotification(
      {int? hour, int? min, required String title, required int id}) async {
    String localTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    String utcTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();

    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'basic_channel',
            title: title,
            body: '',
            // notificationLayout: NotificationLayout.BigPicture,
            // bigPicture: 'asset://assets/images/melted-clock.png',
            // category: NotificationCategory.Alarm,
            // wakeUpScreen: true,
            // fullScreenIntent: true,
            // criticalAlert: true,
            // autoDismissible: false,
            // notificationLayout: NotificationLayout.BigText,
             fullScreenIntent: true,
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          notificationLayout: NotificationLayout.BigPicture,
          bigPicture: 'assets/pngs/moon.png',
            payload: {'username': 'Arsahd',},

          autoDismissible: false,),
        // schedule: NotificationInterval(interval: 60, timeZone: localTimeZone, repeats: true,allowWhileIdle: true)
        schedule: NotificationCalendar(
            hour: hour,
            minute: min,
            preciseAlarm: true,
            allowWhileIdle: true,
            repeats: true),
        actionButtons: [
          NotificationActionButton(
              key: 'stopButton',
              label: 'Stop',
              actionType: ActionType.DismissAction),
          NotificationActionButton(key: 'snoozeButton', label: 'Snooze')
        ]);
  }

    /* *********************************************
      NOTIFICATION'S SPECIAL CATEGORIES
  ************************************************ */

   Future<void> showCallNotification({required int id,int? hour, int? min,}) async {
    // Schedule only for test purposes. For real applications, you MUST
    // create call or alarm notifications using AndroidForegroundService.
    await AwesomeNotifications().createNotification(
        // await AndroidForegroundService.startAndroidForegroundService(
        //     foregroundStartMode: ForegroundStartMode.stick,
        //     foregroundServiceType: ForegroundServiceType.phoneCall,
        content: NotificationContent(
            id: id,
            channelKey: 'call_channel',
            title: 'Incoming Call',
            body: 'from Little Mary',
            category: NotificationCategory.Call,
            largeIcon: 'asset://assets/images/girl-phonecall.jpg',
            wakeUpScreen: true,
            fullScreenIntent: true,
            autoDismissible: false,
            payload: {'username': 'Little Mary'}),
        actionButtons: [
          NotificationActionButton(
              key: 'STOP',
              label: 'Stop',
              actionType: ActionType.Default,
              color: Colors.green,
              autoDismissible: true),
          NotificationActionButton(
              key: 'SNOOZE',
              label: 'Snooze',
              actionType: ActionType.SilentAction,
              isDangerousOption: true,
              autoDismissible: true),
        ],
        // schedule: NotificationInterval(interval: timeToWait));
        schedule: NotificationCalendar(
            hour: hour,
            minute: min,
            preciseAlarm: true,
            allowWhileIdle: true,
            repeats: true)
        );
  }

   Future<void> showAlarmNotification(
      {required int id, int secondsToWait = 30, int snoozeSeconds = 30}) async {
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: id,
            channelKey: 'alarm_channel',
            title: 'Alarm is playing',
            body: 'Hey! Wake Up!',
            category: NotificationCategory.Alarm,
            autoDismissible: true,
            payload: {'snooze': '$snoozeSeconds'}),
        actionButtons: [
          NotificationActionButton(
              key: 'SNOOZE',
              label: 'Snooze for $snoozeSeconds seconds',
              color: Colors.blue,
              actionType: ActionType.SilentBackgroundAction,
              autoDismissible: true),
        ],
        schedule: (secondsToWait < 5)
            ? null
            : NotificationCalendar.fromDate(
                date: DateTime.now().add(Duration(seconds: secondsToWait))));
  }

  Future cancelShaduledNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }
}
