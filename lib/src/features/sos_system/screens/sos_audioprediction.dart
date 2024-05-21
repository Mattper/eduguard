// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:eduguard/src/features/sos_system/handle_api.dart';
import 'package:eduguard/src/features/sos_system/handle_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PredictionPage extends StatefulWidget {
  const PredictionPage({super.key});

  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {

  AudioRecorderService _audioRecorder =AudioRecorderService();
  SpeechEmotionDetectionAPIService _emotionService =SpeechEmotionDetectionAPIService();
  String _predictedEmotion ='Unknown';

  void _predictEmotion() async {
    try {
      await _audioRecorder.startRecording();
      await Future.delayed(Duration(seconds: 5));
      String filePath =await _audioRecorder.stopRecording();
      String predictedEmotion =await _emotionService.uploadAudio(filePath);
      setState(() {
        _predictedEmotion =predictedEmotion;
      });

    } catch (error) {
        log("$error");
     
      setState(() {
        _predictedEmotion ="Something went wrong...";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Predicted Emotion: $_predictedEmotion'),
            ElevatedButton(
                onPressed: _predictEmotion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  )
                ), 
                child: Text('Record', style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  ),
                )
              ),
          ],
        ),
      ),
    );
  }
}