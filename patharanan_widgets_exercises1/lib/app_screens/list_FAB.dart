import 'package:flutter/material.dart';
import 'package:flutter_application_demo1/app_screens/long_list_exercise2.dart';

class FAB extends StatefulWidget {
  const FAB({Key? key}) : super(key: key);

  @override
  FABState createState() => FABState();
}

class FABState extends State<FAB> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Current counter value is $_counter")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getListView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
        tooltip: "Incrementing the counter",
      ),
    );
  }
}
