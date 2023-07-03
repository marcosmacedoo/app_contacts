import 'package:app_contacts/core/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserGithubScreen extends StatefulWidget {
  const UserGithubScreen({super.key});

  @override
  State<UserGithubScreen> createState() => UserGithub();
}

class UserGithub extends State<UserGithubScreen> {
  String avatar = '';
  String name = '';
  String username = '';
  bool is_user_loaded = false;

  _getUser() async {
    var api_url = Uri.parse("https://api.github.com/users/" + username);
    http.Response response;

    response = await http.get(api_url);

    // print('Status code' + response.statusCode.toString());
    // print('Body' + response.body);

    Map<String, dynamic> data = json.decode(response.body);

    setState(() {
      name = data['name'];
      avatar = data['avatar_url'];
      is_user_loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Github')),
      body: Container(
        padding: const EdgeInsets.only(top: 64.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  label: Text('Nome de usuário'),
                ),
                keyboardType: TextInputType.name,
                onChanged: (value) => {username = value},
              ),
              PrimaryButton(
                labelText: "Buscar",
                onPressed: () {
                  _getUser();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: is_user_loaded
                    ? Card(
                        elevation: 4,
                        child: ListTile(
                          leading: Image.network(avatar),
                          title: Text(name),
                          subtitle: Text(username),
                        ),
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
