import 'package:flutter/material.dart';

class ScreenWidget extends StatelessWidget {
  final Color color;
  final String current;

  const ScreenWidget({super.key, required this.current, required this.color});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: color,
        child: Center(
          child: Text(
            current,
            style: const TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}
