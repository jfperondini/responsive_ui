import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class PreviousWidget extends StatelessWidget {
  final Controller controller;

  const PreviousWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.previousSong();
      },
      tooltip: 'Previous',
      icon: const Icon(
        Icons.skip_previous,
      ),
      iconSize: 35,
    );
  }
}
