import 'package:flutter/material.dart';
import 'package:first_project_rebbet/textStyle.dart';

class Quastions extends StatelessWidget {
  final String qustis;

  Quastions(this.qustis);

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
    return Center(
      child: answerCotaner(qustis, blackText, 10, Colors.green),
    );
  }
}
