import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../core/database/models/home_repository.dart';
import '../app_controller.dart';
import '../core/models/user.dart';

class HomeController {
  final HomeRepository repository;
  final AppController controller;

  ValueNotifier<User> user = ValueNotifier(
      User(id: 'id', name: 'name', email: 'email', password: 'password'));

  HomeController(this.controller, this.repository);

  Future<void> whoIsMyUser() async {
    user.value = await controller.howMyUser();
  }

  Future<void> logout() async {
    await repository.delete();
    Modular.to.navigate('/login');
  }
}
