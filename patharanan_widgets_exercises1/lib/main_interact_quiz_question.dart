import 'package:flutter/material.dart';
import 'package:flutter_application_demo1/app_screens/Quiz3.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: screenW <= 600
              ? AppBar(
                  title: Text('Question 1'),
                )
              : null,
          body: Padding(
            padding: EdgeInsets.only(top: 50, bottom: 50),
            child: QuestionWidget(
              question: Question(
                question: 'Where is this picture?',
                image: 'asset/KKU-SMART-TRANSIT.JPG',
                choices: [
                  Choice(
                      text: 'Chiang Mai University',
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      correct: false),
                  Choice(
                      text: 'Khon Kaen University',
                      backgroundColor: Color.fromARGB(255, 255, 255, 21),
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                      correct: true),
                  Choice(
                      text: 'Chulalongkorn University',
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                      correct: false),
                  Choice(
                      text: 'Mahidol University',
                      backgroundColor: Color.fromARGB(255, 149, 9, 149),
                      foregroundColor: Colors.white,
                      correct: false),
                ],
              ),
            ),
          )),
    );
  }
}
