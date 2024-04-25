import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/sign%20in/sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final signUpModel = UserModel(email: '', password: '');

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      try {
        // Create user account with Firebase Authentication
        final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        // Save user data to Firestore
        await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
          'email': emailController.text.trim(),
          'password' : passwordController.text.trim(),
        });

        // Navigate to the sign-in page after successful sign-up
        Get.off(const SignInPage());
      } catch (error) {
        // Handle sign-up error
        // ignore: avoid_print
        print('Sign-up failed: $error');
        Get.snackbar(
          'Error',
          'Sign-up failed. Please try again later.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}