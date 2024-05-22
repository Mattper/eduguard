import 'package:eduguard/src/common_widgets/appbar.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      //Custom Appbar
      appBar: CustomAppBar(
          showBackArrow: true,
          title: Text('Settings', style: TextStyle(fontSize: 20.0),),
        ),
      );


    
  }
}