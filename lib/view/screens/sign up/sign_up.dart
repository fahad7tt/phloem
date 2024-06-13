// ignore_for_file: avoid_print, duplicate_ignore
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/signup_controller.dart';
import 'package:phloem_app/view/screens/sign%20in/sign_in.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(), // Initializing the controller
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    'images/phloem_logo.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Create an Account',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildNameTextField(controller),
                  const SizedBox(height: 20),
                  _buildEmailTextField(controller),
                  const SizedBox(height: 20),
                  _buildPasswordTextField(controller),
                  const SizedBox(height: 20),
                  _buildConfirmPasswordTextField(controller),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      controller.signUp();
                    },
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const SignInPage());
                        },
                        child: const Text(
                          ' Login',
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

  Widget _buildNameTextField(SignUpController controller) {
    return TextFormField(
      controller: controller.nameController,
      decoration: const InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a valid name';
        } else if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
          return 'Name can only contain alphabets';
        } else if (value.length > 20) {
          return 'Name must not exceed 20 characters';
        }
        return null;
      },
      onSaved: (value) => controller.signUpModel.userName = value!,
    );
  }

  Widget _buildEmailTextField(SignUpController controller) {
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
      onSaved: (value) => controller.signUpModel.email = value!,
    );
  }

  Widget _buildPasswordTextField(SignUpController controller) {
    return TextFormField(
      controller: controller.passwordController,
      decoration: const InputDecoration(labelText: 'Password'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a password';
        } else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        } else if (!_containsSpecialCharacter(value)) {
          return 'Password must contain at least one special character';
        }
        return null;
      },
      onSaved: (value) => controller.signUpModel.password = value!,
    );
  }

  bool _containsSpecialCharacter(String value) {
    //list of special characters
    List<String> specialCharacters = [
      '!',
      '@',
      '#',
      '\$',
      '%',
      '^',
      '&',
      '*',
      '(',
      ')',
      '-',
      '_',
      '+',
      '='
    ];

    // Check if the value contains any special character
    for (var character in specialCharacters) {
      if (value.contains(character)) {
        return true;
      }
    }
    return false;
  }

  Widget _buildConfirmPasswordTextField(SignUpController controller) {
    return TextFormField(
      controller: controller.confirmPasswordController,
      decoration: const InputDecoration(labelText: 'Confirm Password'),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password again';
        } else if (value != controller.passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      onSaved: (value) => controller.signUpModel.password = value!,
    );
  }
}
