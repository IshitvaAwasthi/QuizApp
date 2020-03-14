import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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

  void _answerQuestion() {
    setState(() {
      _queIndex = _queIndex + 1;
    });
    print('Answer Chosen');
  }

  @override
  Widget build(BuildContext context) {
    var que = [
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: [
            Question(
              que[_queIndex]['que']
              ),
            ...(que[_queIndex]['answer'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
