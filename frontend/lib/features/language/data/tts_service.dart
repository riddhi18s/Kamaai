import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSService {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> initialize() async {
    await _tts.setSpeechRate(0.45);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
  }

  /// Speaks [text] in [languageCode]. [onComplete] is optional and, when
  /// provided, fires once playback finishes — used by the UI to reset
  /// "isSpeaking" state accurately instead of guessing with a timer.
  static Future<void> speak({
    required String text,
    required String languageCode,
    VoidCallback? onComplete,
  }) async {
    await _tts.setLanguage(languageCode);

    await _tts.stop();

    if (onComplete != null) {
      _tts.setCompletionHandler(onComplete);
    }

    await _tts.speak(text);
  }

  static Future<void> stop() async {
    await _tts.stop();
  }
}