import 'package:flutter/material.dart';

class ButtonQuiz extends StatelessWidget {
  final bool previous;
  final Function()? previousQuiz;
  final Function()? nextQuiz;

  const ButtonQuiz({
    Key? key,
    required this.previous,
    required this.nextQuiz,
    this.previousQuiz,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: previous,
              child: ElevatedButton(
                onPressed: previousQuiz,
                child: const Text("Previous"),
              ),
            ),
            Visibility(
              visible: nextQuiz != null,
              child: ElevatedButton(
                onPressed: nextQuiz,
                child: const Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
