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

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Your score is ${widget.choice.correct ? 1 : 0}',
            ),
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
