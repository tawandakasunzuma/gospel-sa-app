import 'package:flutter/material.dart';

class Bible extends StatelessWidget {
  const Bible({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bible")),
      body: const Center(child: Text("Bible Page")),
    );
  }
}