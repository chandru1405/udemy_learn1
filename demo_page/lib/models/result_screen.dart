import 'package:demo_page/data/questions.dart';
import 'package:demo_page/models/question_summary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.choosenAnswer});
  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummeryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'questions': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final SummaryData = getSummeryData();
    final numberOfQuestion = questions.length;
    final numCorrectAnswer = SummaryData.where(
        (data) => data['correct_answer'] == data['user_answer']).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $numCorrectAnswer out of $numberOfQuestion questions answered'),
            const SizedBox(
              height: 10,
            ),
            QuestionSummary(SummaryData),
            const SizedBox(
              height: 20,
            ),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
