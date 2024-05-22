import 'package:eduguard/src/common_widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title,  this.showBackArrow =false, this.leadingIcon, this.actions, this.leadingOnPressed}) : super(key: key);

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;


  @override
  Widget build(BuildContext context) {
    final controller =Get.put(NavigationDrawerController());

    return AppBar(
        automaticallyImplyLeading: false,
        // leading: showBackArrow
        //   ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back_rounded))
        //   : leadingIcon != null ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon, color: Colors.black,), iconSize: 28.0,) : null,
        // leading: showBackArrow
        //   ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black,), iconSize: 28.0,)
        //   : IconButton(onPressed: () {}, icon: const Icon(Icons.menu_rounded, color: Colors.black,), iconSize: 28.0,),
        // leading: Builder(
        //   builder: (context) {
        //     return showBackArrow
        //       ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black,), iconSize: 28.0,)
        //       : IconButton(onPressed: () {Scaffold.of(context).openDrawer();}, icon: const Icon(Icons.menu_rounded, color: Colors.black,), iconSize: 28.0,);
        //   },  
        // ),
        leading: Builder(
          builder: (context) {
            return showBackArrow
              ? IconButton(onPressed: () => Get.back(), icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black,), iconSize: 28.0,)
              : IconButton(onPressed: () {controller.openNavigationDrawer();}, icon: const Icon(Icons.menu_rounded, color: Colors.black,), iconSize: 28.0,);
          },  
        ),
        title: title,
        actions: actions,
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(kToolbarHeight);
}