import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import'package:http/http.dart' as http;

class SpeechEmotionDetectionAPIService {
  final String apiUrl ="http://10.0.2.2:5000/predict";

  Future<String> uploadAudio(String filepath) async {
    final request =http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.files.add(await http.MultipartFile.fromPath('audio', filepath));

    final response =await request.send();
    
    if (response.statusCode == 200) {
      final responseData =await response.stream.toBytes();
      final responseString =String.fromCharCodes(responseData);
      final jsonReponse =jsonDecode(responseString);

      log('Predicted Emotion: ${jsonReponse['predicted_emotion']}');
    
      return jsonReponse['predicted_emotion'];
    }
    else{
    
      throw Exception('Failed to get emotion Prediction');
    }
  }
}
