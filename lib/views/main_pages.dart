import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reminder/const/font_styles.dart';
import 'package:reminder/controller/getx_controller.dart';
import '../const/app_colors.dart';
import '../const/assets_images.dart';
import '../controller/awes_notify_controller.dart';
import '../custom_paint/pinted_bottom_bar.dart';
import '../main.dart';
import '../model/models.dart';
import '../utils/functions.dart';
import '../utils/widgets/dialogueBox.dart';

MyController controller = Get.find();

Widget alarmScreenWidget() {
  return const AlarmPage()
      .animate()
      .slideX(begin: -0.5, end: 0, duration: Duration(milliseconds: 200));
  // return Container(
  //   margin: EdgeInsets.only(right: 25, left: 25),
  //   child: Column(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       Expanded(
  //         child: ListView.builder(
  //             physics: BouncingScrollPhysics(),
  //             shrinkWrap: true,
  //             padding: EdgeInsets.zero,
  //             itemCount: 15,
  //             itemBuilder: (context, index) {
  //               return Card(
  //                 clipBehavior: Clip.hardEdge,
  //                 elevation: 0,
  //                 color: AppColors.transparent,
  //                 shadowColor: AppColors.transparent,
  //                 surfaceTintColor: AppColors.transparent,
  //                 margin: EdgeInsets.only(bottom: 20),
  //                 child: ClipRect(
  //                   child: BackdropFilter(
  //                     filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
  //                     child: Container(
  //                       width: double.infinity,
  //                       // height: 200,
  //                       padding: EdgeInsets.all(20),
  //                       decoration: BoxDecoration(
  //                         border: Border.all(
  //                             width: 2,
  //                             color: Color.fromARGB(255, 77, 88, 113)),
  //                         gradient: LinearGradient(colors: [
  //                           Color(0xff222834).withOpacity(0.7),
  //                           Color(0xff353F54).withOpacity(0.8),
  //                         ]),
  //                         borderRadius: BorderRadius.circular(15),
  //                       ),
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Image.asset(
  //                             AssetsImages.sun,
  //                             height: 35,
  //                           ),
  //                           Text(
  //                             'Reminder Name',
  //                             style: TextStyle(color: AppColors.white),
  //                           ),
  //                           Text(
  //                             'Reminder Time',
  //                             style: TextStyle(color: AppColors.white),
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               );
  //             }),
  //       )
  //     ],
  //   ),
  // );
}

Widget reminderScreenWidget() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
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
                  const Color(0xff222834).withOpacity(0.7),
                  const Color(0xff353F54).withOpacity(0.8),
                ]),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 100,
              width: 100,
            ),
          )),
    ),
  );
}

Widget todoScreenWidget() {
  return const TodoPage()
      .animate()
      .slideX(begin: 0.5, end: 0, duration: Duration(milliseconds: 200));
}

/*ToDo page:
==============================================================================================================================
 */
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _MyTodoPageState();
}

class _MyTodoPageState extends State<TodoPage> {
  final _noteInputController = TextEditingController();
var noteslength;
@override
  void initState() {
    // TODO: implement initState
    getnotes();
    super.initState();
  }
  getnotes()async{
    noteslength=await objectbox.getNotes().length;

  }
  @override
  void dispose() {
    _noteInputController.dispose();
    super.dispose();
  }

  Container Function(BuildContext, int) _itemBuilder(List<Note> notes) =>
      (BuildContext context, int index) => Container(
            child: Card(
              clipBehavior: Clip.hardEdge,
              elevation: 0,
              color: AppColors.transparent,
              shadowColor: AppColors.transparent,
              surfaceTintColor: AppColors.transparent,
              margin: const EdgeInsets.only(bottom: 20),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: const Color.fromARGB(255, 77, 88, 113)),
                      gradient: LinearGradient(colors: [
                        const Color(0xff222834).withOpacity(0.7),
                        const Color(0xff353F54).withOpacity(0.8),
                      ]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, right: 10.0, left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 270,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  notes[index].text,
                                  style: AppStyle.headingS20W700.copyWith(
                                      shadows: [
                                        Shadow(
                                            color: AppColors.themeBlue,
                                            blurRadius: 10)
                                      ]),
                                  // Provide a Key for the integration test
                                  key: Key(
                                    'list_item_$index',
                                  ),
                                ),
                                (notes[index].comment == null ||
                                        notes[index].comment == '')
                                    ? const SizedBox.shrink()
                                    : Text(
                                        notes[index].comment ?? '',
                                        style: AppStyle.descS15W600
                                            .copyWith(color: AppColors.white2),
                                        // Provide a Key for the integration test
                                        // key: Key('list_item_$index',),
                                      ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    showDialogBox(
                                        context: context,
                                        title: 'Confirmation',
                                        content:
                                            'Are you sure you want to delete this Task?',
                                        btnText: 'Yes',
                                        onPressed: () async {
                                          objectbox.removeNote(notes[index].id);
                                        });
                                  },
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: AppColors.white,
                                  )),
                                  SizedBox(height: 25,),
                              InkWell(
                                child: Icon(
                                  Icons.edit,
                                  color: AppColors.white,
                                ),
                              )
                              // GetBuilder<MyController>(
                              //     builder: ((MyController controller) {
                              //   return Checkbox(
                              //     value: false,
                              //     onChanged: (v) {},
                              //     side: BorderSide(color: AppColors.white),
                              //   );
                              // })),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              noteslength.length==0?Text('hello'):
              StreamBuilder<List<Note>>(
                  stream: objectbox.getNotes(),
                  builder: (context, snapshot) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                      itemBuilder: _itemBuilder(snapshot.data ?? []))),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ))
      ]);
}

