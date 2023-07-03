import 'package:app_contacts/controller/home_controller.dart';
import 'package:app_contacts/pages/contacts.dart';
import 'package:app_contacts/pages/maps.dart';
import 'package:app_contacts/pages/user_github.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Início',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 64.0),
              child: Image.network(
                'https://pbs.twimg.com/profile_images/438771627854024704/Az4OY07a_400x400.png',
                width: 88,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: Text(
                'Olá ✌️',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 128.0, left: 24.0, right: 24.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 150,
                            height: 100,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const ContactsScreen(),
                                ));
                              },
                              icon: const Icon(Icons.person, size: 24),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow[600],
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              label: const Text(
                                'Contatos',
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                        SizedBox(
                            width: 150,
                            height: 100,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Maps(),
                                ));
                              },
                              icon: const Icon(
                                Icons.map,
                                size: 24,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                backgroundColor: Colors.yellow[600],
                              ),
                              label: const Text(
                                'Mapas',
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 150,
                            height: 100,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const UserGithubScreen(),
                                ));
                              },
                              icon: const Icon(
                                Icons.account_circle,
                                size: 24,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                backgroundColor: Colors.yellow[600],
                              ),
                              label: const Text(
                                'Github',
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                        SizedBox(
                            width: 150,
                            height: 100,
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                await controller.logout();
                              },
                              icon: const Icon(Icons.person, size: 24),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow[600],
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              label: const Text(
                                'Logout',
                                style: TextStyle(fontSize: 18),
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
