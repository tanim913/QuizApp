import 'package:flutter/material.dart';
import './quiz.dart';

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
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': ['Black', 'Red', 'White', 'Green']
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': ['Cat', 'Dog', 'Human', 'Monkey']
    },
    {
      'questionText': 'Who is your BJ Horseman Character?',
      'answers': ['Todd', 'Mr. PB', 'PC', 'BJH']
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No More questions');
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _previousQuestion() {
    setState(() {
      _questionIndex = _questionIndex - 1;
      if(_questionIndex < 0)
      {
        _questionIndex = 0;
      }
    });
    print(_questionIndex);
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
      if(_questionIndex > _questions.length-1)
      {
        _questionIndex = _questions.length-1;
      }
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                previousQuestion: _previousQuestion,
                nextQuestion: _nextQuestion,
                questions:_questions,
                questionIndex: _questionIndex)
            : Center(child: Text('Noice!')),
      ),
    );
  }
}
