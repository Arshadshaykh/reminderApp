import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:reminder/const/app_colors.dart';
import 'package:reminder/const/font_styles.dart';
import '../../controller/awes_notify_controller.dart';
import '../../main.dart';
import '../functions.dart';

Future<dynamic> showMyBottomSheet(context, index, {id}) {
  final noteInputController = TextEditingController();
  final noteCommentController = TextEditingController();
  final alarmTitleController = TextEditingController();
  Future<void> addAlarm(int id, String time) async {
    if (alarmTitleController.text.isEmpty) return;
    await objectbox.addAlarm(id, alarmTitleController.text, time);
    alarmTitleController.text = '';
  }

  Future<void> updateAlarm(
      int id, int notiId, String time, bool isActive) async {
    if (alarmTitleController.text.isEmpty) return;
    await objectbox.updateAlarm(
        id, notiId, alarmTitleController.text, time, isActive);
    alarmTitleController.text = '';
  }

  Future<void> addNote() async {
    if (noteInputController.text.isEmpty) return;
    await objectbox.addNote(
        noteInputController.text, noteCommentController.text);
    noteInputController.text = '';
  }

  // String extractTimeFromString(String timeOfDayString) {
  //   if (!timeOfDayString.startsWith("TimeOfDay(") ||
  //       !timeOfDayString.endsWith(")")) {
  //     return ""; // Handle invalid input gracefully (optional)
  //   }

  //   // Extract the time part within parentheses
  //   return timeOfDayString.substring(10, timeOfDayString.length - 1);
  // }

  return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      enableDrag: true,
      context: context,
      backgroundColor: AppColors.scaffoldBG,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return index == 0
            // Bottom sheet for alarm page
            ? Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Title',
                            hintStyle: TextStyle(color: AppColors.white)),
                            validator: (v){

                              if (v!.isEmpty) {
                                return 'Please enter a title';
                              }

                            },
                        controller: alarmTitleController,
                        style: TextStyle(color: AppColors.white),
                        // onSubmitted: (value) => function,
                        // Provide a Key for the integration test
                        key: const Key('input'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // TODO: add alarm function
                            // addAlarm();

                            Navigator.of(context).push(
                              showPicker(
                                context: context,
                                value: Time.fromTimeOfDay(TimeOfDay.now(), 0),
                                onChange: (v) async {
                                  await AwesomeNotifySevices()
                                      .showScheduleNotification(
                                          hour: v.hour,
                                          min: v.minute,
                                          title: alarmTitleController.text,
                                          id: id);
                                  addAlarm(
                                      id, extractTimeFromString(v.toString()));
                                  Navigator.pop(context);
                                },
                              ),
                            );
                            // alarmTitleController.text.isEmpty
                            //     ? null
                            //     : Navigator.pop(context);
                          },
                          child: Text('Set Time')),
                    ],
                  ),
                ),
              )
            :
            // Bottom sheet for Todo page
            index == 2
                ? Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Title',
                                hintStyle: TextStyle(color: AppColors.white)),
                            style: TextStyle(color: AppColors.white),
                            controller: noteInputController,
                            // onSubmitted: (value) => function,
                            // Provide a Key for the integration test
                            key: const Key('input'),
                          ),
                          TextField(
                            decoration: InputDecoration(hintText: 'Description',hintStyle: TextStyle(color: AppColors.white)),
                            controller: noteCommentController,
                            style: TextStyle(color: AppColors.white),
                            // onSubmitted: (value) => function,
                            // Provide a Key for the integration test
                          ),
                          ElevatedButton(
                              onPressed: () {
                                addNote();
                                noteInputController.text.isEmpty
                                    ? null
                                    : Navigator.pop(context);
                              },
                              child: Text('Add')),
                        ],
                      ),
                    ),
                  )
                : SizedBox.shrink();
      });
}
