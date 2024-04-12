import 'package:flutter/material.dart';
import 'package:responsive_ui/cors/shared/widgets/icon_button_widget.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class RandomOrderWidget extends StatelessWidget {
  final Controller controller;
  const RandomOrderWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      onPressed: () {
        controller.toggleShuffle();
      },
      tooltip: 'Random Order',
      itsSomething: controller.isShuffle,
      iconTrue: Icons.shuffle_on_outlined,
      iconFalse: Icons.shuffle,
      iconSize: 35,
    );
  }
}
