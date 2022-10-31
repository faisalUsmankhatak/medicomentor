import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicomentor_web/app_confiq/appColors.dart';

import '../widget/my_text_field.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  TextEditingController testNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backBroundColor,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w),
            child: Text("Test hinzufugen",style: TextStyle(fontSize: 18.sp),),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor,

                ),

              ),]
            ),
          ),
            SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),  SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Text("Test Name"),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                    child: MyField(
                        controller: testNameController,
                        label: "",
                        fillColor: AppColors.whiteColor)),
                SizedBox(
                  height: 10.h,
                ),

              ],
            ),
          ),


        ]),
      ),
    ));
  }
}
