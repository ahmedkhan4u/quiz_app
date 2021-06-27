import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'Result.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  var _totalScore = 0;
  var questionIndex = 0;
  void answerHandler(int totalScore){

    _totalScore += totalScore;

    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  void resetHandler(){
    setState(() {
      _totalScore = 0;
      questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context){
    final _question = const [
      {
        'questionText': 'What is your favorite color',
        'answer': [
          {'text':'Green', 'score': 40}, {'text':'Blue', 'score': 20},
          {'text':'white', 'score': 30},{'text':'Black', 'score': 10},]
      },
      {
        'questionText': 'What is your favorite subject',
        'answer': [
          {'text':'Maths', 'score': 10}, {'text':'Computer', 'score': 40},
          {'text':'Physics', 'score': 30},{'text':'Chemistry', 'score': 20},]
      },
      {
        'questionText': 'What is your favorite pet',
        'answer': [
          {'text':'Cat', 'score': 40}, {'text':'Dog', 'score': 10},
          {'text':'Lion', 'score': 30},{'text':'Rabbit', 'score': 20},]
      },
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluuter App',
      home: Scaffold(
        appBar: AppBar(title: Text('Quiz App'),),
        body: questionIndex < _question.length ?
        Quiz(question: _question, questionIndex: questionIndex, answerHandler: answerHandler)
            : Result(_totalScore, resetHandler)
      ),
    );
  }
}