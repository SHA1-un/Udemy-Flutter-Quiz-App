// The function of this widget is to receive a list of questions as parameters
// and then display the questions
//
//

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question_text;

  Question(this.question_text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        question_text,
        style: TextStyle(fontSize: 30),
        textAlign: TextAlign.center,
      ),
      color: Colors.lightBlueAccent,
      width: double
          .infinity, // This ensures that the container takes up as much width as possible
      margin: EdgeInsets.all(20),
    );
  }
}
