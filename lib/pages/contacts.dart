import 'package:app_contacts/controller/contact_controller.dart';
import 'package:app_contacts/core/components/card_contact.dart';
import 'package:app_contacts/core/models/contact.dart';
import 'package:app_contacts/pages/create_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreen();
}

class _ContactsScreen extends State<ContactsScreen> {
  final _controller = Modular.get<ContactController>();

  @override
  void initState() {
    _controller.fetchContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus contatos',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.yellow,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateContact()));
          },
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add)),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: _controller.contact,
            builder:
                (BuildContext context, List<Contact> value, Widget? child) {
              return value.isEmpty
                  ? const Center(
                      child: Text('Adicione seus contatos'),
                    )
                  : ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return CardContact(
                            name: value[index].name,
                            phone: value[index].phone,
                            id: value[index].id);
                      },
                    );
            }),
      ),
    );
  }
}
