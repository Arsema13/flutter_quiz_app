import 'package:flutter/material.dart';
import '../models/question.dart';

class QuizProvider with ChangeNotifier {
  int _currentQuestion = 0;
  int _score = 0;
  List<int?> _selectedAnswers = [];

  final List<Question> _questions = [
    Question(
      questionText: 'What is the capital of France?',
      options: ['Paris', 'London', 'Berlin', 'Madrid'],
      correctIndex: 0,
    ),
    Question(
      questionText: 'What is 2 + 2?',
      options: ['3', '4', '5', '2'],
      correctIndex: 1,
    ),
    Question(
      questionText: 'Which planet is known as the Red Planet?',
      options: ['Earth', 'Venus', 'Mars', 'Jupiter'],
      correctIndex: 2,
    ),
  ];

  List<Question> get questions => _questions;
  int get currentIndex => _currentQuestion;
  int get score => _score;
  List<int?> get selectedAnswers => _selectedAnswers;

  void selectAnswer(int selectedIndex) {
    if (_selectedAnswers.length <= _currentQuestion) {
      _selectedAnswers.add(selectedIndex);
    }

    if (_questions[_currentQuestion].correctIndex == selectedIndex) {
      _score++;
    }

    notifyListeners();
  }

  void nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      _currentQuestion++;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _currentQuestion = 0;
    _score = 0;
    _selectedAnswers = [];
    notifyListeners();
  }
}
