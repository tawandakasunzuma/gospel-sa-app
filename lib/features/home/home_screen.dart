import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:gospel_app/services/audio_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    final featured = songs.isNotEmpty ? songs.first : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gospel Music"),
        centerTitle: true,
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // 🎧 FEATURED SECTION
                    if (featured != null)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Featured Song",
                              style: TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              featured['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              featured['artist'],
                              style: const TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () async {
                                await AudioService.playUrl(
                                  url: featured['url'],
                                  title: featured['title'],
                                );

                                setState(() {});
                              },
                              child: const Text("Play"),
                            )
                          ],
                        ),
                      ),

                    const SizedBox(height: 20),

                    // 🎵 TRENDING SECTION
                    const Text(
                      "Trending Songs",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
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
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}