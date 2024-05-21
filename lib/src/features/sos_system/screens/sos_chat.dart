// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SOSChatPage extends StatelessWidget {
  const SOSChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title:Text('Emergency Chat', style: TextStyle(fontSize: 20.0),),
      ) 
    );
  }
}