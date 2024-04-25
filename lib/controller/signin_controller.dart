import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/home/home.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signInModel = UserModel(email: '', password: '');

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        // Sign in the user with Firebase Authentication
        final userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Retrieve user data from Firestore
        final userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .get();

        // Do something with the user data, e.g., store in a controller
        final userData = userSnapshot.data();
        // print the user data
        // ignore: avoid_print
        print('User Data: $userData');

        // Navigate to the home page after successful sign-in
        Get.offAll(const HomePage());
      } catch (error) {
        // Handle sign-in error
        // ignore: avoid_print
        print('Sign-in failed: $error');
        // Show error message to the user
        Get.snackbar(
          'Error',
          'Sign-in failed. Please check your credentials and try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}