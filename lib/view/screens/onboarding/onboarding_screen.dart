import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final bool showSkipButton;
  final VoidCallback? onSkipPressed;

  const OnboardingScreen({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.showSkipButton = true,
    this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
        if (showSkipButton) ...[
          Positioned(
            top: 10,
            right: 18,
            child: ElevatedButton(
              onPressed: onSkipPressed,
              child: const Text('Skip'),
            ),
          ),
        ],
      ],
    );
  }
}
