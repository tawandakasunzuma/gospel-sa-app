import 'package:flutter/material.dart';
import 'package:gospel_app/services/audio_service.dart';

class SongsScreen extends StatelessWidget {
  const SongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Songs"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _SongTile(
            title: "Amazing Grace",
            artist: "Traditional",
          ),
          _SongTile(
            title: "How Great Thou Art",
            artist: "Hymn",
          ),
          _SongTile(
            title: "Holy Spirit",
            artist: "Jesus Culture",
          ),
          _SongTile(
            title: "Way Maker",
            artist: "Sinach",
          ),
        ],
      ),
    );
  }
}

class _SongTile extends StatelessWidget {
  final String title;
  final String artist;

  const _SongTile({
    required this.title,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.music_note),
        title: Text(title),
        subtitle: Text(artist),
        trailing: const Icon(Icons.play_arrow),

        onTap: () async {
          const url =
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

          await AudioService.playUrl(url);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Playing $title")),
          );
        },
      ),
    );
  }
}