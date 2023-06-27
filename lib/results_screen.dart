import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen(this.chosenAnswer, this.restartQuiz, {super.key});

  final List<String> chosenAnswer;
  final void Function() restartQuiz;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < widget.chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': widget.chosenAnswer[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions question correctly',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 245, 226, 255),
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              icon: const Icon(
                Icons.restart_alt_rounded,
                color: Colors.white,
              ),
              onPressed: widget.restartQuiz,
              label: Text(
                'Restart Quiz',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
