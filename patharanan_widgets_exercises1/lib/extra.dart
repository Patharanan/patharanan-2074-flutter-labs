import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class LabeledButtonBox extends StatelessWidget {
  final String labelName;
  final String buttonName;

  const LabeledButtonBox(
      {required this.labelName, required this.buttonName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(255, 0, 0, 0)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            labelName,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            child: Text(buttonName),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Widget Exercise1')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabeledButtonBox(
                  labelName: 'Khon Kaen University', buttonName: 'KKU'),
              LabeledButtonBox(
                  labelName: 'University of Michigan', buttonName: 'U-M'),
              LabeledButtonBox(
                  labelName: 'Carnegie Mellon University', buttonName: 'CMU'),
            ],
          ),
        ),
      ),
    );
  }
}
