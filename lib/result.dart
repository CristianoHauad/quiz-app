import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final String message;
  final Function reset;

  Result(this.message, this.reset);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: this.reset,
              child: Text('Voltar'),
            ),
          ],
        )
      ],
    );
  }
}
