import 'package:app_contacts/controller/contact_controller.dart';
import 'package:app_contacts/controller/home_controller.dart';
import 'package:app_contacts/core/database/models/contact_repository.dart';
import 'package:app_contacts/core/database/models/home_repository.dart';
import 'package:app_contacts/core/services/secure_store.dart';
import 'package:app_contacts/pages/contacts.dart';
import 'package:app_contacts/pages/create_contact.dart';
import 'package:app_contacts/pages/home.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_controller.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => HomeController(
              i.get<AppController>(),
              i.get<HomeRepository>(),
            )),
        Bind.singleton((i) => HomeRepository(i.get<SecureStorage>())),
        Bind.singleton((i) => ContactController(i.get<AppController>(),
            i.get<SecureStorage>(), i.get<ContactRepository>())),
        Bind((i) => ContactRepository(i.get()))
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
        ChildRoute('/createcontacts',
            child: (context, args) => const CreateContact())
      ];
}
