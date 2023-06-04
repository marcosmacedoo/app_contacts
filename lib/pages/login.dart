import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String _username = '';
  String _password = '';
  bool _isPasswordVisible = false;

  void _singIn() {}

  void _tooglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                width: 88,
                image: NetworkImage(
                    'https://pbs.twimg.com/profile_images/438771627854024704/Az4OY07a_400x400.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32.0),
                child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) => _username = value,
                    decoration: const InputDecoration(label: Text("Email"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_isPasswordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (value) => _password = value,
                    decoration: InputDecoration(
                        label: const Text("Senha"),
                        suffixIcon: IconButton(
                            onPressed: _tooglePasswordVisibility,
                            icon: Icon(_isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off)))),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                        onPressed: _singIn,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          backgroundColor: Colors.yellow[600],
                        ),
                        child: const Text("Entrar")),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: TextButton(
                      onPressed: () => print('Clicou'),
                      child: const Text(
                        'Cadastra-se',
                        style: TextStyle(color: Colors.green),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
