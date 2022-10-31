import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicomentor_web/app_confiq/appColors.dart';
import 'package:medicomentor_web/home_page/test_screen.dart';

import '../common_screen.dart';
import '../edit_delete_quiz_screen.dart';
import 'articles_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RxInt currentPage = 0.obs;
  List<Widget> pages = [Obx(()=> isShowTestPageVisible.value?const TestScreen(): const EditDeleteQuizScreen()), const ArticlesScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          backgroundColor: AppColors.backBroundColor,
          currentIndex: currentPage.value,
          onTap: (val){
            currentPage.value=val;
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.filter_tilt_shift), label: "Quiz"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Tests")
          ],
        ),
      ),
      body: Obx(()=> pages[currentPage.value])
    ),

    );
  }
}
