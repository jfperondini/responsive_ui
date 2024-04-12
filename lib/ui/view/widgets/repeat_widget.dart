import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class RepeatWidget extends StatelessWidget {
  final Controller controller;

  const RepeatWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.toggleRepeat();
      },
      tooltip: controller.tooltipTextRepeat,
      icon: Icon(
        controller.currentIcon,
      ),
      iconSize: 35,
    );
  }
}
