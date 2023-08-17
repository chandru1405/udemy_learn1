import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summary, {super.key});

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    Color answerColor = Colors.blue;

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map(
            (data) {
              return Row(
                children: [
                  CircleAvatar(
                      backgroundColor: summary.map(),
                      child: Text(
                          ((data['question_index'] as int) + 1).toString())),
                  Expanded(
                    child: Column(
                      children: [
                        Text(data['questions'].toString()),
                        SizedBox(
                          height: 10,
                        ),
                        Text(data['correct_answer'].toString()),
                        SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'].toString()),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
