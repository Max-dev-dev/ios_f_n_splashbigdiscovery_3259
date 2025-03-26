import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/cubit/quiz_cubit.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/models/quiz_model.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/home_screen.dart';
import 'package:logger/logger.dart';

final GlobalKey<HomeScreenState> homeScreenKey = GlobalKey<HomeScreenState>();

class QuizScreen extends StatelessWidget {
  QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit()..loadQuestions(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xFF2D90A8),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: false,
          title: const Text(
            "Back",
            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (message) => Center(
                    child: Text(
                      message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
              loaded: (
                questions,
                currentIndex,
                score,
                isFinished,
                selectedAnswer,
              ) {
                if (isFinished) {
                  return _buildResultScreen(
                    context,
                    score,
                    questions.length,
                    questions,
                    context.read<QuizCubit>().getUserAnswers(),
                  );
                }
                return _buildQuizQuestion(
                  context,
                  questions,
                  currentIndex,
                  selectedAnswer,
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildQuizQuestion(
    BuildContext context,
    List<QuizItem> questions,
    int currentIndex,
    String? selectedAnswer,
  ) {
    final question = questions[currentIndex];

    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/quiz_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      question.image,
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: LinearProgressIndicator(
                                value: (currentIndex + 1) / questions.length,
                                backgroundColor: Colors.white,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFFFC9B09),
                                ),
                                minHeight: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '${currentIndex + 1}/${questions.length}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 16.0,
                  ),
                  child: Column(
                    children: _buildAnswerButtons(
                      context,
                      question,
                      selectedAnswer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final Logger logger = Logger();

  List<Widget> _buildAnswerButtons(
    BuildContext context,
    QuizItem question,
    String? selectedAnswer,
  ) {
    final answers = {'A': question.answerA, 'B': question.answerB};

    return answers.entries.map((entry) {
      return _buildAnswerButton(
        context,
        entry.value,
        entry.key,
        question.rightAnswer,
        selectedAnswer,
      );
    }).toList();
  }

  Widget _buildAnswerButton(
    BuildContext context,
    String text,
    String answerKey,
    String correctAnswer,
    String? selectedAnswer,
  ) {
    final correctAnswerKey =
        {"answer_a": "A", "answer_b": "B"}[correctAnswer] ?? correctAnswer;

    final isSelected = selectedAnswer != null && selectedAnswer == answerKey;
    final isCorrect = answerKey == correctAnswerKey;
    final hasAnswered = selectedAnswer != '';

    return GestureDetector(
      onTap:
          hasAnswered
              ? null
              : () async {
                context.read<QuizCubit>().selectAnswer(answerKey);
                await Future.delayed(const Duration(seconds: 2));
              },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(45),
          border: Border.all(
            color:
                hasAnswered
                    ? (isCorrect
                        ? Colors.green
                        : (isSelected ? Colors.red : Colors.grey[800]!))
                    : Colors.grey[800]!,
            width: 3,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[700],
              child: Text(
                answerKey.toUpperCase(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultScreen(
    BuildContext context,
    int score,
    int total,
    List<QuizItem> questions,
    List<String?> usersAnswers,
  ) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/quiz_blured_logo.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 150.0),
                const Text(
                  'Game over',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your result:',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$score',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF3A44), Color(0xFFFFA800)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Try again',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
