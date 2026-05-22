import 'package:just_audio/just_audio.dart';

class AudioService {
  static final AudioPlayer player = AudioPlayer();

  static String? currentUrl;

  static Future<void> playUrl(String url) async {
    if (currentUrl == url && player.playing) {
      await player.pause();
      return;
    }

    if (currentUrl == url && player.processingState == ProcessingState.ready) {
      await player.play();
      return;
    }

    currentUrl = url;
    await player.setUrl(url);
    await player.play();
  }

  static Future<void> stop() async {
    await player.stop();
    currentUrl = null;
  }

  static bool isPlayingUrl(String url) {
    return currentUrl == url && player.playing;
  }
}