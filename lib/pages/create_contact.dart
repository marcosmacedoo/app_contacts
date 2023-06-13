import 'package:app_contacts/core/components/input_large.dart';
import 'package:app_contacts/core/components/primary_button.dart';
import 'package:flutter/material.dart';

class CreateContact extends StatefulWidget {
  const CreateContact({super.key});
  @override
  State<CreateContact> createState() => _CreateContact();
}

class _CreateContact extends State<CreateContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  void _saveContact() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar contato',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.person_add_alt_1,
              size: 128,
              color: Colors.deepPurple,
            ),
            InputLarge(
                controller: _nameController,
                keyboardType: TextInputType.name,
                labelText: 'Nome'),
            InputLarge(
                controller: _lastNameController,
                keyboardType: TextInputType.name,
                labelText: 'Sobrenome'),
            InputLarge(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                labelText: 'Celular'),
            InputLarge(
                controller: _latitudeController,
                keyboardType: TextInputType.number,
                labelText: 'Latitude'),
            InputLarge(
                controller: _longitudeController,
                keyboardType: TextInputType.number,
                labelText: 'Longitude'),
            PrimaryButton(
              labelText: "Cadastrar",
              onPressed: _saveContact,
            )
          ],
        ),
      )),
    );
  }
}
