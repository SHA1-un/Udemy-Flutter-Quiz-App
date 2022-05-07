import 'package:flutter/material.dart';

class Restart extends StatelessWidget {
  final VoidCallback restartQuestions;
  final int score;
  Restart(this.restartQuestions, this.score);

  // example of how a getter works in Dart. This is a normal Dart property of a class whose value is calculated dynamically
  String get scorePhrase {
    String phrase;

    if (score >= 29) {
      phrase = "Perfect! ";
    } else {
      phrase = "Bruh...";
    }

    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: Text(
            scorePhrase + "Your Score: " + score.toString(),
            style: TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: restartQuestions, child: Text("Restart")),
        )
      ],
    );
  }
}
