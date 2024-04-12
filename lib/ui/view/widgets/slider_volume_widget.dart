import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class SliderVolumeWidget extends StatelessWidget {
  final Controller controller;
  final Color color;

  const SliderVolumeWidget({super.key, required this.controller, required this.color});

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 1,
      value: controller.currentPositionVolume,
      onChanged: (value) {
        controller.seekToVolume(value);
      },
      activeColor: Colors.white,
      inactiveColor: color,
    );
  }
}
