import 'package:flutter/material.dart';
import 'package:flutter_task33/music_date.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'music player',
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

