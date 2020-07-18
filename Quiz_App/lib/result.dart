import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result({@required this.resultScore, @required this.resetHandler});

  String get resultPharse {
    String resultText;
    if (resultScore <= 8)
      resultText = 'You are awesome and innocent !';
    else if (resultScore <= 12)
      resultText = 'Pretty likeable';
    else if (resultScore <= 16)
      resultText = 'You are Strange';
    else
      resultText = 'You are so bad';

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPharse,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text("Restart Quiz"),
            textColor: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
