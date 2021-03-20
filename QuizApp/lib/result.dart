import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  Result(this.resultScore);

  String get resultPhase {
    
    var resultText;
    if (resultScore <= 12) {
      resultText = 'You are awesome and innocent\n' + 'Your Score is ' + resultScore.toString();
    } else if (resultScore <= 20) { 
      resultText = 'Pretty likable\n' + 'Your Score is ' + resultScore.toString();
    } else if (resultScore <= 28) {
      resultText = 'You are kinda Strange!\n' + 'Your Score is '+ resultScore.toString();
    } else {
      resultText = 'Seriously!! What is wrong with you?\n' + 'Your Score is '+ resultScore.toString();
    } 
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      resultPhase,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ));
  }
}
