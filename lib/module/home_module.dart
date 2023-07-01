import 'package:app_contacts/controller/home_controller.dart';
import 'package:app_contacts/pages/contacts.dart';
import 'package:app_contacts/pages/home.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_contacts/controller/home_controller.dart';
//import 'package:maps/app/modules/home/home_repository.dart';
//import 'package:maps/app/modules/home/pages/contacts_page.dart';
//import 'package:maps/app/modules/home/pages/detail_contact.dart';

import '../../app_controller.dart';
import '../core/services/secure_store.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeController(
              i.get<AppController>(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, args) => const HomeScreen(),
        ),
        ChildRoute(
          '/contacts',
          child: (context, args) => const ContactsScreen(),
        ),
      ];
}
