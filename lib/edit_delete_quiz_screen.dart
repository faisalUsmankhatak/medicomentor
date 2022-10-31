import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:medicomentor_web/entity/quiz_model.dart';
import 'package:medicomentor_web/widget/my_field_button.dart';
import 'package:medicomentor_web/widget/my_text_field.dart';

import 'app_confiq/appColors.dart';
import 'common_screen.dart';
class EditDeleteQuizScreen extends StatefulWidget {

  const EditDeleteQuizScreen({Key? key}) : super(key: key);

  @override
  State<EditDeleteQuizScreen> createState() => _EditDeleteQuizScreenState();
}

class _EditDeleteQuizScreenState extends State<EditDeleteQuizScreen> {
  TextEditingController quizNameController = TextEditingController();
  TextEditingController moduleController = TextEditingController();
  TextEditingController subjectClassController = TextEditingController();
  TextEditingController timerController = TextEditingController();
  TextEditingController userAccessController = TextEditingController();
  List<String> testType = ["Select Test Type", "MCQS", "MODE"];
  List popList = ['Update', "Delete"];
  RxString dropDownDefaultValue = "Select Test Type".obs;
  bool isTestUpload = false;
 late String quizName;
  late String module;
  late String subjectClass;
  late String userAccess;
  late String timer;
  late String quizType;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assignTextFieldValueForUpdate();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
      body:isTestUpload?const Center(child: CircularProgressIndicator(),): SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: myIconButton(
                    myIcon: Icons.arrow_back,
                    label: "Back",
                    radius: 15,
                    backBroundColor: AppColors.whiteColor,
                    iconColor: AppColors.blueColor,
                    labalColor: AppColors.blueColor,
                    onpressed: () {
                      quizForUpdateMap.clear();
                      isShowTestPageVisible.value=!isShowTestPageVisible.value;
                    }),
              ),
              SizedBox(
                height: 15.h,
              ),
              Obx(()=>
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    quizForUpdateMap.isNotEmpty?"Update Quiz" : "Add New Quiz",
                    style: TextStyle(fontSize: 18.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(
                        width: 45.w,
                        child: const Text("Quiz Name")),
                    // SizedBox(
                    //   width: 20.w,
                    // ),
                    Expanded(
                        child: MyField(
                            controller: quizNameController,
                            label: "",
                            fillColor: AppColors.whiteColor)),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(
                        width: 45.w, child: const Text("Module")),
                    // SizedBox(
                    //   width: 20.w,
                    // ),
                    Expanded(
                        child: MyField(
                            controller: moduleController,
                            label: "",
                            fillColor: AppColors.whiteColor)),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(
                        width: 45.w,
                        child: const Text("Subject Class")),
                    Expanded(
                        child: MyField(
                            controller: subjectClassController,
                            label: "",
                            fillColor: AppColors.whiteColor)),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(
                        width: 45.w,
                        child: const Text("User Access")),
                    Expanded(
                        child: MyField(
                            controller: userAccessController,
                            label: "",
                            fillColor: AppColors.whiteColor)),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(
                        width: 45.w, child: const Text("Timer")),
                    Expanded(
                        child: MyField(
                            controller: timerController,
                            label: "",
                            fillColor: AppColors.whiteColor)),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    SizedBox(
                        width: 45.w,
                        child: const Text("Quiz Type")),
                    Expanded(
                      child: Obx(
                            () => DropdownButtonFormField<String>(
                          value: dropDownDefaultValue.value,
                          isExpanded: true,
                          decoration: InputDecoration(
                            fillColor: AppColors.texFieldColor,
                            filled: true,
                            contentPadding: const EdgeInsets.all(17),
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              borderSide: BorderSide(
                                width: 0,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  100.w,
                                ),
                                borderSide: const BorderSide(
                                    color:
                                    AppColors.texFieldColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  100.w,
                                ),
                                borderSide: const BorderSide(
                                    color:
                                    AppColors.texFieldColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  100.w,
                                ),
                                borderSide: const BorderSide(
                                    color:
                                    AppColors.texFieldColor)),
                          ),
                          borderRadius: BorderRadius.circular(10.w),
                          onChanged: (value) {
                            dropDownDefaultValue.value = value!;
                          },
                          items: testType.map((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyFieldButton(
                    buttonText:quizForUpdateMap.value.isNotEmpty? "Update":"Submit",
                    radius: 10,
                    width: 50.w,
                    onTap: () {
                      quizForUpdateMap.value.isNotEmpty?quizUpdate():stroredNewTest();
                    },
                  ),
                ],
              )
            ]),
      )
    ));
  }
