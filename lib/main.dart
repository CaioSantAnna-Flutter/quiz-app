import 'package:flutter/material.dart';

import './question.dart';

//StatelessWidget só aceita renderizar widgets com informações alteradas externamente
//StatefulWidget aceita atualizar a renderização de widgets com atualização de informação interna também

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex++;
      print(_questionIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your favorite color ?',
      'What\'s your favorite animal ?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: Column(
          children: [
            Question(questions[_questionIndex]),
            RaisedButton(child: Text('Answer 1'), onPressed: _answerQuestion),
            RaisedButton(
                child: Text('Answer 2'),
                onPressed: () => print('Answer 2 choosen!')),
            RaisedButton(
                child: Text('Answer 3'),
                onPressed: () {
                  print('Answer 3 choosen!');
                }),
          ],
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());
