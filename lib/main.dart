/*  NOTES:
    1)  The onPressed property of ElevatedButton requires a void function as its 
        value, therefore we cannot assign buttonPressed() to it since that would
        assign whatever buttonPressed() returns, which is nothing/null since it's
        a void function. So we need to assign buttonPressed as the value which 
        serves as a pointer to the function. 
        
        This is important since Flutter and by extension, Dart parses the file 
        from top to bottom, left to right and when the onPressed property with 
        the value buttonPressed() gets encountered, dart would call the function,
        and assign the value to buttonPressed, which is not the desired outcome.

    2)  Widgets are just Dart objects. They need to extend StatelessWidget or 
        StatefulWidget though (and implement a build() method)

    3)  Anonymous function examples: 

        ElevatedButton(
          child: Text("Button"),
          onPressed: (<parameters>) => print(Hello, World!),
        ),

        OR

        ElevatedButton(
          child: Text("Button"),
          onPressed: (<parameters>) {
            print("Hello, World!");
          },
        ),

    4)  Methods/variables/etc. can be either private or public. 
        In Dart, the syntax for indicating private is simply by using an 
        underscore. 
        eg. The MyApp class returns our stateful widget, MyAppState, 
        which we would like to rather be private and not callable from other
        Dart files.
        Therefore, MyAppState becomes _MyAppState

    5)  Convention: One widget per file unless you do not plan on re-using 
        widgets and a file containing multiple widgets only work with one another,
        then an exception can be made.

    6)  Each time the build method gets called, each widget in the widget tree
        will bw updated/ re-rendered if and only if it has undergone changes.
*/

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
import './quiz.dart';
import './restart.dart';

/// The main function of any dart file corresponds to the filename.dart and
/// every dart project needs a main.dart file which flutter looks for
/// when starting the application.
void main() => runApp(MyApp());

/// MyApp inherits properties by means of the "extends" keyword and it inherits
/// the properties needed to use our class as a widget by flutter
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// This is now the state for our MyApp widget
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _displayQuestions = true;
  var _score = 0;

  final questions = const [
    {
      'question_text': "What is the best OS?",
      'question_answers': [
        {'text': "Linux", 'score': 10},
        {'text': "Windows", 'score': 7},
        {'text': "MacOS", 'score': 2}
      ]
    },
    {
      'question_text':
          "Is there a difference between a Map and an Object in JavaScript?",
      'question_answers': [
        {'text': "Yes", 'score': 6},
        {'text': "Kinda, but not really", 'score': 10},
        {'text': "No", 'score': 1}
      ]
    },
    {
      'question_text': "Rooms!?",
      'question_answers': [
        {'text': "Huh? Rooms?", 'score': 10}
      ]
    },
  ];

  void _answerQuestion(int score) {
    // Each time setState is called, the stateful widget gets rebuilt. This
    // means that the build method is called again.
    _score += score;

    setState(() {
      _questionIndex < 2 ? _questionIndex += 1 : _displayQuestions = false;
    });
  }

  void _restartQuestions() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _displayQuestions = true;
    });
  }

  /// build returns the basic root widget needed for our app to function, this
  /// is all done by the MaterialApp class (details are not that important)
  ///
  /// Also build() returns a so-called "widget tree" which tells Flutter what
  /// to draw onto the screen.
  ///
  /// Each time build is called, the widget tree gets updated and only the UI
  /// elements that have changed, will be re-drawn
  @override
  Widget build(BuildContext context) {
    // if (questions_2 == null) {
    //   return const CircularProgressIndicator();
    // }

    // print('Here: ${questions_2![0]}');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app!"),
        ),
        body: _displayQuestions
            ? Quiz(questions, _answerQuestion, _questionIndex)
            : Restart(_restartQuestions, _score),
      ),
    );
  }
}
