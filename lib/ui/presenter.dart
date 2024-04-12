import 'package:flutter/material.dart';
import 'package:responsive_ui/cors/shared/config/responsive_widget.dart';
import 'package:responsive_ui/ui/controller/controller.dart';
import 'package:responsive_ui/ui/view/page_desktop.dart';
import 'package:responsive_ui/ui/view/page_mobile.dart';
import 'package:responsive_ui/ui/view/page_tablet.dart';

class Presenter extends StatefulWidget {
  final Controller controller;
  const Presenter({super.key, required this.controller});

  @override
  State<Presenter> createState() => _PresenterState();
}

class _PresenterState extends State<Presenter> {
  Controller get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return ResponsiveWidget(
          buildMobile: (context) => PageMobile(
            current: currentWidth.toString(),
            controller: controller,
          ),
          buildTablet: (context) => PageTablet(
            current: currentWidth.toString(),
            controller: controller,
          ),
          buildDesktop: (context) => PageDesktop(
            current: currentWidth.toString(),
            controller: controller,
          ),
        );
      },
    );
  }
}
