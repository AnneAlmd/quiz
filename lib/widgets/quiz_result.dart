import 'package:flutter/material.dart';

class QuizResult extends StatelessWidget {
  final int score;
  final Function startOver;

  const QuizResult({Key? key, required this.score, required this.startOver})
      : super(key: key);

  String _resultPhrase() {
    if (score < 5) {
      return 'Sorry, \n you did not do well!';
    } else if (5 < score && score < 10) {
      return 'Good, \n you were ok!';
    } else {
      return 'Congratulations!\n You did really well.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _resultPhrase(),
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Text(
          '$score',
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        Container(
          width: MediaQuery.of(context).size.width * 0.6,
          margin: EdgeInsets.only(top: 10),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                alignment: Alignment.center, elevation: 10.0),
            onPressed: () {
              startOver();
            },
            icon: Icon(Icons.arrow_right),
            label: Text('Let\´s Do Again!',
                textAlign: TextAlign.left, style: TextStyle(fontSize: 20)),
          ),
        ),
      ],
    );
  }
}
