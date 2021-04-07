import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetQuiz;
  final int total;

  Result(this.resetQuiz, this.total);

  String get resulPtrise {
    String resulText;

    if (total > 180) resulText = "you are very good";
    if (total < 180 && total > 100) resulText = "you are good";
    if (total < 100) resulText = "you are bad";

    return resulText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Your score is  $total",
            style: TextStyle(fontSize: 20),
          ),
          Text(
            resulPtrise,
            style: TextStyle(fontSize: 40),
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text(
              "Reset The Quiz",
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
