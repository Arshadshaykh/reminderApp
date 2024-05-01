import 'package:flutter/material.dart';
import 'package:reminder/const/app_colors.dart';
import 'package:reminder/const/font_styles.dart';

Future<void> showDialogBox({
  BuildContext? context,
  required String title,
  required String content,
  required String btnText,
  required Function onPressed,
}) async {
  await showDialog(
      context: context!,
      builder: (BuildContext BuildContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0.0,
          backgroundColor: AppColors.scaffoldBG,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.themeBlue, width: 1),
            ),
            // height: MediaQuery.of(context).size.height / 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,style: AppStyle.headingS20W700,),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: AppColors.darkgrey,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(content,style: AppStyle.descS15W600,),
                SizedBox(height: 20,),
                ElevatedButton(onPressed: ()async{
                  onPressed();
                  Navigator.pop(context);
                },child: Text(btnText),)
              ],
            ),
          ),
        );
      });
}
