import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicomentor_web/app_confiq/appColors.dart';

import '../common_screen.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  TextEditingController quizNameController = TextEditingController();
  TextEditingController moduleController = TextEditingController();
  TextEditingController subjectClassController = TextEditingController();
  TextEditingController timerController = TextEditingController();
  TextEditingController userAccessController = TextEditingController();
  List<String> testType = ["Select Test Type", "MCQS", "MODE"];
  List popList = ['Update', "Delete"];
  RxString dropDownDefaultValue = "Select Test Type".obs;
  bool isTestUpload = false;

  Future<QuerySnapshot<Map<String, dynamic>>> querySnapshot =
      FirebaseFirestore.instance.collection("quiz").get();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.backBroundColor,
      body: Obx(()=> isShowTestPageVisible.value?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),

               Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: myIconButton(
                      myIcon: Icons.add,
                      label: "Add new Quiz",
                      labalColor: AppColors.blueColor,
                      iconColor: AppColors.blueColor,
                      backBroundColor: AppColors.whiteColor,
                      onpressed: () {
                        quizForUpdateMap.value.clear();
                        isShowTestPageVisible.value = !isShowTestPageVisible.value;
                      },
                      radius: 20.w)),

            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child: FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection("quiz").get(),
              builder: (context, shanshot) {
                if (shanshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (shanshot.hasError) {
                  return Text(shanshot.error.toString());
                }
                return ListView.separated(
                  itemCount: shanshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return cutomCard(
                        shanshot.data!.docs[index]['quizName'],
                        shanshot.data!.docs[index].id,
                        shanshot.data!.docs[index]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 10.h,
                    );
                  },
                );
              },
            )),
          ],
        ):SizedBox()
      ),

    ));
  }

  Widget cutomCard(
      String qName, String id, QueryDocumentSnapshot<Object?> object) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        decoration: const BoxDecoration(
            // color: AppColors.whiteColor
            ),
        height: 50.h,
        child: Card(
            elevation: 2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.h),
                child: Row(
                  children: [
                    Text(object['quizName']),
                    const Expanded(child: SizedBox()),
                    const Text("4 Page"),
                    SizedBox(
                      width: 60.w,
                    ),
                    PopupMenuButton(onSelected: (val) {
                      if (val == "Update") {
                        quizForUpdateMap.value = {
                          "quizName": object['quizName'],
                          "module": object['module'],
                          "subjectClass":object['subjectClass'],
                          "userAccess":object['userAccess'],
                          "quizType":object['quizType'],
                          "timer":object['timer'],
                       "id":object.reference.id
                        };
                        isShowTestPageVisible.value=!isShowTestPageVisible.value;
                      } else if (val == "Delete") {
                        myAlert(val.toString(), id);
                      }
                    }, itemBuilder: (context) {
                      return popList.map((e) {
                        return PopupMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      }).toList();
                    }),
                    // const Icon(Icons.more_vert)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
