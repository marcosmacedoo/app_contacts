import 'package:app_contacts/core/database/models/map_repository.dart';
import 'package:app_contacts/core/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app_contacts/core/models/contact.dart';

class MapsController {
  final MapsRepository repository;
  GoogleMapController? mapController;
  ValueNotifier<Contact> contact = ValueNotifier(Contact(
      id: 'id',
      latitude: 0,
      longitude: 0,
      name: 'name',
      userId: 'user_id',
      phone: '0'));
  ValueNotifier<Set<Marker>> markers = ValueNotifier(<Marker>{});

  MapsController(this.repository);

  Future<void> listenAllMarkers() async {
    final contacts = await repository.searchAllContacts();
    if (contacts.isNotEmpty) {
      contacts
          .map((e) => {
                print(e.latitude),
                print(e.longitude),
                markers.value.add(
                  Marker(
                      markerId: MarkerId(
                        e.id,
                      ),
                      infoWindow: InfoWindow(title: e.name, snippet: e.phone),
                      position: LatLng(e.latitude, e.longitude)),
                ),
              })
          .toList();
    }
  }
}
