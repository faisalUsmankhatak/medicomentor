import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_confiq/appColors.dart';

class MyFieldButton extends StatelessWidget {
  GestureTapCallback? onTap;
  String? buttonText;
double? height;
double? radius;
double? width;
double? fontSize;
Color? bodyColor;

  MyFieldButton({this.onTap, this.buttonText, this.height, this.radius,
    this.width, this.fontSize,this.bodyColor});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.white,
     borderRadius: BorderRadius.circular(10.0),
      child: Ink(
        width: width,
        height:height??45.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??10),
         color: bodyColor?? AppColors.blueColor

        ),
        child: Center(child: Text(buttonText??"Button",style:  TextStyle(color: AppColors.whiteColor,
        fontSize: fontSize??15.sp)),),
      ),

    );
  }


}
