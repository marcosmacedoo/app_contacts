import 'package:app_contacts/core/database/models/contact_repository.dart';
import 'package:app_contacts/core/models/contact.dart';
import 'package:app_contacts/core/services/secure_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uuid/uuid.dart';

import '../app_controller.dart';
import '../core/models/user.dart';

class ContactController {
  final ContactRepository repository;
  final SecureStorage storage;
  final AppController controller;

  ContactController(this.controller, this.storage, this.repository);

  ValueNotifier<List<Contact>> contact = ValueNotifier([]);

  Future<void> createContact(String name, String phone, String lastname,
      double latitude, double longitude) async {
    final userId = await storage.read('user_id');
    final Contact contact = Contact(
        name: name,
        phone: phone,
        id: const Uuid().v4(),
        latitude: latitude,
        longitude: longitude,
        userId: userId!);
    await repository.insertContact(contact);
  }

  Future<Contact?> detailContact(String id) async {
    final Contact? detailContact = await repository.detailContact(id);
    return detailContact;
  }

  Future<void> updateContact(Contact updContact) async {
    await repository.updateContact(updContact);
  }

  Future<void> deleteContact(String id) async {
    await repository.deleteContact(id);
  }

  Future<void> fetchContacts() async {
    contact.value = await repository.fetchContacts();
  }
}
