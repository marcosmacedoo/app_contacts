import 'package:app_contacts/core/database/models/contact_repository.dart';
import 'package:app_contacts/core/services/secure_store.dart';

import '../../../core/models/contact.dart';

class MapsRepository {
  final ContactRepository repository;
  final SecureStorage storage;
  MapsRepository(this.repository, this.storage);

  Future<List<Contact>> searchAllContacts() async {
    final userId = await storage.read('user_id');
    final List<Contact> contact = await repository.getAllContacts(userId!);
    if (contact.isEmpty) {
      return [];
    }
    return contact;
  }
}
