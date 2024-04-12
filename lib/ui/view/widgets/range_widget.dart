import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class RangeWidget extends StatelessWidget {
  final Controller controller;

  const RangeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.playList[controller.currentSongIndex].title,
          style: const TextStyle(fontSize: 28),
        ),
        Text(
          controller.playList[controller.currentSongIndex].artist,
          style: const TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
