import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "asset/quiz.jpg",
                      height: 300,
                    ),
                    SizedBox(height: 25),
                    Text(
                      "Welcome to the Quiz App",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurpleAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "By Patharanna Papakang 643040207-4",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 65, 65, 65),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                label: Text("Start", style: TextStyle(fontSize: 16.5)),
                icon: Icon(Icons.play_arrow),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return QuizScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  List<Question> _questions = [
    Question(
      question: 'Where is this picture ?',
      image: 'asset/KKU-SMART-TRANSIT.JPG',
      choices: [
        Choice(
          text: 'Chiang Mai University',
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          correct: false,
        ),
        Choice(
          text: 'Khon Kaen University',
          backgroundColor: Color.fromARGB(255, 255, 255, 21),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          correct: true,
        ),
        Choice(
          text: 'Chulalongkorn University',
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          correct: false,
        ),
        Choice(
          text: 'Mahidol University',
          backgroundColor: Color.fromARGB(255, 149, 9, 149),
          foregroundColor: Colors.white,
          correct: false,
        ),
      ],
    ),
    Question(
      question: 'Where is this picture ?',
      image: 'asset/KKU-SMART-TRANSIT.JPG',
      choices: [
        Choice(
          text: 'CMU',
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          correct: false,
        ),
        Choice(
          text: 'KKU',
          backgroundColor: Color.fromARGB(255, 255, 255, 21),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          correct: true,
        ),
        Choice(
          text: 'CU',
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          correct: false,
        ),
        Choice(
          text: 'MU',
          backgroundColor: Color.fromARGB(255, 149, 9, 149),
          foregroundColor: Colors.white,
          correct: false,
        ),
      ],
    ),
    Question(
      question: 'Where is this university ?',
      image: 'asset/KKU-SMART-TRANSIT.JPG',
      choices: [
        Choice(
          text: 'Chiang Mai University',
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          correct: false,
        ),
        Choice(
          text: 'Khon Kaen University',
          backgroundColor: Color.fromARGB(255, 255, 255, 21),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          correct: true,
        ),
        Choice(
          text: 'Chulalongkorn University',
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          correct: false,
        ),
        Choice(
          text: 'Mahidol University',
          backgroundColor: Color.fromARGB(255, 149, 9, 149),
          foregroundColor: Colors.white,
          correct: false,
        ),
      ],
    ),
  ];

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex >= 0) {
        _currentQuestionIndex--;
      }
    });
  }

  void _home() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentQuestionIndex + 1}'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50, bottom: 50),
        child: QuestionWidget(
          question: _questions[_currentQuestionIndex],
          onNext: _nextQuestion,
          onCurrent: _home,
          onPrevious: _previousQuestion,
          currentQuestionIndex: _currentQuestionIndex,
          questions: _questions,
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final String image;
  final List<Choice> choices;

  Question({
    required this.question,
    required this.image,
    required this.choices,
  });
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
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final VoidCallback? onCurrent;
  final int currentQuestionIndex;
  final List<Question> questions;

  const QuestionWidget({
    Key? key,
    required this.question,
    this.onNext,
    this.onPrevious,
    this.onCurrent,
    required this.currentQuestionIndex,
    required this.questions,
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
                question.image,
                height: 220,
                width: 300,
                fit: BoxFit.cover,
              )
            : Image.asset(
                question.image,
                height: 150,
                width: 250,
                fit: BoxFit.cover,
              ),
        screenW <= 600 ? SizedBox(height: 100) : SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 355,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3,
          ),
          itemCount: question.choices.length,
          itemBuilder: (BuildContext context, int index) {
            return ChoiceWidget(choice: question.choices[index]);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Visibility(
              visible: onPrevious != null && currentQuestionIndex > 0,
              child: ElevatedButton(
                onPressed: onPrevious,
                child: Text('Previous'),
              ),
            ),
            Visibility(
              visible: onCurrent != null,
              child: ElevatedButton(
                onPressed: onCurrent,
                child: Text('Home'),
              ),
            ),
            Visibility(
              visible:
                  onNext != null && currentQuestionIndex < questions.length - 1,
              child: ElevatedButton(
                onPressed: onNext,
                child: Text('Next'),
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
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
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
