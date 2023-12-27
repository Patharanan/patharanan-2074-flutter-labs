import 'package:flutter/material.dart';
import 'package:flutter_application_demo1/app_screens/faculty_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FacultyListScreen(),
    );
  }
}
