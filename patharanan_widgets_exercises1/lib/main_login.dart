import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  String _savedUsername = "";
  String _savedPassword = "";

  @override
  void initState() {
    super.initState();
    _loadSavedUsername();
    _loadSavedPassword();
  }

  _loadSavedUsername() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _savedUsername = prefs.getString("Username") ?? "No username";
      _usernameController.text = _savedUsername;
    });
  }

  _saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("Username", username);
    _loadSavedUsername();
  }

  _loadSavedPassword() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _savedPassword = prefs.getString("Password") ?? "No password";
      _passwordController.text = _savedPassword;
    });
  }

  _savePassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("Password", password);
    _loadSavedPassword();
  }

  _handleLoginButton() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Username: $username Password: $password"),
      ),
    );

    _saveUsername(username);
    _savePassword(password);
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
