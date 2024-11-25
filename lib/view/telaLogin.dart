// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provap2/control/autenticacaoFIrebase.dart';
import 'package:provap2/view/telaprincipal.dart';

class telalogin extends StatelessWidget {
  const telalogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
  }
  
  class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();}

  class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AutenticacaoFirebase auth = AutenticacaoFirebase();

  @override
  void initState() {
    super.initState();
    _validaLogin();
  }

  void _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Chama o método de login e recebe a mensagem de resultado
    String message = await auth.signInWithEmailPassword(email, password);

    // Exibe um Snackbar com a mensagem de resultado
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    _validaLogin();
  }
  
  void _register() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Chama o método de registro e recebe a mensagem de resultado
    String message = await auth.registerWithEmailPassword(email, password);

    // Exibe um Snackbar com a mensagem de resultado
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    _validaLogin();
  }

  void _loginWithGoogle() async {
    // Chama o método de login com Google e recebe a mensagem de resultado
    String message = await auth.signInWithGoogle();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
    _validaLogin();
  }

  void _validaLogin() async {
    if (await auth.isUserLoggedIn()) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _register,
              child: Text('Registrar'),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _loginWithGoogle,
              child: Text('Entrar com Google'),
            ),
          ],
        ),
      ),
    );
  }
}

