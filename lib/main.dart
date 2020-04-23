import 'package:flutter/material.dart';
import 'package:hello_world/result.dart';

import 'quiz.dart';
import 'result.dart';

// void main(){
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _queIndex = 0;
  var _totalScore = 0;

  final _que = const [
    {
      'que': 'What\'s your favorite colour?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'que': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Monkey', 'score': 1}
      ],
    },
    {
      'que': 'What\'s your favorite food?',
      'answer': [
        {'text': 'Parathas', 'score': 10},
        {'text': 'Dosa', 'score': 5},
        {'text': 'Pav Bhaji', 'score': 3},
        {'text': 'Sandwich', 'score': 1}
      ],
    },
  ];

  void _resetQuiz() {
    setState(() {
      _queIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    print(_totalScore);
    setState(() {
      _queIndex = _queIndex + 1;
    });
    if (_queIndex < _que.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _queIndex < _que.length
            ? Quiz(
                question: _que,
                answerQuestion: _answerQuestion,
                queIndex: _queIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
