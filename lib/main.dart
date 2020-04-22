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
  final _que = const [
    {
      'que': 'What\'s your favorite colour?',
      'answer': ['Black', 'Red', 'Green', 'White'],
    },
    {
      'que': 'What\'s your favorite animal?',
      'answer': ['Dog', 'Rabbit', 'Monkey', 'Cat'],
    },
    {
      'que': 'What\'s your favorite food?',
      'answer': ['Sandwich', 'Parathas', 'Dosa', 'Pav Bhaji'],
    },
  ];

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
