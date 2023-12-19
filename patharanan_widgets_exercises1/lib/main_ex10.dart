import 'package:flutter/material.dart';

import 'package:flutter_application_demo1/app_screens/list_FAB.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Form Button Dialog",
      home: Scaffold(
        appBar: AppBar(
          title: Text("FAB and SnackBar Exercise"),
        ),
        body: FAB(),
      )));
}
