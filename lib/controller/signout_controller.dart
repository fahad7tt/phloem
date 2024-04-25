import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phloem_app/view/screens/sign%20in/sign_in.dart';

class SignOutController extends GetxController {
  
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navigate to the sign-in page after successful sign-out
      Get.offAll(const SignInPage());
    } catch (error) {
      // ignore: avoid_print
      print('Sign-out failed: $error');
      // Show error message to the user
      Get.snackbar(
        'Error',
        'Sign-out failed. Please try again later.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}