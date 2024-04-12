import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:responsive_ui/app_module.dart';
import 'package:responsive_ui/app_widget.dart';

void main() async {
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
