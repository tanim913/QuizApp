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
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList(),
        if (questionIndex > 0)
          RaisedButton(
              child: Text('<<',
              style: TextStyle(fontSize: 2),
              ),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: previousQuestion),
        if (questionIndex < questions.length - 1)
          RaisedButton(
              child: Text('>>',
              style: TextStyle(fontSize: 25),
              ),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: nextQuestion),
      ],
    );
  }
}
