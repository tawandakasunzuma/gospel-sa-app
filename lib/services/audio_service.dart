import 'package:just_audio/just_audio.dart';

class AudioService {
  static final AudioPlayer player = AudioPlayer();

  static Future<void> playUrl(String url) async {
    await player.setUrl(url);
    await player.play();
  }

  static Future<void> stop() async {
    await player.stop();
  }
}