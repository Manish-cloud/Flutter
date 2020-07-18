import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  // runApp is function provided by material.dart which initate construction of widget tree
  runApp(MyApp());
}

// can be rebuild
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// internal state
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    {
      "questionText": "What's your favorite color ?",
      "answers": [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 1},
        {'text': 'Yellow', 'score': 3},
      ]
    },
    {
      "questionText": "What's your favorite animal ?",
      "answers": [
        {'text': 'Elephant', 'score': 5},
        {'text': 'Rabbit', 'score': 1},
        {'text': 'Lion', 'score': 10},
        {'text': 'Deer', 'score': 2}
      ]
    },
    {
      "questionText": "What's your favorite subject ?",
      "answers": [
        {'text': 'Mathematics', 'score': 10},
        {'text': 'Data Structures and Algorithm', 'score': 5},
        {'text': 'DBMS', 'score': 2},
        {'text': 'TOC', 'score': 3},
      ]
    }
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      // calls build method
      _questionIndex += 1;
    });
  }

  // construct widget tree
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter complete guide"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
    );
  }
}
