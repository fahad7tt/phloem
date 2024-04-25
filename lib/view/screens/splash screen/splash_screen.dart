import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/view/screens/onboarding/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Get.off(() => OnboardingPage()),
    );

    return Scaffold(
      body: Center(
        child: Image.asset('images/phloem_logo.png'),
      ),
    );
  }
}