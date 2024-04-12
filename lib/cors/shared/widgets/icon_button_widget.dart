import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final Function()? onPressed;
  final String? tooltip;
  final bool itsSomething;
  final IconData iconTrue;
  final IconData iconFalse;
  final double iconSize;

  const IconButtonWidget({
    super.key,
    this.onPressed,
    required this.itsSomething,
    this.tooltip,
    required this.iconTrue,
    required this.iconFalse,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: itsSomething
          ? Icon(
              iconTrue,
            )
          : Icon(
              iconFalse,
            ),
      iconSize: iconSize,
    );
  }
}
