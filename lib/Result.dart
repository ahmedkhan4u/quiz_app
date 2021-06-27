import 'package:flutter/material.dart';

class Result extends StatelessWidget {
   final totalScore;
   final Function resetHandler;
   Result(this.totalScore, this.resetHandler);

   String get result  {
     String resultText = '';
     if (totalScore >= 100){
       resultText = 'Outstanding\nYou scored : ${totalScore}';
     }else if (totalScore >50) {
       resultText = 'Good\nYou scored : ${totalScore}';
     }
     else if (totalScore < 50) {
       resultText = 'Fair\nYour scored : ${totalScore}';
     }
     return resultText;
   }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Text(result, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        ),
        
        TextButton(onPressed: resetHandler, child: Text('Reset'))
      ],
    );
  }
}
