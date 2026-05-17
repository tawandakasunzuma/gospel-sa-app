import 'package:flutter/material.dart';

class BibleScreen extends StatelessWidget {
  const BibleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bible"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          _BookTile(title: "Genesis"),
          _BookTile(title: "Exodus"),
          _BookTile(title: "Psalms"),
          _BookTile(title: "Proverbs"),
          _BookTile(title: "Matthew"),
          _BookTile(title: "Mark"),
          _BookTile(title: "Luke"),
          _BookTile(title: "John"),
        ],
      ),
    );
  }
}

class _BookTile extends StatelessWidget {
  final String title;

  const _BookTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.menu_book),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Open $title (next step)")),
          );
        },
      ),
    );
  }
}