import 'package:flutter/material.dart';

class Artists extends StatelessWidget {
  const Artists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Artists")),
      body: const Center(child: Text("Artists Page")),
    );
  }
}