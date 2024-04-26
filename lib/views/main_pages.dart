import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:reminder/const/font_styles.dart';
import 'package:reminder/controller/getx_controller.dart';
import '../const/app_colors.dart';
import '../const/assets_images.dart';
import '../custom_paint/pinted_bottom_bar.dart';
import '../main.dart';
import '../model/models.dart';

MyController controller = Get.find();

Widget alarmScreenWidget() {
  return const AlarmPage().animate()
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
                          width: 2, color: const Color.fromARGB(255, 77, 88, 113)),
                      gradient: LinearGradient(colors: [
                        const Color(0xff222834).withOpacity(0.7),
                        const Color(0xff353F54).withOpacity(0.8),
                      ]),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: InkWell(
                      focusColor: AppColors.transparent,
                      highlightColor: AppColors.transparent,
                      splashColor: AppColors.transparent,
                      onTap: () => objectbox.removeNote(notes[index].id),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 18.0, right: 10.0, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              notes[index].text,
                              style: AppStyle.headingS20W700,
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
                                    style: AppStyle.descS15W600,
                                    // Provide a Key for the integration test
                                    // key: Key('list_item_$index',),
                                  ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text(
                                'Added on ${notes[index].dateFormat}',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ],
                        ),
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


  Card Function(BuildContext, int) _itemBuilder(List<Alarm> alarms) =>
      (BuildContext context, int index) => Card(
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
                      Image.asset(
                        AssetsImages.sun,
                        height: 35,
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
                                    style: TextStyle(color: AppColors.white),
                                  ),
                            Text(
                              alarms[index].time.toString() ?? '',
                              style: AppStyle.headingS20W700,
                            ),
                          ],
                        ),
                      ),
                      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              objectbox.removeAlarm(alarms[index].id);
                            },
                            child: Icon(Icons.close_rounded,color: AppColors.white,)),
                          Switch(
                              value: alarms[index].isActive ?? false,
                              onChanged: (v) {
                                setState(() {
                                  alarms[index].isActive = v;
                                });
                              }),
                        ],
                      )
                    ],
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
