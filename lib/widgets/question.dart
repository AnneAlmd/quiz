import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({
    Key? key,
    required List<Map<String, Object>> questions,
    required int index,
  })  : _questions = questions,
        _index = index,
        super(key: key);

  final List<Map<String, Object>> _questions;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Text(
      _questions[_index]['question'] as String,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }
}
