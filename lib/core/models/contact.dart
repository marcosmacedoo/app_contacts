import 'dart:convert';

class Contact {
  final String id;
  final String name;
  final String lastname;
  final String phone;
  final double latitude;
  final double longitude;
  final String userId;
  Contact(
      {required this.name,
      required this.lastname,
      required this.phone,
      required this.id,
      required this.latitude,
      required this.longitude,
      required this.userId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'user_id': userId,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as String,
      userId: map['user_id'] as String,
      lastname: map['lastname'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }
}
