import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/signin_controller.dart';
import 'package:phloem_app/repository/authentication_repository.dart';
import 'package:phloem_app/view/screens/home/home.dart';
import 'package:phloem_app/view/screens/sign%20up/sign_up.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignInController>(
      init: SignInController(), // Initializing the controller
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 80),
                  Image.asset(
                    'images/phloem_logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildEmailTextField(controller),
                  const SizedBox(height: 20),
                  _buildPasswordTextField(controller),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      controller.signIn();
                    },
                    child: const Text('Sign In'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: () {
                      //method to sign in with Google
                      AuthenticationRepository()
                          .signInWithGoogle()
                          .then((userCredential) {
                        //sign-in success
                        final email = userCredential.user!.email;
                        //Snackbar with the email used for authentication
                        Get.snackbar(
                          'Successfully signed in',
                          'Signed in with $email',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        //navigate to the home page after successful sign-in
                        Get.offAll(
                            const HomePage()); 
                      }).catchError((error) {
                        //sign-in error
                        // ignore: avoid_print
                        print('Sign-in with Google failed: $error');
                        // Show error message to the user
                        Get.snackbar(
                          'Error',
                          'Sign-in with Google failed. Please try again later.',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      });
                    },
                    icon: Image.asset(
                      'images/google_logo.png',
                      width: 14,
                      height: 14,
                    ),
                    label: const Text('Continue with Google'),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignUpPage());
                        },
                        child: const Text(
                          ' Sign up',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextField(SignInController controller) {
    return TextFormField(
      controller: controller.emailController,
      decoration: const InputDecoration(labelText: 'Email'),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty || !GetUtils.isEmail(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      onSaved: (value) => controller.signInModel.email = value!,
    );
  }

  Widget _buildPasswordTextField(SignInController controller) {
    return TextFormField(
      controller: controller.passwordController,
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        }
        return null;
      },
      onSaved: (value) => controller.signInModel.password = value!,
    );
  }
}