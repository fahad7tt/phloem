import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/onboarding_controller.dart';
import 'package:phloem_app/view/screens/sign%20in/sign_in.dart';
import 'onboarding_screen.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingController onboardingController =
      Get.put(OnboardingController());
  final PageController _pageController = PageController();

  OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) =>
                    onboardingController.currentPageIndex.value = index,
                children: [
                  OnboardingScreen(
                    imagePath: 'images/onboarding1.jpg',
                    title: 'Welcome to E-Learning',
                    subtitle: 'Learn anytime, anywhere!',
                    onSkipPressed: () {
                      // Navigate to the login page
                      Get.offAll(() => const SignInPage());
                    },
                  ),
                  OnboardingScreen(
                    imagePath: 'images/onboarding2.png',
                    title: 'Explore Courses',
                    subtitle: 'Discover a variety of courses.',
                    onSkipPressed: () {
                      // Navigate to the login page
                      Get.offAll(() => const SignInPage());
                    },
                  ),
                  const OnboardingScreen(
                    imagePath: 'images/onboarding3.jpg',
                    title: 'Start Learning',
                    subtitle: 'Unlock your potential!',
                    showSkipButton: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  if (onboardingController.isLastPage()) {
                    Get.to(() => const SignInPage());
                  } else {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease);
                  }
                },
                child: Obx(() => Text(
                      onboardingController.isLastPage()
                          ? 'Get Started'
                          : 'Next',
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}