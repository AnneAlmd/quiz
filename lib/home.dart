import 'package:flutter/material.dart';
import 'package:quiz/question.dart';
import 'package:quiz/quiz_result.dart';

import 'answer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _index = 0;
  int score = 0;
  final _questions = const [
    {
      'question': 'What\´s your favourite food?',
      'answers': [
        {'text': 'Vegan', 'value': 10},
        {'text': 'Vegetarian', 'value': 5},
        {'text': 'Meat', 'value': 1},
      ]
    },
    {
      'question': 'What\´s your favourite Place?',
      'answers': [
        {'text': 'City', 'value': 1},
        {'text': 'Forest', 'value': 10},
        {'text': 'Beach', 'value': 5},
      ]
    },
    {
      'question': 'What\´s your favourite Pet?',
      'answers': [
        {'text': 'Dog', 'value': 10},
        {'text': 'Cat', 'value': 5},
        {'text': 'None', 'value': 1},
      ]
    }
  ];

  void _userAnswer({int? value}) {
    score = score + value!;
    setState(() {
      _index++;
    });
  }

  void _startOver() {
    setState(() {
      score = 0;
      _index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Quiz time',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: _index < _questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Question(questions: _questions, index: _index),
                  SizedBox(height: 30),

                  //List<Map<String,Object(list de maps)>>
                  //_questions=[{_ '', _ [{_'',_ int}]}]

                  ...(_questions[_index]['answers']
                          as List<Map<String, Object>>)
                      .map(
                        (e) => Answer(
                          answer: e['text'] as String,
                          value: e['value'] as int,
                          userAnswer: _userAnswer,
                        ),
                      )
                      .toList(),
                ],
              )
            : QuizResult(score: score, startOver: _startOver),
      ),
    );
  }
}
