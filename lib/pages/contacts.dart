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
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.yellow,
          child: const Icon(Icons.add)),
      body: Center(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        children: [
          Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Marcos Macedo'),
                subtitle: const Text('(86) 9 9502-8103'),
                iconColor: Theme.of(context).colorScheme.inverseSurface,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.indigo,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}
