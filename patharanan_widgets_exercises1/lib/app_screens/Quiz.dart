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
  final String questionText; // Change the type from Question to String

  const QuestionWidget({
    Key? key,
    required this.questionText, // Update the parameter
    required int questionIndex,
    required List<Question> questions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          questionText, // Update to use the questionText parameter
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        // Rest of the code remains unchanged
      ],
    );
  }
}

class ChoiceWidget extends StatefulWidget {
  final Choice choice;

  const ChoiceWidget({
    Key? key,
    required this.choice,
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