/* Alarm page
==============================================================================================================================
*/
class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _ALarmPageState();
}

class _ALarmPageState extends State<AlarmPage> {
  String? alarmTitle;
  DateTime? alarmTime;
  int? alarmId;

  bool switchValue = false;

  Future<void> updateAlarm(
      int id, int notiId, String time, String title, bool isActive) async {
    int hour = int.parse(time.substring(0, 2));
    int min = int.parse(time.substring(3));
    if (isActive) {
      AwesomeNotifySevices().showScheduleNotification(
          hour: hour, min: min, title: title, id: notiId);
    } else {
      AwesomeNotifySevices().cancelShaduledNotification(notiId);
    }
    await objectbox.updateAlarm(id, notiId, title, time, isActive);
  }

  Card Function(BuildContext, int) _itemBuilder(List<Alarm> alarms) {
    return (BuildContext context, int index) {
      int hour = 0;
      // bool isDay=false;
      if (alarms.isNotEmpty) {
        hour = int.parse(alarms[index].time!.substring(0, 2));
      }
      bool isDay = hour >= 6 && hour <= 18;
      return Card(
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        color: AppColors.transparent,
        shadowColor: AppColors.transparent,
        surfaceTintColor: AppColors.transparent,
        margin: const EdgeInsets.only(bottom: 20),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
            child: Container(
              width: double.infinity,
              // height: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: const Color.fromARGB(255, 77, 88, 113)),
                gradient: LinearGradient(colors: [
                  const Color(0xff222834).withOpacity(0.7),
                  const Color(0xff353F54).withOpacity(0.8),
                ]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [BoxShadow(
                        color: AppColors.white2,
                        blurRadius: 15
                      )]
                    ),
                    child: Image.asset(
                      isDay ? AssetsImages.sun : AssetsImages.moon,
                      height: 35,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        (alarms[index].title == '' ||
                                alarms[index].title == null)
                            ? const SizedBox.shrink()
                            : Text(
                                alarms[index].title ?? '',
                                style: TextStyle(color: AppColors.white).copyWith(
                                      shadows: [
                                        Shadow(
                                            color: AppColors.white,
                                            blurRadius: 10)
                                      ]),
                              ),
                        Text(
                          alarms[index].time.toString() ?? '',
                          style: AppStyle.headingS20W700.copyWith(
                                      shadows: [
                                        Shadow(
                                            color: AppColors.themeBlue,
                                            blurRadius: 10)
                                      ]),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () async {
                            showDialogBox(
                                context: context,
                                title: 'Confirmation',
                                content:
                                    'Are you sure you want to delete this Alarm',
                                btnText: 'Yes',
                                onPressed: () async {
                                  await AwesomeNotifySevices()
                                      .cancelShaduledNotification(
                                          alarms[index].notiId);
                                  objectbox.removeAlarm(alarms[index].id);
                                });
                          },
                          child: Icon(
                            Icons.delete_outline_rounded,
                            size: 30,
                            color: AppColors.white,
                          ),
                          ),
                      GetBuilder<MyController>(
                        builder: (MyController controller) {
                          return Switch(
                              value: alarms[index].isActive ?? false,
                              onChanged: (v) {
                                controller.changeSwitchValue(v);
                                // setState(() {
                                //   switchValue = v;

                                // });
                                updateAlarm(
                                    alarms[index].id,
                                    alarms[index].notiId,
                                    alarms[index].time.toString(),
                                    alarms[index].title.toString(),
                                    v);
                              });
                        },
                        // child: Switch(
                        //     value: alarms[index].isActive ?? false,
                        //     onChanged: (v) {
                        //       setState(() {
                        //         switchValue = v;

                        //       });
                        //       updateAlarm(
                        //             alarms[index].id,
                        //             alarms[index].notiId,
                        //             alarms[index].time.toString(),
                        //             alarms[index].title.toString(),
                        //             v);
                        //     }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        Expanded(
            child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              StreamBuilder<List<Alarm>>(
                  stream: objectbox.getAlarm(),
                  builder: (context, snapshot) => ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      itemCount: snapshot.hasData ? snapshot.data!.length : 0,
                      itemBuilder: _itemBuilder(snapshot.data ?? []))),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ))
      ]);
}
