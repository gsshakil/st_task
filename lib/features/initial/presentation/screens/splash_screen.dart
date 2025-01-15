import 'package:flutter/material.dart';
import 'package:st_task/core/constants/app_constants.dart';
import 'package:st_task/features/initial/presentation/screens/getting_started_screen.dart';
import 'package:st_task/features/initial/presentation/widgets/splash.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(
          seconds: AppConstants.splashDuration,
        )),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Splash();
          } else {
            return const GettingStartedScreen();
          }
        });
  }
}
