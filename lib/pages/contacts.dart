import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus contatos',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: const Center(child: Text('Tela de contatos')),
    );
  }
}
