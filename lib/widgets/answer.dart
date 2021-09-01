import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function userAnswer;
  final String answer;
  final int value;

  const Answer(
      {Key? key,
      required this.userAnswer,
      required this.answer,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            elevation: 8.0, alignment: Alignment.centerLeft),
        onPressed: () {
          userAnswer(value: value);
        },
        icon: Icon(Icons.arrow_right),
        label: Text(answer,
            textAlign: TextAlign.left,
            style: TextStyle(letterSpacing: 3, fontSize: 20)),
      ),
    );
  }
}
