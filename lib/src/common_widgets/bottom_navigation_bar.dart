import 'package:eduguard/src/features/sos_system/screens/sos_homepage.dart';
import 'package:eduguard/src/features/sos_system/screens/testpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(NavigationController());

    return Obx(
        () => NavigationBar(
          height: 80.0,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value =index,
          backgroundColor: Colors.white,
          indicatorColor: Colors.grey.withOpacity(0.2),
          destinations: const <NavigationDestination>[
            NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.school_rounded), label: 'Education'),
            NavigationDestination(icon: Icon(Icons.article_rounded), label: 'Blogs'),
            NavigationDestination(icon: Icon(Icons.quiz_rounded), label: 'Questionnare'),
            NavigationDestination(icon: Icon(Icons.medical_information_rounded), label: 'Health'),
          ],
        ),
      );
      //body: Obx(() => controller.screens[controller.selectedIndex.value]),
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex =0.obs; 

  final screens = [
    const SOSHomePage(),
    const TestPage(),
    //(Container(color: Colors.orange,)),
    //const PredictionPage(),
    //(Container(color: Colors.green,)),
    (Container(color: Colors.red,)),
    (Container(color: Colors.blue,)),
    (Container(color: Colors.purple,)),
  ];

}