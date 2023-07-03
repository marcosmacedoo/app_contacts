import 'package:app_contacts/controller/map_controller.dart';
import 'package:app_contacts/core/database/models/map_repository.dart';
import 'package:app_contacts/pages/maps.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MapsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => MapsController(i.get())),
        Bind((i) => MapsRepository(i.get(), i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const Maps()),
      ];
}
