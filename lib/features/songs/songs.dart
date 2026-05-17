import 'package:flutter/material.dart';

class Songs extends StatelessWidget {
  const Songs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Songs")),
      body: const Center(child: Text("Songs Page")),
    );
  }
}