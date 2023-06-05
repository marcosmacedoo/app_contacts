import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Início', style: TextStyle(fontWeight: FontWeight.bold)),
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
                'Olá, Marcos ✌️',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 128.0, left: 24.0, right: 24.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: 150,
                        height: 150,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.person, size: 24),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[600],
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
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
                        height: 150,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.map,
                            size: 24,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            textStyle:
                                const TextStyle(fontWeight: FontWeight.bold),
                            backgroundColor: Colors.yellow[600],
                          ),
                          label: const Text(
                            'Mapas',
                            style: TextStyle(fontSize: 18),
                          ),
                        ))
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
