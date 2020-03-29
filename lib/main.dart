import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  static const questions = [
    {
      'questionText': 'Which is your favourite color ?',
      'answers': [
        {'text': 'White', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 3},
        {'text': 'Green', 'score': 1}
      ]
    },
    {
      'questionText': 'Which is your favourite fruit ?',
      'answers': [
        {'text': 'Orange', 'score': 10},
        {'text': 'Banana', 'score': 5},
        {'text': 'Apple', 'score': 3},
        {'text': 'Mango', 'score': 1}
      ]
    },
    {
      'questionText': 'Which is your favourite City ?',
      'answers': [
        {'text': 'Kolkata', 'score': 10},
        {'text': 'Pune', 'score': 5},
        {'text': 'Mumbai', 'score': 3},
        {'text': 'Pune', 'score': 1}
      ]
    }
  ];

  void _answerQuestion(int score) {
    // This is needed for calling build again.
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = (_questionIndex + 1);
    });

    print("Answer ${_questionIndex}");
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("My First Appbar"),
      ),
      body: _questionIndex < questions.length
          ? Quiz(
              questions: questions,
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex)
          : Result(
              _totalScore,
              _resetQuiz,
            ),
    ));
  }
}
