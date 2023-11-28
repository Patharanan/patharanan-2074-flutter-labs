import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class ItemCounter extends StatefulWidget {
  final String name;
  const ItemCounter(this.name, {Key? key}) : super(key: key);

  @override
  ItemCounterState createState() => ItemCounterState();
}

class ItemCounterState extends State<ItemCounter> {
  int _rndNumber1 = 0;
  int _rndNumber2 = 0;
  int _Num1PlusNum2 = 0;

  void _generateRandomNumber() {
    final random = Random();
    setState(() {
      _rndNumber1 = random.nextInt(10) + 1;
      _rndNumber2 = random.nextInt(10) + 1;
      _Num1PlusNum2 = _rndNumber1 + _rndNumber2;
    });
  }

  @override
  Widget build(BuildContext context) {
    String name = widget.name;
    return GestureDetector(
      onTap: () {
        setState(() {
          _generateRandomNumber();
        });
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(fontSize: 30.0),
            ),
            Text(
              "$_rndNumber1"
              " + "
              "$_rndNumber2"
              " = "
              "$_Num1PlusNum2",
              style: const TextStyle(
                backgroundColor: Colors.lightBlue,
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StatefulWidget: Counter",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("StatefulWidget: Counter"),
        ),
        body: ItemCounter("Patharanan 2074"),
      ),
    );
  }
}
