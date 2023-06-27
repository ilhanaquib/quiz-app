import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.startQuiz, {Key? key}) : super(key: key);

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Opacity(
            opacity: 0.5,
            child: Image.asset(
              'assets/images/quiz-logo.png',
              width: 300,
            ),
          ),
          const SizedBox(height: 80),
          const Text(
            'Learn Flutter The Fun Way!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            onPressed: () {
              startQuiz();
            },
            label: const Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}