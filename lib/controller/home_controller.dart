import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../app_controller.dart';
import '../core/models/user.dart';

class HomeController {
  final AppController controller;

  ValueNotifier<User> user = ValueNotifier(
      User(id: 'id', name: 'name', email: 'email', password: 'password'));

  HomeController(this.controller);

  Future<void> whoIsMyUser() async {
    user.value = await controller.howMyUser();
  }
}
