import 'package:flutter/material.dart';
import 'Question.dart';
import 'Answer.dart';
class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final questionIndex;
  final Function answerHandler;
  Quiz({@required this.question, @required this.questionIndex, @required this.answerHandler});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(question[questionIndex]['questionText']),

        ...(question[questionIndex]['answer'] as List<Map<String, Object>>).map((answer){
          return Answer(() => answerHandler(answer['score']), answer['text']);
        }).toList()

      ],
    );
  }
}
