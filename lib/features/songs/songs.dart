import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gospel_app/services/audio_service.dart';

class SongsScreen extends StatefulWidget {
  const SongsScreen({super.key});

  @override
  State<SongsScreen> createState() => _SongsScreenState();
}

class _SongsScreenState extends State<SongsScreen> {
  final supabase = Supabase.instance.client;

  List<Map<String, dynamic>> songs = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  Future<void> fetchSongs() async {
    final data = await supabase.from('songs').select();

    setState(() {
      songs = List<Map<String, dynamic>>.from(data);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Songs"),
        centerTitle: true,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];

                final isPlaying =
                    AudioService.isPlaying(song['url']);

                return Card(
                  child: ListTile(
                    leading: Icon(
                      isPlaying
                          ? Icons.graphic_eq
                          : Icons.music_note,
                    ),
                    title: Text(song['title']),
                    subtitle: Text(song['artist']),
                    trailing: Icon(
                      isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onTap: () async {
                      await AudioService.playUrl(
                        url: song['url'],
                        title: song['title'],
                      );

                      setState(() {});

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isPlaying
                                ? "Paused ${song['title']}"
                                : "Playing ${song['title']}",
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}