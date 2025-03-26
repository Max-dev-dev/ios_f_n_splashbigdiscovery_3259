import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/cubit/quiz_cubit.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/quiz_screen.dart';

class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit()..loadQuestions(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color(0xFF2D90A8),
          centerTitle: false,
          title: const Text(
            'Game',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/quiz_logo.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                height: double.infinity,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuizScreen()),
                    );
                  },
                  child: Image.asset('assets/images/mdi_play.png', width: 80),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
