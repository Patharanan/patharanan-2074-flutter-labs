import 'package:flutter/material.dart';
import 'package:flutter_application_demo1/app_screens/long_list_exercise.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Form Button Dialog",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Long ListView"),
        ),
        body: getListView(),
      )));
}
