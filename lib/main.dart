import 'package:first_project_rebbet/quiz.dart';
import 'package:first_project_rebbet/result.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: " Quiz App",
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color w = Colors.white;
  Color b = Colors.black;
  bool isSwiched;

  int qustionsNum = 0;
  int total = 0;
  int numScore0 = 0;
  int numScore1 = 0;
  int numScore2 = 0;

  final qustions = [
    "what's is your favorate Animal",
    "what's is your favorate Car",
    "what's is your favorate Drink",
    "what's is your favorate Cuntry",
  ];

  final answer = {
    0: [
      {"text": "horse", "score": 10},
      {"text": "elephent", "score": 20},
      {"text": "lion", "score": 30},
      {"text": "tiger", "score": 40}
    ],
    1: [
      {"text": "MArseds", "score": 10},
      {"text": "Mesubishi", "score": 20},
      {"text": "Honda", "score": 30},
      {"text": "Ferary", "score": 40}
    ],
    2: [
      {"text": "Milk", "score": 10},
      {"text": "Kola", "score": 20},
      {"text": "Cofy", "score": 30},
      {"text": "neskafee", "score": 40}
    ],
    3: [
      {"text": "Syria", "score": 10},
      {"text": "Turkey", "score": 20},
      {"text": "Lebanun", "score": 30},
      {"text": "Jurdan", "score": 40}
    ],
  };

  void backOneStep() {
    setState(() {
      if (qustionsNum > 0) {
        qustionsNum -= 1;
      }

      if (qustionsNum == 2)
        total -= numScore2;
      else if (qustionsNum == 1)
        total -= numScore1;
      else if (qustionsNum == 0) total -= numScore0;
    });

    print("qustionsNum : $qustionsNum ");
    print("total : $total");
    print("numScore0 : $numScore0");
    print("numScore1 : $numScore1");
    print("numScore2 : $numScore2");
  }

  void answerBused(score) {
    setState(() {
      total += score;
      qustionsNum += 1;

      if (qustionsNum == 3)
        numScore2 = score;
      else if (qustionsNum == 2)
        numScore1 = score;
      else if (qustionsNum == 1) numScore0 = score;
    });

    print("qustionsNum : $qustionsNum ");
    print("total : $total");
    print("numScore0 : $numScore0");
    print("numScore1 : $numScore1");
    print("numScore2 : $numScore2");
  }

  void resetQuiz() {
    setState(() {
      numScore0 = 0;
      numScore1 = 0;
      numScore2 = 0;
      qustionsNum = 0;
      total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        actions: [
          Switch(
              value: isSwiched,
              onChanged: (value) {
                setState(() {
                  isSwiched = value;
                  print(isSwiched);
                  if (isSwiched == true) {
                    w = Colors.white;
                    b = Colors.black;
                  } else if (isSwiched == false) {
                    w = Colors.black;
                    b = Colors.white;
                  }
                });
              })
        ],
      ),
      body: Container(
          color: w,
          child: qustionsNum < qustions.length
              ? Quiz(answer, qustionsNum, qustions, answerBused, backOneStep)
              : Result(resetQuiz, total)),
    );
  }
}
