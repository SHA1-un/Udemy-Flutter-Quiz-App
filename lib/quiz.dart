import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz(this.questions, this.answerQuestion, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Question(questions[questionIndex]['question_text'] as String),
        ...(questions[questionIndex]['question_answers']
                as List<Map<String, Object>>)
            .map((answer) => Answer(
                () => answerQuestion(answer["score"]),
                answer["text"]
                    as String)) // a hook function is anonymous and is stored in memory - therefore, only a pointer to this function in memory gets passed to Answer. Thus, we can increment the global score count AND pass a reference to the function all in one
            .toList()
        // What is happening here you may ask, well what we've done is, for each answer in a specific questions array index, we
        // are mapping the list of String answers to a list of Answer widgets. We then use the spread operator in order to "spread" our list
        // of widgets out so that they are now not a list within the children list, but rather list items within the children list                                     "
      ],
    );
  }
}
