import 'package:flutter/material.dart';

import './models/question.dart';

import './question_box.dart';
import './result.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  final _questions = [
    {
      0: [
        Question(' O que significa um quinquênio?', 1),
        Question(' Periodo de 5 anos?', 0),
      ]
    },
    {
      1: [
        Question(' Na fração, o número que fica em baixo é chamado de...', 0),
        Question('denominador', 1)
      ]
    },
    {
      2: [
        Question('Quantos zeros tem o número UM BILHÃO?', 1),
        Question('sete', 0)
      ]
    },
    {
      3: [
        Question('A operação inversa da potenciação é a:', 0),
        Question('radiciação', 1),
      ]
    }
  ];
  int result = 0;
  int _index = 0;

  void nextQuestion(int value) {
    setState(() {
      _index++;
      result = result + value;
    });
  }

  void reset() {
    setState(() {
      _index = 0;
      result = 0;
    });
  }

  String getMessage() {
    if (result < 2) {
      return 'Oops... tente novamente.';
    } else if (result < 3) {
      return 'Você está quase lá';
    }

    return 'Parabéns! você sabe tudo!';
  }

  String _getTitle() {
    if (_index < 4) {
      return 'Question ${_index + 1}';
    } else {
      return 'Result';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(_getTitle()),
          ),
        ),
        body: _index < _questions.length
            ? QuestionBox(_index, _questions, nextQuestion)
            : Result(getMessage(), this.reset));
  }
}
