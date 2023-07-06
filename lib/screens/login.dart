import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welly/controllers/controllers.dart';
import 'package:welly/screens/screens.dart';
import 'package:welly/widgets/widgets.dart';

import '../controllers/account_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.put(AccountController());
    AuthController authController = Get.put(AuthController());
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
              'Log In',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            TextFieldBox(
              label: 'What is your email address',
              textEditingController: accountController.emailController,
              hintText: 'Enter username eg samberocan',
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFieldBox(
              label: 'What is your password',
              textEditingController: accountController.passwordController,
              hintText: 'Enter password',
            ),
            const SizedBox(height: 40.0),
            AppButton(
              actionName: 'Login',
              function: () {
                authController.login(accountController.emailController.text,
                    accountController.passwordController.text);
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text('Don\'t have account?, Sign Up'))
          ],
        ),
      ),
    );
  }
}
