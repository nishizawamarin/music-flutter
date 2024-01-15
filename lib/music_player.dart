import 'package:flutter/material.dart';
import 'package:flutter_task33/music_date.dart';

class Musicplayer extends StatefulWidget {
  const Musicplayer({Key? key,required this.musicDate , required this.selectedIndex}):super(key: key);
  final List<Map<String, dynamic>> musicDate;
  final int selectedIndex;

  @override
  State<Musicplayer> createState() => _MusicplayerState();
}

class _MusicplayerState extends State<Musicplayer> {


  double _sliderValue = 0.0;
  final Duration  _totalDuration =  const Duration(minutes: 5);
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    Duration _currentDuration = Duration(seconds: _sliderValue.toInt());
    return Scaffold(
      backgroundColor: const Color(0xff383c3c),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SafeArea(
              child: SizedBox(height: 10,),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
              widget.musicDate[widget.selectedIndex]['image'],
              width: 350,
              height: 350,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 30),
            Text(
              widget.musicDate[widget.selectedIndex]['title'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.musicDate[widget.selectedIndex]['artist'],
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 20),

            Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              thumbColor: Colors.white,
                value: _sliderValue,
              min: 0.0,
              max: _totalDuration.inSeconds.toDouble(),
                onChanged: (double value){
                setState(() {
    _sliderValue = value;
    }
    );
  },
    ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatDuration(_currentDuration),
                  style: const TextStyle(color: Colors.grey),
                ),
                Text(
                  _formatDuration(_totalDuration),
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    icon:  const Icon(Icons.skip_previous,color: Colors.white, size: 70,),
                  onPressed: (){},
                ),
                IconButton(
                icon: isPlaying ? const Icon(Icons.pause_circle, color: Colors.white, size: 70,) : const Icon(Icons.play_circle, color: Colors.white, size: 70,),
                  onPressed: (){
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                ),
                IconButton(
                    icon: const Icon(Icons.skip_next, color: Colors.white, size: 70,),
                    onPressed: (){},
                ),
              ]
            ),

          ],
        ),
      ),
    );
  }
  String _formatDuration(Duration duration) {
    int minutes = duration.inMinutes;
    int seconds = duration.inSeconds.remainder(60);
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}