import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welly/controllers/controllers.dart';
import 'package:welly/screens/screens.dart';
import 'package:welly/widgets/widgets.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    AccountController accountController = Get.put(AccountController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              'Welly',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Wellness and Health Insurance Prediction',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Text(
              'Get Started',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextFieldBox(
              label: 'WHat is your email address',
              textEditingController: accountController.emailController,
              hintText: 'Enter email address eg samberocan@gmail.com',
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBox(
              label: 'Create password',
              textEditingController: accountController.passwordController,
              hintText: 'Enter password',
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBox(
              label: 'Repeat password',
              textEditingController: accountController.repeatPasswordController,
              hintText: 'Repeat password',
            ),
            const SizedBox(height: 40.0),
            AppButton(
              actionName: 'Sign Up',
              function: () {
                authController.signUp(
                  accountController.emailController.text,
                  accountController.passwordController.text,
                  accountController.repeatPasswordController.text,
                );
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
                child: const Text('Have an account?, Sign In'))
          ],
        ),
      ),
    );
  }
}
