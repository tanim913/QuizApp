import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  final Function previousQuestion;
  final Function nextQuestion;

  Quiz(
      {@required this.answerQuestion,
      @required this.previousQuestion,
      @required this.nextQuestion,
      @required this.questions,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answerQuestion, answer);
        }).toList(),
        RaisedButton(
            child: Text('Previous'),
            color: Colors.red,
            onPressed: previousQuestion),
            
        RaisedButton(
            child: Text('Next'), 
            color: Colors.green, 
            onPressed: nextQuestion),
      ],
    );
  }
}