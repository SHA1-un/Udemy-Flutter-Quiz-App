/*  NOTES:
    1)  The onPressed property of ElevatedButton requires a void function as its 
        value, therefore we cannot assign buttonPressed() to it since that would
        assign whatever buttonPressed() returns, which is nothing/null since it's
        a void function. So we need to assign buttonPressed as the value which 
        serves as a pointer to the fuction. 
        
        This is importatnt since Flutter and by extenstion, Dart parses the file 
        from top to bottom, left to right and when the onPressed property with 
        the value buttonPressed() gets encountered, dart would call the funtion,
        and assign the value to buttonPressed, which is not the desired outcome.

    2)  Widgets are just Dart objects. They need to extend StatelessWidget or 
        StatefulWidget though (and implement a build() method)

    3)  Anonomous function examples: 

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

    5)  Convension: One widget per file unless you do not plan on re-using 
        widgets and a file containing multiple widgets only work with one another,
        then an exeption can be made.
*/

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

/// The main function of any dart file corresponds to the filename.dart and
/// every dart project needs a main.dart file which flutter looks for
/// when starting the application.
/*void main() {
  runApp(
      MyApp()); //  runApp() takes the widget object you pass to it and ensures that the widget tree of that widget gets created
}*/
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

  void _answerQuestion() {
    // Each time setState is called, the stateful widget gets rebuilt. This
    // means that the build method is called again.
    setState(() {
      _questionIndex += 1;
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
    var questions = [
      "What's your favourite color?",
      "What's your favourite animal?",
      "Hello!"
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My first app!"),
        ),
        body: Column(
          children: [
            Text(questions[_questionIndex]),
            ElevatedButton(
                onPressed: _answerQuestion,
                child: Text("Answer 1")), // See note 1
            ElevatedButton(
              onPressed: _answerQuestion,
              child: Text("Answer 2"),
            ),
            ElevatedButton(
              onPressed: _answerQuestion,
              child: Text("Answer 3"),
            ),
          ],
        ),
      ),
    );
  }
}
