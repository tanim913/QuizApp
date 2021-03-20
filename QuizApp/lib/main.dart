import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

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
  int _pscore;
  final _questions = const [
    {
      'questionText': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 1},
        {'text': 'Green', 'score': 3}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Cat', 'score': 1},
        {'text': 'Dog', 'score': 3},
        {'text': 'Monkey', 'score': 5},
        {'text': 'Human', 'score': 10}
      ]
    },
    {
      'questionText': 'Who is your BJ Horseman Character?',
      'answers': [
        {'text': 'Todd', 'score': 1},
        {'text': 'Mr. PB', 'score': 5},
        {'text': 'PC', 'score': 3},
        {'text': 'BJH', 'score': 10}
      ]
    },
    {
      'questionText': 'What is your favorite trait in a person?',
      'answers': [
        {'text': 'Transparency', 'score': 1},
        {'text': 'Genuinity', 'score': 3},
        {'text': 'Empathy', 'score': 5},
        {'text': 'Kindness', 'score': 10}
      ]
    },
    {
      'questionText': 'Which is your favorite web series?',
      'answers': [
        {'text': 'Breaking Bad', 'score': 5},
        {'text': 'Dark', 'score': 3},
        {'text': 'BoJack Horseman', 'score': 1},
        {'text': 'Peaky Blinders', 'score': 10}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    if (_questionIndex < _questions.length) {
      print('We have more questions');
    } else {
      print('No More questions');
    }
    _pscore = score;
    _totalScore += score;

    print('total score is ' + _totalScore.toString());

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  void _previousQuestion() {
    setState(() {
      _questionIndex = _questionIndex - 1;
    });
    if (_questionIndex <= 0) {
      _totalScore -= _pscore;
    }
    print('total score is ' + _totalScore.toString());
    print(_questionIndex);
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
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
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore),
      ),
    );
  }
}
