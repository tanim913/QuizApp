import 'package:flutter/material.dart';
import './question.dart';

// void main ()
// {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _previousQuestion() {
    setState(() {
      _questionIndex = _questionIndex-1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var question = [
      'What is your favorite color?',
      'What\'s your favorite animal?'
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Column(
          children: [
            Question(question[_questionIndex]),
            RaisedButton(
              child: Text('Answer1'),
              onPressed: () {
                print("A");
              },
            ),
            RaisedButton(
              child: Text('Answer2'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('Answer3'),
              onPressed: () {
                print("C");
              },
            ),
            RaisedButton(
              child: Text('Answer4'),
              onPressed: () {
                print("D");
              },
            ),
            RaisedButton(child: Text('Answer5'), onPressed: _previousQuestion),
          ],
        ),
      ),
    );
  }
}
