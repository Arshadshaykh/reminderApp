import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reminder/const/app_colors.dart';
import 'package:reminder/const/font_styles.dart';
import 'package:reminder/controller/getx_controller.dart';

import '../const/assets_images.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//   final Color backgroundColor;

//   const CustomAppBar({
//     required this.title,
//     required this.backgroundColor,
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Stack(
//             alignment: Alignment.center,
//             children: [
//               Container(
//                 width: 44,
//                 height: 44,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [
//                       Color.fromARGB(255, 110, 228, 255),
//                       Color.fromARGB(221, 29, 26, 233)
//                     ],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   boxShadow: const [
//                     BoxShadow(
//                         offset: Offset(0, -20),
//                         color: Color(0xff2B3445),
//                         blurRadius: 30,
//                         spreadRadius: 0),
//                     BoxShadow(
//                         offset: Offset(0, 20),
//                         color: Color(0xff10141C),
//                         blurRadius: 30,
//                         spreadRadius: 0)
//                   ],
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               Container(
//                 height: 40,
//                 width: 40,
//                 padding: EdgeInsets.all(11),
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [AppColors.themeBlue, AppColors.themePurple],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Image.asset(AssetsImages.backArrowBtn),
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 20,
//           ),
//           Text(
//             title,
//             style: TextStyle(
//                 color: AppColors.white,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 20),
//             textAlign: TextAlign.center,
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(kToolbarHeight);
// }

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final bool? wantLeading,wantAction;
  final Color backgroundColor;
  final double elevation;
  final List<Widget>? actions;

  const CustomAppBar2({
    required this.backgroundColor,
    required this.elevation,
    this.wantLeading,
    this.wantAction,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: wantLeading==true ?Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 110, 228, 255),
                  Color.fromARGB(221, 29, 26, 233)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, -20),
                    color: Color(0xff2B3445),
                    blurRadius: 30,
                    spreadRadius: 0),
                BoxShadow(
                    offset: Offset(0, 20),
                    color: Color(0xff10141C),
                    blurRadius: 30,
                    spreadRadius: 0)
              ],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: 40,
            width: 40,
            padding: EdgeInsets.all(11),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.themeBlue, AppColors.themePurple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(AssetsImages.backArrowBtn),
          ),
        ],
      ):SizedBox.shrink(),
      title: GetBuilder<MyController>(
        builder: (MyController controller) {
          return Text(
            controller.appBarTitle,
            style: AppStyle.headingS20W700,
          );
        },
      ),
      actions: wantAction==true ?actions:[],
      backgroundColor: backgroundColor,
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}