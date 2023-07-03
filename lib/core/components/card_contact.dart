import 'package:app_contacts/controller/contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardContact extends StatelessWidget {
  final String name;
  final String phone;
  final String id;

  CardContact(
      {super.key, required this.name, required this.phone, required this.id});

  final _controller = Modular.get<ContactController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Card(
            elevation: 0,
            child: ListTile(
              // leading: const Icon(Icons.person),
              title: Text(name),
              subtitle: Text(phone),
              // iconColor: Theme.of(context).colorScheme.inverseSurface,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        _controller.deleteContact(id);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                ],
              ),
            )),
      ),
    );
  }
}
