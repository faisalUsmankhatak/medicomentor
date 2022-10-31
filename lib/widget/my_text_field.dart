import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_confiq/appColors.dart';
import '../app_confiq/app_styles.dart';
class MyField extends StatelessWidget {
  TextEditingController controller;
  String label;
  String? suffixIcon;
  String? prefixIcon;
  Color? fillColor;
  GestureTapCallback? suffixIconTab;
  bool? obscureText;
  MyField({required this.controller, required this.label, this.suffixIcon, this.prefixIcon,
    this.fillColor,this.suffixIconTab,this.obscureText});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:suffixIconTab ,
      child: TextFormField(
          controller: controller,
          obscureText: obscureText??false,
          decoration: InputDecoration(
            label: Text(label),
            //hintText: label,
            fillColor:fillColor??AppColors.texFieldColor,

            filled: true,
            labelStyle: AppStyles.formLabelStyle(),
           // prefixIcon:Padding(padding: EdgeInsets.only(left: 1.w)),
            // prefixIcon==null?const SizedBox(width: 1,):Padding(
            //   padding:  EdgeInsets.only(bottom: 6.h),
            //   child: Container(
            //     width: 19.w,height: 15.h,
            //     decoration:  BoxDecoration(
            //         image: DecorationImage(image: AssetImage(prefixIcon!))
            //     ),
            //   ),
            // ),
            suffixIcon: suffixIcon==null?const SizedBox(width:2 ,height: 2,):GestureDetector(
              onTap: suffixIconTab,
              child: Container(
                width: 19.w,height: 15.h,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(suffixIcon!))),
              ),
            ),
            disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.w,),
                borderSide: const BorderSide(color: AppColors.texFieldColor)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.w,),
                borderSide: const BorderSide(color:AppColors.texFieldColor)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.w,),
                borderSide: const BorderSide(color: AppColors.texFieldColor)),

          )
      ),
    );
  }
}


