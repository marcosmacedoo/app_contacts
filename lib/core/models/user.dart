import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
