import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_page.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        // selectedAnswer = [];
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswer = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartPage(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    }

    if(activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(selectedAnswer, restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Color.fromARGB(255, 165, 132, 223)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: screenWidget),
      ),
    );
  }
}
