import 'package:flutter/material.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class NextWidget extends StatelessWidget {
  final Controller controller;

  const NextWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.nextSong();
      },
      tooltip: 'Next',
      icon: const Icon(
        Icons.skip_next,
      ),
      iconSize: 35,
    );
  }
}
