import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late SharedPreferences _prefs;
  late Map<String, dynamic> _userData;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    _prefs = await SharedPreferences.getInstance();
    String userDataJson = _prefs.getString('userData') ?? '{}';
    setState(() {
      _userData = json.decode(userDataJson);
      _usernameController.text = _userData['username'] ?? '';
      _passwordController.text = _userData['password'] ?? '';
    });
  }

  _saveData() async {
    String userDataJson = json.encode({
      'username': _usernameController.text,
      'password': _passwordController.text,
    });
    _prefs.setString('userData', userDataJson);

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String filePath = prefs.getKeys().contains('userDataFilePath')
        ? prefs.getString('userDataFilePath')!
        : 'userData.json';

    _prefs.setString('userDataFilePath', filePath);

    // Write the JSON to a file
    final file = File(filePath);
    await file.writeAsString(userDataJson);
    print('File Path: $filePath');
  }

  _login() {
    _saveData();
    String filePath = _prefs.getString('userDataFilePath') ?? 'Not found';
    final snackBar = SnackBar(
      content: Text(
          'Username: ${_usernameController.text}\nPassword: ${_passwordController.text}\nFile Path: $filePath'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
