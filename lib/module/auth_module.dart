import 'package:app_contacts/pages/splash.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:app_contacts/controller/user_controller.dart';
import 'package:app_contacts/pages/login.dart';
import 'package:app_contacts/pages/create_user.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => AuthController(i.get(), i.get()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute,
            child: (context, args) => const SplashPage()),
        ChildRoute('/login', child: (context, args) => const LoginPage()),
        ChildRoute('/signup',
            child: (context, args) => const CreateUserScreen()),
      ];
}
