import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<User> user;

  @override
  void initState() {
    super.initState();
    user = fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exercise2 by Patharanan 2074")),
      body: FutureBuilder<User>(
        future: user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Name: ${snapshot.data!.name}",
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 6, 41, 102)),
                  ),
                  Text("Company: ${snapshot.data!.company}",
                      style: TextStyle(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 6, 41, 102))),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

Future<User> fetchUser() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users/1"));
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = convert.jsonDecode(response.body);
    return User(
      name: data["name"],
      company: data["company"]["name"],
      id: data["id"],
    );
  } else {
    throw Exception("Failed to fetch user");
  }
}

class User {
  final String name;
  final String company;
  final int id;

  User({required this.name, required this.company, required this.id});
}
