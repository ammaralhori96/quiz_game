import 'package:first_project_rebbet/quastions.dart';
import 'package:flutter/material.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List qustions;
  final int qustionsNum;
  final Map answer;
  final Function answerBused;
  final Function backOneStep;

  Quiz(
    this.answer,
    this.qustionsNum,
    this.qustions,
    this.answerBused,
    this.backOneStep,
  );

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Quastions(qustions[qustionsNum]),
        ...(answer[qustionsNum] as List<Map<String, Object>>).map((answerrr) {
          return Answer(answerrr["text"], () => answerBused(answerrr["score"]));
        }),
        SizedBox(
          height: 20,
        ),
        FloatingActionButton(
          onPressed: backOneStep,
          backgroundColor: Colors.green,
          child: Icon(Icons.arrow_back),
        )
      ],
    );
  }
}
