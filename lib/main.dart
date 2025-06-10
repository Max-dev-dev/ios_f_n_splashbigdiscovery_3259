import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/cubit/my_fish_cubit.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/splash_screen.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/ver_screen.dart';

class AppConstants {
  static const String oneSignalAppId = "997c8960-5db5-4c8d-ab72-3e45da9f3dc4";
  static const String appsFlyerDevKey = "v7xCW2oiGJ5JauPXwWiS5W";
  static const String appID = "6743842613";

  static const String baseDomain = "astonishing-high-ranking-blissfulness.space";
  static const String verificationParam = "yQqcejSE";

  static const String splashImagePath = 'assets/images/finish_background.png';
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final now = DateTime.now();
  final dateOff = DateTime(2024, 6, 11, 20, 00);

  final initialRoute = now.isBefore(dateOff) ? '/white' : '/verify';

  runApp(RootApp(
    initialRoute: initialRoute,
    whiteScreen: MainApp(),
  ));
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyFishesCubit()..loadFishes(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  'assets/images/main_background.png',
                  fit: BoxFit.cover,
                ),
              ),
              child ?? const SizedBox.shrink(),
            ],
          );
        },
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF2D90A8)),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}