void quizUpdate()async{
  getTextFieldValue();
  // String quizName = quizNameController.text.trim();
  // String module = moduleController.text.trim();
  // String subjectClass = subjectClassController.text.trim();
  // String userAccess = userAccessController.text.trim();
  // String timer = timerController.text.trim();
  // String quizType = dropDownDefaultValue.value;
  QuizModel quizeModel = QuizModel(
      quizName: quizName,
      module: module,
      subjectClass: subjectClass,
      userAccess: userAccess,
      quizType: quizType,
      timer: timer);
  Map<String,dynamic> map=quizeModel.toJson();
  try{
    setState(() {
      isTestUpload = true;
    });
    await  FirebaseFirestore.instance.collection("quiz").doc(quizForUpdateMap['id']).update(map);
    setState(() {
      isTestUpload = false;
    });
    clearTextField();
    isShowTestPageVisible.value=!isShowTestPageVisible.value;
    quizForUpdateMap.clear();
    Get.snackbar("congratulations", "Your data is Successfully Updated",snackPosition: SnackPosition.BOTTOM,);
  }on FirebaseException catch(e){
    print(e.toString());
  }


  quizForUpdateMap.clear();
}
void getTextFieldValue(){
  quizName = quizNameController.text.trim();
  module = moduleController.text.trim();
  subjectClass = subjectClassController.text.trim();
  userAccess = userAccessController.text.trim();
  timer = timerController.text.trim();
  quizType = dropDownDefaultValue.value;
}
  void stroredNewTest() async {
    setState(() {
      isTestUpload = true;
    });
    print("helo");
    getTextFieldValue();
    // String quizName = quizNameController.text.trim();
    // String module = moduleController.text.trim();
    // String subjectClass = subjectClassController.text.trim();
    // String userAccess = userAccessController.text.trim();
    // String timer = timerController.text.trim();
    // String quizType = dropDownDefaultValue.value;
   
    dropDownDefaultValue.value = "Select Test Type";
    QuizModel quizeModel = QuizModel(
        quizName: quizName,
        module: module,
        subjectClass: subjectClass,
        userAccess: userAccess,
        quizType: quizType,
        timer: timer);
    try {
      await QuizModel.collection().add(quizeModel);
      setState(() {
        isTestUpload = false;
      });
      clearTextField();
      Get.snackbar("congratulations", "Your data is Successfully Stored",snackPosition: SnackPosition.BOTTOM,);
    } on FirebaseException catch (e) {
      print(e);
    }
  }
  void assignTextFieldValueForUpdate(){
    if(quizForUpdateMap.value.isNotEmpty){
      int find=0;
      testType[0]=quizForUpdateMap['quizType'];
      dropDownDefaultValue.value=testType[0];
      for(int i=1;i<3;i++){
        if(testType[i]==quizForUpdateMap['quizType']){
          testType[i]="Select Test Type";
        }
      }

      quizNameController.text=quizForUpdateMap['quizName'];
      moduleController.text=quizForUpdateMap['module'];
      subjectClassController.text=quizForUpdateMap['subjectClass'];
      timerController.text=quizForUpdateMap['timer'];
      userAccessController.text=quizForUpdateMap['userAccess'];


    }
  }
  void clearTextField(){
    timerController.clear();
    userAccessController.clear();
    subjectClassController.clear();
    moduleController.clear();
    quizNameController.clear();
  }
}
