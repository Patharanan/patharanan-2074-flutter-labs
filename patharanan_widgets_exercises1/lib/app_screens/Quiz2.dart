import 'package:flutter/material.dart';

class Question {
  final String question;
  final String image;
  final List<Choice> choices;

  Question(
      {required this.question, required this.image, required this.choices});
}

class Choice {
  final String text;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool correct;
  bool selected;

  Choice({
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.correct,
    this.selected = false,
  });
}

class QuestionWidget extends StatelessWidget {
  final Question question;

  const QuestionWidget({
    Key? key,
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          question.question,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        screenW <= 600 ? SizedBox(height: 50) : SizedBox(height: 0),
        screenW <= 600
            ? Image.asset(
                'asset/KKU-SMART-TRANSIT.JPG',
                height: 220,
                width: 300,
                fit: BoxFit.cover,
              )
            : Image.asset(
                'asset/KKU-SMART-TRANSIT.JPG',
                height: 150,
                width: 250,
                fit: BoxFit.cover,
              ),
        screenW <= 600 ? SizedBox(height: 100) : SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  screenW <= 600
                      ? ChoiceWidget(
                          choice: question.choices[0],
                        )
                      : ChoiceWidget(
                          choice: question.choices[0],
                          boxHeight: 50,
                          boxWidth: 355,
                        ),
                  SizedBox(height: 10),
                  screenW <= 600
                      ? ChoiceWidget(
                          choice: question.choices[1],
                        )
                      : ChoiceWidget(
                          choice: question.choices[1],
                          boxHeight: 50,
                          boxWidth: 355),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  screenW <= 600
                      ? ChoiceWidget(
                          choice: question.choices[2],
                        )
                      : ChoiceWidget(
                          choice: question.choices[2],
                          boxHeight: 50,
                          boxWidth: 355,
                        ),
                  SizedBox(height: 10),
                  screenW <= 600
                      ? ChoiceWidget(
                          choice: question.choices[3],
                        )
                      : ChoiceWidget(
                          choice: question.choices[3],
                          boxHeight: 50,
                          boxWidth: 355,
                        )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ChoiceWidget extends StatefulWidget {
  final Choice choice;
  final double boxWidth;
  final double boxHeight;

  const ChoiceWidget({
    Key? key,
    required this.choice,
    this.boxWidth = 170,
    this.boxHeight = 80,
  }) : super(key: key);

  @override
  _ChoiceWidgetState createState() => _ChoiceWidgetState();
  //_ScorePage() createState() => Score();
}

class ScorePage extends StatelessWidget {
  final Choice choice;

  const ScorePage({Key? key, required this.choice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Score Report'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your score is ${choice.correct ? 1 : 0}',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChoiceWidgetState extends State<ChoiceWidget> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor = widget.choice.selected
        ? (widget.choice.correct ? Colors.green : Colors.red)
        : widget.choice.backgroundColor;

    return GestureDetector(
      onTap: () {
        setState(() {
          widget.choice.selected = true;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScorePage(choice: widget.choice),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        width: widget.boxWidth,
        height: widget.boxHeight,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.choice.text,
          style: TextStyle(
            color: widget.choice.foregroundColor,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
