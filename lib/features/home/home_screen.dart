import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/bible'),
              child: const Text("Go to Bible"),
            ),
            ElevatedButton(
              onPressed: () => context.go('/songs'),
              child: const Text("Go to Songs"),
            ),
          ],
        ),
      ),
    );
  }
}