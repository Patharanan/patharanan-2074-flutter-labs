import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fetch Albums",
      theme: ThemeData(primaryColor: Colors.pink),
      home: const MyHomePage(title: "Fetch Albums"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Album> _albums = [];

  void getData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    http.Response response = await http.get(url);
    debugPrint("url is " + url.toString());
    if (response.statusCode == 200) {
      setState(() {
        _albums = (json.decode(response.body) as List)
            .map((data) => Album.fromJson(data))
            .toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(_albums.length.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _albums.length,
        itemBuilder: (context, index) => ListItem(_albums[index]),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Album album;

  ListItem(this.album);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${album.id}. ${album.title}"),
    );
  }
}
