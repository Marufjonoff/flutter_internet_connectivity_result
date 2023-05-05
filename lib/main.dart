import 'package:flutter/material.dart';
import 'package:flutter_internet_connectivity_result/screens/connection_checker_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConnectionCheckerDemo()
    );
  }
}

