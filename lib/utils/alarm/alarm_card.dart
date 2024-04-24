// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:reminder/model/alarm_model.dart';

// import '../../const/app_colors.dart';
// import '../../const/assets_images.dart';

// class AlarmCard extends StatefulWidget {
//   final Alarm alarm;
//   const AlarmCard({super.key, required this.alarm});

//   @override
//   State<AlarmCard> createState() => _AlarmCardState();
// }

// class _AlarmCardState extends State<AlarmCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       clipBehavior: Clip.hardEdge,
//       elevation: 0,
//       color: AppColors.transparent,
//       shadowColor: AppColors.transparent,
//       surfaceTintColor: AppColors.transparent,
//       margin: EdgeInsets.only(bottom: 20),
//       child: ClipRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
//           child: Container(
//             width: double.infinity,
//             // height: 200,
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               border:
//                   Border.all(width: 2, color: Color.fromARGB(255, 77, 88, 113)),
//               gradient: LinearGradient(colors: [
//                 Color(0xff222834).withOpacity(0.7),
//                 Color(0xff353F54).withOpacity(0.8),
//               ]),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   AssetsImages.sun,
//                   height: 35,
//                 ),
//                 Text(
//                   'Reminder Name',
//                   style: TextStyle(color: AppColors.white),
//                 ),
//                 Text(
//                   'Reminder Time',
//                   style: TextStyle(color: AppColors.white),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
