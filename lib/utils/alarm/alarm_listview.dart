// import 'package:flutter/material.dart';
// import 'package:reminder/const/font_styles.dart';
// import 'package:reminder/controller/object_box.dart';
// import 'package:reminder/model/alarm_model.dart';
// import 'package:reminder/utils/alarm/alarm_card.dart';

// import '../../main.dart';

// class AlarmListVeiw extends StatefulWidget {
//   const AlarmListVeiw({super.key});

//   @override
//   State<AlarmListVeiw> createState() => _AlarmListVeiwState();
// }

// class _AlarmListVeiwState extends State<AlarmListVeiw> {


//   AlarmCard Function(BuildContext,int) _itemBuilder(List<Alarm> alarm){
//     return (context,index){
//       return AlarmCard(alarm: alarm[index],);
//     };
//   } 

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<Alarm>>(
//         stream: objectbox.getAlarms(),
//         builder: (context, snapshot) {
//           if (snapshot.data?.isEmpty ?? false) {
//             return ListView.builder(
//                 shrinkWrap: true,
//                 itemCount: snapshot.hasData ? snapshot.data!.length : 0,
//                 itemBuilder: _itemBuilder(snapshot.data??[]));
//           }
//           else{
//             return Center(child: Text('Press + button to add alarms',style: AppStyle.headingS20W700,),);

//           }
//         });
//   }
// }
