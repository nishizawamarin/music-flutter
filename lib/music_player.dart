import 'package:flutter/material.dart';
import 'package:flutter_task33/music_date.dart';

class musicplayer extends StatefulWidget {
  const musicplayer({super.key});

  @override
  State<musicplayer> createState() => _musicplayerState();
}

class _musicplayerState extends State<musicplayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: ()=>Navigator.of(context).pop(),

            ),
          ],
        ),
      ),
    );
  }
}
