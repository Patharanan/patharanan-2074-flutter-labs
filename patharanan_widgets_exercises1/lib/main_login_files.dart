import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter login',
      theme: ThemeData(primaryColor: Colors.purpleAccent),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/login_data.json');
      if (await file.exists()) {
        final contents = await file.readAsString();
        final json = jsonDecode(contents);
        setState(() {
          _usernameController.text = json['username'] ?? '';
          _passwordController.text = json['password'] ?? '';
        });
      }
    } catch (e) {
      print("Error loading login data: $e");
    }
  }

  _saveData(String username, String password) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/login_data.json');
      final json = jsonEncode({'username': username, 'password': password});
      await file.writeAsString(json);
      print(file.path);
    } catch (e) {
      print("Error saving login data: $e");
    }
  }

  _handleLoginButton() async {
    String username = _usernameController.text;
    String password = _passwordController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Username: $username Password: $password"),
      ),
    );

    await _saveData(username, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(Icons.people),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _handleLoginButton,
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
