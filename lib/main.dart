import 'package:flutter/material.dart';
import 'package:poll_screen/screens/poll_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PollScreen(),
    );
  }
}

