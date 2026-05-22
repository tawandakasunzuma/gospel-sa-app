import 'package:flutter/material.dart';
import 'package:gospel_app/services/audio_service.dart';

class MiniPlayer extends StatefulWidget {
  const MiniPlayer({super.key});

  @override
  State<MiniPlayer> createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  @override
  Widget build(BuildContext context) {
    final title = AudioService.currentTitle;

    if (title == null) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Row(
        children: [
          const Icon(Icons.music_note, color: Colors.white),
          const SizedBox(width: 10),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          IconButton(
            icon: Icon(
              AudioService.player.playing
                  ? Icons.pause
                  : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () async {
              if (AudioService.player.playing) {
                await AudioService.player.pause();
              } else {
                await AudioService.player.play();
              }

              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}