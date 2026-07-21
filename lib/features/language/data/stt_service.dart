import 'package:flutter/foundation.dart';
import 'package:speech_to_text/speech_to_text.dart';

class STTService {
  static final SpeechToText _speech = SpeechToText();

  static Future<bool> initialize() async {
    try {
      return await _speech.initialize(
        onStatus: (status) {
          debugPrint("STT STATUS: $status");
        },
        onError: (error) {
          debugPrint("STT ERROR: ${error.errorMsg}");
        },
        debugLogging: kDebugMode,
      );
    } catch (e) {
      debugPrint("STT INITIALIZATION ERROR: $e");
      return false;
    }
  }


  static Future<List<LocaleName>> getAvailableLanguages() async {
    try {
      return await _speech.locales();
    } catch (e) {
      debugPrint(
        "STT LOCALE ERROR: $e",
      );

      return [];
    }
  }


  static Future<void> startListening({
    required Function(String text) onResult,
    String localeId = "en_IN",
    VoidCallback? onComplete,
  }) async {

    try {

      if (_speech.isListening) {
        await _speech.stop();
      }


      await _speech.listen(

        localeId: localeId,

        listenMode:
            ListenMode.confirmation,

        partialResults: true,

        cancelOnError: true,


        listenFor:
            const Duration(
          seconds: 10,
        ),


        pauseFor:
            const Duration(
          seconds: 3,
        ),


        onResult: (result) {

          final text =
              result.recognizedWords.trim();


          if (text.isEmpty) {
            return;
          }


          debugPrint(
            "Recognized: $text",
          );


          onResult(text);



          if (result.finalResult) {

            _speech.stop();


            if (onComplete != null) {
              onComplete();
            }

          }

        },

      );

    } catch (e) {

      debugPrint(
        "STT LISTEN ERROR: $e",
      );


      if (onComplete != null) {
        onComplete();
      }

    }
  }



  static Future<void> stopListening() async {

    try {

      if (_speech.isListening) {
        await _speech.stop();
      }

    } catch (e) {

      debugPrint(
        "STT STOP ERROR: $e",
      );

    }
  }



  static Future<void> cancelListening() async {

    try {

      if (_speech.isListening) {
        await _speech.cancel();
      }

    } catch (e) {

      debugPrint(
        "STT CANCEL ERROR: $e",
      );

    }
  }



  static bool get isListening =>
      _speech.isListening;
}