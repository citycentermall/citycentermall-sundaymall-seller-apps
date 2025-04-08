import 'package:flutter/material.dart';
import 'package:sunday_mall/views/screens/onboarding/onboading_screen.dart';

void main() {
  runApp(const MyApp());
}

/// test time

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

