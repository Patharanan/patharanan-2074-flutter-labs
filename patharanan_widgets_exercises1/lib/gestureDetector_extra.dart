import 'package:flutter/material.dart';
import './app_screens/gesture_detector_stateful.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter layout tutorial',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Gesture Detector tutorial'),
            ),
            body: const Center(child: MyGestureDetector())));
  }
}
