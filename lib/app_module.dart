import 'package:app_contacts/module/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_contacts/app_controller.dart';
import 'package:app_contacts/core/database/db.dart';
import 'package:app_contacts/core/database/models/user_repository.dart';
import 'core/services/secure_store.dart';
import 'module/auth_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => DatabaseImpl()),
        Bind.lazySingleton((i) => UserRepository(i.get())),
        Bind.lazySingleton((i) => SecureStorage()),
        Bind.factory((i) => AppController(i.get(), i.get()))
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: AuthModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
