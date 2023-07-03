import 'dart:async';
import 'package:app_contacts/core/services/secure_store.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/contact.dart';
import '../db.dart';

class ContactRepository {
  final DatabaseImpl _database;
  final SecureStorage storage;
  ContactRepository(this._database, this.storage);

  Future<void> insertContact(Contact contact) async {
    final db = await _database.database;

    await db.insert(
      'contacts',
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

// retornar um contato
  Future<Contact> detailContact(String id) async {
    final db = await _database.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );

    return Contact.fromMap(maps.first);
  }

//realizar update em um contato
  Future<void> updateContact(Contact updcontact) async {
    final db = await _database.database;

    await db.update(
      'contacts',
      updcontact.toMap(),
      where: 'id = ?',
      whereArgs: [updcontact.id],
    );
  }

  Future<void> deleteContact(String id) async {
    final db = await _database.database;
    await db.delete('contacts', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Contact>> getAllContacts(String id) async {
    final db = await _database.database;

    List<Map<String, dynamic>> items =
        await db.query('contacts', where: 'user_id = ?', whereArgs: [id]);

    return List.generate(
      items.length,
      (i) => Contact(
          id: items[i]['id'],
          phone: items[i]['phone'],
          latitude: items[i]['latitude'],
          longitude: items[i]['longitude'],
          name: items[i]['name'],
          userId: items[i]['user_id']),
    );
  }

  Future<List<Contact>> fetchContacts() async {
    final userId = await storage.read("user_id");
    final db = await _database.database;

    List<Map<String, dynamic>> items =
        await db.query('contacts', where: 'user_id = ?', whereArgs: [userId]);
    print(items);
    return List.generate(
      items.length,
      (i) => Contact(
          id: items[i]['id'],
          name: items[i]['name'],
          phone: items[i]['phone'],
          latitude: items[i]['latitude'],
          longitude: items[i]['longitude'],
          userId: items[i]['user_id']),
    );
  }
}
