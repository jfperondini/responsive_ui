import 'package:flutter/material.dart';
import 'package:responsive_ui/cors/shared/config/size_config.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext context) buildMobile;
  final Widget Function(BuildContext context) buildTablet;
  final Widget Function(BuildContext context) buildDesktop;

  const ResponsiveWidget({super.key, required this.buildMobile, required this.buildTablet, required this.buildDesktop});

  @override
  Widget build(BuildContext context) {
    final SizeConfig sizeConfig = SizeConfig(context);

    if (sizeConfig.isMobile) {
      return buildMobile(context);
    } else if (sizeConfig.isTablet) {
      return buildTablet(context);
    } else {
      return buildDesktop(context);
    }
  }
}
