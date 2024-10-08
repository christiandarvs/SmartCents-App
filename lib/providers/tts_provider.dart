// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class TTSProvider extends ChangeNotifier {
//   final FlutterTts _flutterTts = FlutterTts();
//   bool _isSpeaking = false;

//   bool get isSpeaking => _isSpeaking;

//   TTSProvider() {
//     _initializeTts();
//   }

//   void _initializeTts() {
//     // Set the default TTS settings here
//     _flutterTts.setLanguage("en-US");
//     _flutterTts.setPitch(1.0);
//     _flutterTts.setSpeechRate(0.5);

//     // Listen to TTS completion and change state
//     _flutterTts.setCompletionHandler(() {
//       _isSpeaking = false;
//       notifyListeners();
//     });
//   }

//   Future<void> speak(String text) async {
//     if (text.isNotEmpty) {
//       _isSpeaking = true;
//       notifyListeners();
//       await _flutterTts.speak(text);
//     }
//   }

//   Future<void> stop() async {
//     await _flutterTts.stop();
//     _isSpeaking = false;
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     _flutterTts.stop();
//     super.dispose();
//   }
// }
