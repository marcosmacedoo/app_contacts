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

  Future<void> createContact(String name, String phone, String lastname,
      double latitude, double longitude) async {
    final userId = await storage.read('user_id');
    final Contact contact = Contact(
        name: name,
        lastname: lastname,
        phone: phone,
        id: const Uuid().v4(),
        latitude: latitude,
        longitude: longitude,
        userId: userId!);

    await repository.insertContact(contact);

    Modular.to.canPop();
  }

  Future<Contact?> detailContact(String id) async {
    final Contact? detailContanct = await repository.detailContact(id);
    return detailContanct;
  }

  Future<void> updateContact(Contact updContact) async {
    await repository.updateContact(updContact);
  }

  Future<void> deleteContact(String id) async {
    await repository.deleteContact(id);
  }
}
