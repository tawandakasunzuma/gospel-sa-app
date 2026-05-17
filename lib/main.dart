import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';

void main() {
  runApp(const GospelApp());
}

class GospelApp extends StatelessWidget {
  const GospelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gospel App',
      home: const HomeScreen(),
    );
  }
}