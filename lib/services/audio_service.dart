import 'package:just_audio/just_audio.dart';

class AudioService {
  static final AudioPlayer player = AudioPlayer();

  static String? currentUrl;
  static String? currentTitle;

  static Future<void> playUrl({
    required String url,
    required String title,
  }) async {
    // pause if same song is playing
    if (currentUrl == url && player.playing) {
      await player.pause();
      return;
    }

    // resume if paused same song
    if (currentUrl == url && !player.playing) {
      await player.play();
      return;
    }

    currentUrl = url;
    currentTitle = title;

    await player.setUrl(url);
    await player.play();
  }

  static bool isPlaying(String url) {
    return currentUrl == url && player.playing;
  }
}