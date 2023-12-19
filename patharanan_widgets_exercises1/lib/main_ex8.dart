import 'package:flutter/material.dart';
import 'package:flutter_application_demo1/app_screens/basic_listview.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Basic ListView"),
        ),
        body: const BasicListView(),
      )));
}
