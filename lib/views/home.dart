import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:reminderapp/controller/notification_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Reminder'),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                LocalNotification.showSimpleNotification(
                    title: 'Simple Notification',
                    body: 'this is Simple Notification',
                    payload: 'payload');
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text('Sipmle Notification'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                LocalNotification.showPeriodicNotification(
                  title: 'Periodic notification',
                  body: 'this is Periodic notification',
                  payload: 'payload',
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text('Periodic Notification'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                LocalNotification.close(
                  id: 1
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Text('Close Periodic Notification'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
