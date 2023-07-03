import 'package:app_contacts/controller/user_controller.dart';
import 'package:app_contacts/core/components/input_large.dart';
import 'package:app_contacts/core/components/primary_button.dart';
import 'package:app_contacts/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});
  @override
  State<CreateUserScreen> createState() => _CreateUserScreen();
}

class _CreateUserScreen extends State<CreateUserScreen> {
  final _controller = Modular.get<AuthController>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signup() async {
    print('Criando usuarior');
    await _controller.singUp(_nameController.text, _emailController.text,
        _passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastre-se', style: TextStyle(fontSize: 18)),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              width: 88,
              image: NetworkImage(
                  'https://pbs.twimg.com/profile_images/438771627854024704/Az4OY07a_400x400.png'),
            ),
            InputLarge(
                controller: _nameController,
                keyboardType: TextInputType.name,
                labelText: 'Nome'),
            InputLarge(
                controller: _emailController,
                keyboardType: TextInputType.name,
                labelText: 'Email'),
            InputLarge(
                controller: _passwordController,
                keyboardType: TextInputType.name,
                labelText: 'Senha'),
            PrimaryButton(
              labelText: "Cadastrar",
              onPressed: _signup,
            )
          ],
        ),
      )),
    );
  }
}
