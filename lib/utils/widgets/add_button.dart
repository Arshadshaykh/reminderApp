import 'package:flutter/material.dart';

import '../../const/app_colors.dart';
import '../../const/assets_images.dart';

Widget addButton(String image,{Function()? callback}){
  return GestureDetector(
    onTap: callback??(){},
    child: Stack(
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
                      blurRadius: 40,
                      spreadRadius: 0),
                  BoxShadow(
                      offset: Offset(0, 10),
                      color: Color(0xff10141C),
                      blurRadius: 40,
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
              child: Image.asset(image),
            ),
          ],
        ),
  );
}
