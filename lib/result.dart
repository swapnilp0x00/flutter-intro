import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final resultScore;
  final Function resetQuiz;
  Result(this.resultScore, this.resetQuiz);

  String get resultText {
    return 'You did it!' + resultScore.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Text(
          resultText,
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        FlatButton(
          child: Text('Restart'),
          onPressed: resetQuiz,
          textColor: Colors.blue,
        )
      ],
    ));
  }
}
