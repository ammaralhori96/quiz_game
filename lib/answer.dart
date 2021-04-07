import 'package:flutter/material.dart';
import 'package:first_project_rebbet/textStyle.dart';

class Answer extends StatelessWidget {
  final String listAnswer;
  final Function x;

  Answer(this.listAnswer, this.x);

  Widget answerCotaner(String s, TextStyle f, double nu, Color cl) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: EdgeInsets.all(nu),
      child: Text(
        s,
        style: f,
      ),
      color: cl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          RaisedButton(
            onPressed: x,
            child: answerCotaner(listAnswer, blueText, 10, Colors.blue),
          ),
        ],
      ),
    );
  }
}
