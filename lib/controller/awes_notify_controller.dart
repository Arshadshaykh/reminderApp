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
            criticalAlerts: true,
          ),
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
              defaultRingtoneType: DefaultRingtoneType.Alarm),
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
              channelGroupKey: 'basic_channel_group',
              channelGroupName: 'Basic group')
        ],
        debug: true);
    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  Future<void> showScheduleNotification(
      {int? hour,
      int? min,
      required String title,
      required int id,
      bool? isSnooze}) async {
    await AwesomeNotifications().createNotification(
      // await AndroidForegroundService.startAndroidForegroundService(
      //     foregroundStartMode: ForegroundStartMode.stick,
      //     foregroundServiceType: ForegroundServiceType.phoneCall,
      content: NotificationContent(
          id: id,
          channelKey: 'call_channel',
          title: title,
          body: '',
          category: NotificationCategory.Call,
          largeIcon: 'assets/pngs/moon.png',
          wakeUpScreen: true,
          fullScreenIntent: true,
          autoDismissible: false,
          payload: {
            'username': 'Reschedule',
            'title': title,
            'hour': hour.toString(),
            'min': min.toString()
          }),
      actionButtons: [
        NotificationActionButton(
            key: 'STOP',
            label: 'Stop',
            actionType: ActionType.KeepOnTop,
            color: Colors.green,
            autoDismissible: true),
        NotificationActionButton(
            key: 'SNOOZE',
            label: 'Snooze for 5 min',
            actionType: ActionType.KeepOnTop,
            showInCompactView: true,
            autoDismissible: true),
      ],
      // schedule: NotificationInterval(interval: timeToWait));
      schedule: NotificationCalendar(
          hour: hour,
          minute: isSnooze ?? false ? min ?? 0 + 5 : min,
          preciseAlarm: true,
          allowWhileIdle: true,
          repeats: true),
    );
  }

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    final payload = receivedAction.payload ?? {};
    // Your code goes here
    if (receivedAction.buttonKeyPressed == "STOP") {
      AwesomeNotifySevices().cancelShaduledNotification(receivedAction.id ?? 0);
    }
    if (receivedAction.buttonKeyPressed == "SNOOZE") {
      AwesomeNotifySevices().showScheduleNotification(
        id: receivedAction.id ?? 0,
        isSnooze: true,
        title: payload['title'] ?? '',
        hour: int.parse(payload['hour'] ?? ''),
        min: int.parse(payload['min'] ?? '') + 5,
      );
    }
  }

  @pragma("vm:entry-point")
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    // Your code goes here
    print(receivedAction);
  }
  Future cancelShaduledNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }
}
