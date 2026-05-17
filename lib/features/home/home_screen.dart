import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gospel App'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Songs"),
            onTap: () {},
          ),

          ListTile(
            title: const Text("Artists"),
            onTap: () {},
          ),

          ListTile(
            title: const Text("Bible"),
            onTap: () {},
          ),

          ListTile(
            title: const Text("Charts"),
            onTap: () {},
          ),

          ListTile(
            title: const Text("Sponsorships"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}