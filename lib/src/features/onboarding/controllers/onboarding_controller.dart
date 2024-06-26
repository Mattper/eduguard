import 'package:eduguard/layout.dart';
import 'package:flutter/material.dart';
import'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  //Variables
  final pageController =PageController();
  Rx<int> currentPageIndex =0.obs; 

  //Update cuurent Index when page scroll
  void updatePageIndicator(index) => currentPageIndex.value =index;

  //Jump to the specific dot selected page
  void dotNavigationOnClick(index) {
    currentPageIndex.value =index;
    pageController.jumpTo(index);
  }

  //Update current index & jump to next page
  void nextPage() {
    if (currentPageIndex.value == 4) {
      //Get.to(() => const BottomNavigationMenu());
      Get.to(() => const Layout());
    }else{
      int page =currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //Update the current index and & jump to the last page
  void skipPage() {
    // currentPageIndex.value =4;
    // pageController.jumpToPage(4);

    //Change this to skip to loginpage later
    Get.to(() => const Layout());
  }
}