import '/app_module.dart';
import 'package:app_contacts/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
