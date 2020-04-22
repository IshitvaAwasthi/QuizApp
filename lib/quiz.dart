import 'package:flutter/material.dart';
import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final int queIndex;
  final Function answerQuestion;

  Quiz({@required this.question, @required this.answerQuestion, @required this.queIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[queIndex]['que']),
        ...(question[queIndex]['answer'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList()
      ],
    );
  }
}
