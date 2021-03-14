import 'package:flutter/material.dart';

// void main ()
// {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestion() {
    questionIndex = questionIndex + 1;
    print(questionIndex);
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
            Text(question[questionIndex]),
            RaisedButton(
              child: Text('Answer1'),
              onPressed: () {
                print("A");
              },
            ),
            RaisedButton(
              child: Text('Answer2'),
              onPressed: answerQuestion,
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
            RaisedButton(
              child: Text('Answer5'),
              onPressed: () {
                print("E");
              },
            ),
          ],
        ),
      ),
    );
  }
}
