import 'package:flutter/material.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: Colors.yellow,
      ),
      body: const Center(child: Text('Tela de cadastro')),
    );
  }
}
