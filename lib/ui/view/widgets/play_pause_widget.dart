import 'package:flutter/material.dart';
import 'package:responsive_ui/cors/shared/widgets/icon_button_widget.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class PlayPauseWidget extends StatelessWidget {
  final Controller controller;
  final double iconSize;
  const PlayPauseWidget({super.key, required this.controller, required this.iconSize});

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      onPressed: () {
        controller.togglePlayPause();
      },
      tooltip: controller.isPlaying ? 'Pause' : 'Play',
      itsSomething: controller.isPlaying,
      iconTrue: Icons.pause_circle_outline,
      iconFalse: Icons.play_circle_outline,
      iconSize: iconSize,
    );
  }
}
