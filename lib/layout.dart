import 'package:eduguard/src/common_widgets/bottom_navigation_bar.dart';
import 'package:eduguard/src/common_widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController =Get.put(NavigationController());
    final navigationDrawerController =Get.put(NavigationDrawerController());    

    return Scaffold(
      key: navigationDrawerController.scaffoldKey,
      drawer: const CustomNavigationDrawer(),
      body: Obx(() => navigationController.screens[navigationController.selectedIndex.value]),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}