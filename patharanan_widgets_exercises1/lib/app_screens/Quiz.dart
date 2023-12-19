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

  Choice({
    required this.text,
    required this.backgroundColor,
    required this.foregroundColor,
  });
}

class QuestionWidget extends StatelessWidget {
  final Question question;

  const QuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          question.question,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 50),
        Image.asset(
          'asset/KKU-SMART-TRANSIT.JPG',
          height: 220,
          width: 300,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: [
                  ChoiceWidget(choice: question.choices[0]),
                  SizedBox(height: 60),
                  ChoiceWidget(choice: question.choices[1]),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ChoiceWidget(choice: question.choices[2]),
                  SizedBox(height: 60),
                  ChoiceWidget(choice: question.choices[3]),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ChoiceWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: boxWidth,
      height: boxHeight,
      decoration: BoxDecoration(
        color: choice.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: ListTile(
        title: Text(
          choice.text,
          style: TextStyle(color: choice.foregroundColor, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        onTap: () {},
      ),
    );
  }
}
