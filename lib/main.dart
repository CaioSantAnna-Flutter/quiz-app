import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
    const questions = [
      {
        'questionText': 'What\'s your favorite color ?',
        'answers': ['Black', 'Red', 'Green', 'White']
      },
      {
        'questionText': 'What\'s your favorite animal ?',
        'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion']
      },
      {
        'questionText': 'What\'s your favorite season ?',
        'answers': ['Summer', 'Spring', 'Autumn', 'Winter']
      },
    ];

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
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'],
            ),
            //Spread operator -- pega uma lista de elementos e retira eles dela, adicionando cada um dos elementos individualmente. Ao invés de
            // retornar uma lista a uma lista, ele retorna os valores dessa lista, de forma que o resultado não seja uma lista encadeada
            ...(questions[_questionIndex]['answers'] as List<String>)
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),
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
