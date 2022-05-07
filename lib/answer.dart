import 'package:flutter/material.dart';
import './main.dart';

// ignore_for_file: prefer_const_constructors

class Answer extends StatelessWidget {
  // final Function answerQuestion; //Use the Function type if the function has parameters
  final VoidCallback
      answerQuestion; // use VoidCallBack if the function has no parameters
  final String answer_text;

  Answer(this.answerQuestion, this.answer_text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple)),
        onPressed: answerQuestion,
        child: Text(answer_text),
      ),
    );
  }
}
