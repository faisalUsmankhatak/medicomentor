import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medicomentor_web/app_confiq/appColors.dart';
import 'package:medicomentor_web/widget/my_field_button.dart';


RxBool isShowTestPageVisible=true.obs;

RxMap<dynamic,dynamic> quizForUpdateMap={}.obs;

Widget myIconButton(
    {required IconData myIcon,
    required String label,
    required double radius,
    Color? backBroundColor,
    Color? labalColor,
    Color? iconColor,
    VoidCallback? onpressed}) {
  return ElevatedButton.icon(
    onPressed: onpressed,
    icon: Icon(myIcon, color: iconColor ?? AppColors.whiteColor),
    label: Text(label,
        style: TextStyle(color: labalColor ?? AppColors.whiteColor)),
    style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: backBroundColor ?? AppColors.blueColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius))),
  );
}

Future<void> myAlert(String status, String id) async {
  RxBool isRecordDelete = true.obs;
  return await Get.defaultDialog(

      content: const Text("Alert Message"),
      title: "Are you shure you want to $status",
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => ElevatedButton(
                onPressed: () async {
                  isRecordDelete.value = false;
                  await FirebaseFirestore.instance
                      .collection("quiz")
                      .doc(id)
                      .delete();
                  isRecordDelete.value =  !isRecordDelete.value;
                  isShowTestPageVisible.value=false;
                  isShowTestPageVisible.value=true;
                  Get.back();
                  // isShowAllTestVisible.value = true;
                  Get.snackbar("congratulations", "Your data is Successfully Deleted",snackPosition: SnackPosition.BOTTOM,);
                },
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 11.w, vertical: 14.5.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3.w)))
                ),
                child: isRecordDelete.value
                    ? const Text("Ok")
                    :  Center(
                        child: SizedBox(
                            height: 20.h,
                            width: 10.w,
                            child: const CircularProgressIndicator(color: AppColors.whiteColor,)),
                      ),
              ),
            ),

            SizedBox(
              width: 10.w,
            ),
            MyFieldButton(
              buttonText: "No",
              width: 30.w,
              onTap: () {
                Get.back();
              },
              height: 30.h,
            ),
          ],
        )
      ]);
}
