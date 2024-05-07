// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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

      body: Container(
        margin: EdgeInsets.fromLTRB(20, 30, 20, 10),
        //color: Colors.red[50],

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text("Emergency Contacts", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  IconButton(onPressed: () {}, icon: Icon(Icons.settings))
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
              Container(
                width: 200,
                child: Column(
                  children: [
                    Text('App is Listeining...', style: TextStyle(fontSize: 20.0),),
                    ElevatedButton(onPressed: () {}, child: Text('Cancel', style: TextStyle(fontSize: 10.0),))
                  ],
                ),
              ),


            if(!_showTextContainer)
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.pin_drop_outlined), iconSize: 48,),
                    IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined),iconSize: 48,),
                    IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined),iconSize: 48,),
                  ],
                ),
              ),
          ],
        ),
    
      ),
    );
  }
}