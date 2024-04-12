import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class SliderMusicWidget extends StatelessWidget {
  final Controller controller;
  final Color color;
  const SliderMusicWidget({super.key, required this.controller, required this.color});

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: controller.playList.isNotEmpty ? controller.playList[controller.currentSongIndex].duration : 0,
      value: controller.currentPositionSong,
      onChanged: (value) {
        controller.seekToSong(value);
      },
      activeColor: Colors.white,
      inactiveColor: color,
    );
  }
}
