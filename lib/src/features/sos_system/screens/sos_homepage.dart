// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eduguard/src/common_widgets/appbar.dart';
import 'package:eduguard/src/features/sos_system/screens/sos_chat.dart';
import 'package:eduguard/src/features/sos_system/screens/sos_location.dart';
import 'package:eduguard/src/features/sos_system/screens/sos_settings.dart';
import 'package:flutter/material.dart';

class SOSHomePage extends StatefulWidget {
  const SOSHomePage({super.key});

  @override
  State<SOSHomePage> createState() => _SOSHomePageState();
}

class _SOSHomePageState extends State<SOSHomePage> {
  IconData _currentIcon =Icons.shield_outlined;
  bool _showTextContainer =false;

  void _toggleIcon(){
    setState(() {
      _currentIcon =_currentIcon == Icons.shield_outlined ? Icons.hearing_outlined : Icons.shield_outlined;
      _showTextContainer =!_showTextContainer; 
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Custom Appbar
      appBar: CustomAppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello from sos home page, Matteo Perera...', style: TextStyle(fontSize: 14.0, color:Colors.grey),),
            Text('Emergency SOS System.', style: TextStyle(fontSize: 16.0),)
          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text("Emergency Contacts", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  IconButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SOSSettings()),  
                      );
                  }, icon: Icon(Icons.settings))
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 100, 0, 100),
              color: Colors.red,
              child: IconButton(
                padding: EdgeInsets.all(80.0),
                iconSize: 72,
                color: Colors.white,
                icon: Icon(_currentIcon),
                onPressed: () {
                  _toggleIcon();
                },
              ),
            ),

            if(_showTextContainer)
              SizedBox(
                width: 200,
                child: Column(
                  children: [
                    Text('App is Listening...', style: TextStyle(fontSize: 20.0),),
                    ElevatedButton(onPressed: () {}, child: Text('Cancel', style: TextStyle(fontSize: 10.0),))
                  ],
                ),
              ),


            if(!_showTextContainer)
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //Location Icon
                    IconButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SOSLocationPage()),  
                      );
                    },
                    icon: Icon(
                      Icons.pin_drop_outlined
                      ), 
                      iconSize: 48,
                    ),
                    
                    //Call Icon
                    IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined),iconSize: 48,),

                    //Chat Icon
                    IconButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SOSChatPage())
                      );
                    }, 
                      icon: Icon(
                        Icons.message_outlined
                        ),
                        iconSize: 48,
                    ),
                  ],
                ),
              ),
          ],
        ),
    
      ),
    );
  }
}