import 'package:app_contacts/core/services/secure_store.dart';
import 'package:uuid/uuid.dart';

class HomeRepository {
  final SecureStorage storage;
  HomeRepository(this.storage);

  Future<void> delete() async {
    await storage.delete('user_id');
  }
}
