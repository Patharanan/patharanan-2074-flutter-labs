import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_demo1/database_helper.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_demo1/quiz_states_stats_main.dart';

final database = FirebaseDatabase.instance;
final scoresRef = database.reference().child('scores');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
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

class RestartScreen extends StatefulWidget {
  final List<Question> questions;
  final int currentQuestionIndex;
  final DatabaseHelper dbHelper;
  final int score;

  RestartScreen(
      {required this.questions,
      required this.currentQuestionIndex,
      required this.score,
      required this.dbHelper});

  @override
  _RestartScreenState createState() => _RestartScreenState();
}

class _RestartScreenState extends State<RestartScreen> {
  DatabaseHelper _databaseHelper = DatabaseHelper();
  late List<Map<String, dynamic>> _scoresLast = [];
  late List<int> _scoresRank = [];

  @override
  void initState() {
    super.initState();
    _getScores();
    _saveScore();
    _saveScoreToFirebase();
    _loadScores();
    //_loadSortScores();
  }

  Future<void> _loadScores() async {
    List<Map<String, dynamic>> scores = await widget.dbHelper.getScores();
    List<int> integerScores = convertScoresToIntegerList(scores);
    List<int> sortedScores = sortScores(integerScores);
    setState(() {
      _scoresLast = scores;
      _scoresRank = sortedScores;
    });
  }

  List<int> convertScoresToIntegerList(List<Map<String, dynamic>> scores) {
    List<int> integerScores = [];

    for (Map<String, dynamic> score in scores) {
      integerScores.add(score['score'] as int);
    }

    return integerScores;
  }

  Future<void> _getScores() async {
    List<Map<String, dynamic>>? scores = await _databaseHelper.getScores();

    setState(() {
      _scoresLast = scores?.reversed.toList() ?? [];
    });
  }

  List<int> sortScores(List<int> _scoresLast) {
    _scoresLast.sort((a, b) => b.compareTo(a));
    return _scoresLast;
  }

  Future<void> _saveScore() async {
    await _databaseHelper.insertScore(widget.score);
  }

  Future<void> _saveScoreToFirebase() async {
    scoresRef.push().set({
      'score': widget.score,
      'timestamp': DateTime.now().toString(),
    });
  }

  Future<List<Map<String, dynamic>>> _sortedScores() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    List<Map<String, dynamic>> sortScores = await dbHelper.getScores();
    sortScores.sort((a, b) => b['score'].compareTo(a['score']));
    return sortScores;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Finished'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ranking Scores',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 164, 149, 10),
              ),
            ),
            SizedBox(height: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _scoresRank.map((score) {
                print(score);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Patharanan ${score}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 15),
            Text(
              'Last three scores',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 164, 149, 10),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _scoresLast.take(3).map((score) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    '${score['score']}, ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 15),
            Text(
              "Your total score is ${widget.score}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 163, 23, 156),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
                var provider;
                sendPostRequest(widget.score);
              },
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  int _score = 0;

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  DatabaseHelper _databaseHelper = DatabaseHelper();

  void storeScore(int score) async {
    await _databaseHelper.insertScore(score);
  }

  int _calculateScore() {
    int correctAnswers = 0;
    for (Question question in _questions) {
      for (Choice choice in question.choices) {
        if (choice.selected && choice.correct) {
          correctAnswers++;
        }
      }
    }
    return correctAnswers;
  }

  int _currentQuestionIndex = 0;
  List<Question> _questions = [
    Question(
      question: 'Where is this picture ?',
      image: 'asset/KKU-SMART-TRANSIT.JPG',
      choices: [
        Choice(
          text: 'Chulalongkorn University',
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
          text: 'Chiang Mai University',
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
          text: 'CU',
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          correct: false,
        ),
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
          text: 'Khon Kaen University',
          backgroundColor: Color.fromARGB(255, 255, 255, 21),
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          correct: true,
        ),
        Choice(
          text: 'Chiang Mai University',
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          correct: false,
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
      } else {
        widget._score = _calculateScore();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestartScreen(
              questions: _questions,
              currentQuestionIndex: _currentQuestionIndex,
              score: widget._score,
              dbHelper: _databaseHelper,
            ),
          ),
        );
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
    Navigator.popUntil(context, ModalRoute.withName('/'));
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
          onPrevious: _previousQuestion,
          onCurrent: _home,
          currentQuestionIndex: _currentQuestionIndex,
          questions: _questions,
          isLastQuestion: _currentQuestionIndex == _questions.length - 1,
          score: widget._score,
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
  final bool isLastQuestion;
  final int score;

  QuestionWidget({
    Key? key,
    required this.question,
    this.onNext,
    this.onPrevious,
    this.onCurrent,
    required this.currentQuestionIndex,
    required this.questions,
    required this.isLastQuestion,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    DatabaseHelper _databaseHelper = DatabaseHelper();
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
            return ChoiceWidget(
              choice: question.choices[index],
              onTap: () {
                question.choices.forEach((choice) {
                  choice.selected = false;
                });
                question.choices[index].selected = true;

                if (question.choices[index].correct &&
                    currentQuestionIndex < questions.length - 1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text("Score!"),
                          content: Text('Congrats, you get 1 point'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, "OK");
                                onNext!();
                              },
                              child: const Text("OK"),
                            ),
                          ]);
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                          title: Text("Score!"),
                          content: Text('Sorry, you miss it!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, "OK");
                                onNext!();
                              },
                              child: const Text("OK"),
                            ),
                          ]);
                    },
                  );
                }
              },
            );
          },
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Visibility(
                visible: onPrevious != null && currentQuestionIndex > 0,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ElevatedButton(
                  onPressed: onPrevious,
                  child: Text('Previous'),
                ),
              ),
              Visibility(
                visible: onCurrent != null,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ElevatedButton(
                  onPressed: onCurrent,
                  child: Text('Home'),
                ),
              ),
              Visibility(
                visible: onNext != null,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: ElevatedButton(
                  onPressed: isLastQuestion
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RestartScreen(
                                questions: questions,
                                currentQuestionIndex: currentQuestionIndex,
                                score: score,
                                dbHelper: _databaseHelper,
                              ),
                            ),
                          );
                        }
                      : onNext,
                  child: Text(isLastQuestion ? 'Next' : 'Next'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ChoiceWidget extends StatefulWidget {
  final Choice choice;
  final Function()? onTap;

  const ChoiceWidget({
    Key? key,
    required this.choice,
    required this.onTap,
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
        widget.onTap?.call();
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
