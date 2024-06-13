import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // Current page index of the onboarding screens
  var currentPageIndex = 0.obs;

  // Whether the onboarding process is complete
  var isOnboardingComplete = false.obs;

  // Function to go to the next onboarding screen
  void nextPage() {
    if (currentPageIndex.value < 2) {
      currentPageIndex.value++;
    } else {
      // Set onboarding as complete when reaching the last screen
      isOnboardingComplete.value = true;
    }
  }

  // Function to check if it's the last onboarding screen
  bool isLastPage() {
    return currentPageIndex.value == 2;
  }
}