import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/models/user.dart';
import '../core/services/secure_store.dart';
import 'package:uuid/uuid.dart';
import '../core/database/models/user_repository.dart';

class AuthController {
  final UserRepository repository;
  final SecureStorage storage;
  AuthController(this.repository, this.storage);

  Future<void> singUp(
      String name, String email, String password, BuildContext context) async {
    try {
      final User user = User(
          id: const Uuid().v4().toString(),
          name: name,
          email: email,
          password: password);
      await repository.inserUser(user);
      storage.write('user_id', user.id);
      Modular.to.navigate('/home');
    } catch (e) {
      showSnackBar(BuildContext context) async {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Email ou Senha Incorreta"),
        ));
      }
    }
  }

  Future<void> logIn(
      String email, String password, BuildContext context) async {
    try {
      final user = await repository.getUser(email, password);

      await storage.write('user_id', user[0].id);
      Modular.to.navigate('/home');
    } catch (e) {
      showSnackBar(BuildContext context) async {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Email ou Senha Incorreta"),
        ));
      }
    }
  }

  Future<void> checkeToken() async {
    final userId = await storage.read('user_id');
    if (userId == null) {
      Modular.to.navigate('/login');
    } else {
      final user = await repository.getUserFromId(userId);
      user.isEmpty
          ? Modular.to.navigate('/login')
          : Modular.to.navigate('/home');
    }
  }
}
