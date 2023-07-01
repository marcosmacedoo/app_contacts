import 'package:app_contacts/controller/user_controller.dart';
import 'package:app_contacts/core/components/input_large.dart';
import 'package:app_contacts/core/components/primary_button.dart';
import 'package:app_contacts/pages/create_user.dart';
import 'package:app_contacts/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isPasswordVisible = false;
  final _controller = Modular.get<AuthController>();

  void _singIn() async {
    await _controller.logIn(_username.text, _password.text, context);
  }

  void _tooglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          reverse: true, // Form ficar visível
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: 88,
                  image: NetworkImage(
                      'https://pbs.twimg.com/profile_images/438771627854024704/Az4OY07a_400x400.png'),
                ),
                InputLarge(
                    controller: _username,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Email"),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextField(
                      controller: _password,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_isPasswordVisible,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                          label: const Text("Senha"),
                          suffixIcon: IconButton(
                              onPressed: _tooglePasswordVisibility,
                              icon: Icon(_isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)))),
                ),
                PrimaryButton(
                  labelText: "Entrar",
                  onPressed: _singIn,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 56.0),
                  child: Text('Não possui uma conta?'),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Builder(builder: (context) {
                      return TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CreateUserScreen(),
                            ));
                          },
                          child: const Text(
                            'Crie uma agora',
                            style: TextStyle(color: Colors.green),
                          ));
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
