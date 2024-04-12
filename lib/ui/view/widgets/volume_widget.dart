import 'package:flutter/material.dart';
import 'package:responsive_ui/cors/shared/widgets/icon_button_widget.dart';
import 'package:responsive_ui/ui/controller/controller.dart';

class VolumeWidget extends StatelessWidget {
  final Controller controller;

  const VolumeWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButtonWidget(
      onPressed: () {
        controller.toggleVolume();
      },
      itsSomething: controller.isVolume,
      iconTrue: Icons.volume_off,
      iconFalse: Icons.volume_up,
      iconSize: 25,
    );
  }
}
