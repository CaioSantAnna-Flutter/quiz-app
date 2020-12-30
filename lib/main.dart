import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

//StatelessWidget só aceita renderizar widgets com informações alteradas externamente
//StatefulWidget aceita atualizar a renderização de widgets com atualização de informação interna também

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9}
      ]
    },
    {
      'questionText': 'What\'s your favorite season ?',
      'answers': [
        {'text': 'Summer', 'score': 10},
        {'text': 'Spring', 'score': 7},
        {'text': 'Autumn', 'score': 3},
        {'text': 'Winter', 'score': 1}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
      print(_questionIndex);
    });
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 3 formas diferentes de vincular uma ação a um evento qualquer do widget, nesse caso, do click do botão
    //onPressed: _answerQuestion
    //onPressed: () => print('Answer 2 choosen!')),
    //onPressed: () { ('Answer 3 choosen!'); })

    // Versão do children do body antes de usar o map para renderizar as opções possíveis de resposta para cada pergunta
    //Question(questions[_questionIndex]['questionText']),
    //Answer(_answerQuestion),
    //Answer(_answerQuestion),
    //Answer(_answerQuestion),

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());
