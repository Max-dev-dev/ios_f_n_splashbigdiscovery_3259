
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/models/quiz_model.dart';

part 'quiz_cubit.freezed.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.initial() = Initial;
  const factory QuizState.loading() = Loading;
  const factory QuizState.loaded({
    required List<QuizItem> questions,
    required int currentIndex,
    required int score,
    required bool isFinished,
    required String selectedAnswer,
  }) = Loaded;
  const factory QuizState.error(String message) = _Error;
}

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(const QuizState.initial());

  List<QuizItem> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  String _selectedAnswer = '';
  List<String?> _userAnswers = [];

  Future<void> loadQuestions() async {
    emit(const QuizState.loading());
    try {
      final String jsonString = await rootBundle.loadString('assets/quiz.json');
      final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      final quizResponse = QuizResponse.fromJson(jsonMap);
      _questions = quizResponse.quiz;
      _currentIndex = 0;
      _score = 0;
      _selectedAnswer = '';
      _userAnswers = List.filled(_questions.length, null);
      emit(
        QuizState.loaded(
          questions: _questions,
          currentIndex: _currentIndex,
          score: _score,
          isFinished: false,
          selectedAnswer: _selectedAnswer,
        ),
      );
    } catch (e) {
      emit(QuizState.error('Failed to load quiz: $e'));
    }
  }

  void selectAnswer(String selectedAnswer) async {
    _selectedAnswer = selectedAnswer;
    _userAnswers[_currentIndex] = selectedAnswer;

    emit(
      QuizState.loaded(
        questions: _questions,
        currentIndex: _currentIndex,
        score: _score,
        isFinished: false,
        selectedAnswer: _selectedAnswer,
      ),
    );

    await Future.delayed(const Duration(seconds: 2));

    final correctAnswerKey =
        {
          "answer_a": "A",
          "answer_b": "B",
        }[_questions[_currentIndex].rightAnswer] ??
        _questions[_currentIndex].rightAnswer;

    if (selectedAnswer == correctAnswerKey) {
      _score++;
    }

    if (_currentIndex < _questions.length - 1) {
      _currentIndex++;
      _selectedAnswer = '';
      emit(
        QuizState.loaded(
          questions: _questions,
          currentIndex: _currentIndex,
          score: _score,
          isFinished: false,
          selectedAnswer: _selectedAnswer,
        ),
      );
    } else {
      emit(
        QuizState.loaded(
          questions: _questions,
          currentIndex: _currentIndex,
          score: _score,
          isFinished: true,
          selectedAnswer: _selectedAnswer,
        ),
      );
    }
  }

  List<String?> getUserAnswers() => _userAnswers;
}
