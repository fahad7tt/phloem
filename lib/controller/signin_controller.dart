import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/home/home.dart';

class SignInController extends GetxController {
  static String? mentorEmail = FirebaseAuth.instance.currentUser!.email;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final signInModel = UserModel(userName: '', email: '', password: '');

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

            // Check if user data exists, if not create a new document
        if (!userSnapshot.exists) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'username': nameController.text.trim(),
            'email': emailController.text.trim(),
          });
        }

        // Retrieve updated user data
        final userData = userSnapshot.data() ?? {
          'username': nameController.text.trim(),
          'email': emailController.text.trim(),
        };

        // Create a UserModel instance
        UserModel user = UserModel(
          userName: userData['username'],
          email: userData['email'],
        );

        // Navigate to the home page after successful sign-in
        Get.offAll(HomePage(user: user));
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}