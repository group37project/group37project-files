import 'package:flutter/material.dart';
import 'package:welly/screens/screens.dart';
import 'package:welly/widgets/widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        child: Column(
          children: [
            Spacer(),
            Text(
              'Welly',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Wellness and Health Insurance Prediction',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              'Log In',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            TextFieldBox(
              textEditingController: TextEditingController(),
              hintText: 'Enter username eg samberocan',
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFieldBox(
              textEditingController: TextEditingController(),
              hintText: 'Enter password',
            ),
            SizedBox(height: 40.0),
            AppButton(
              actionName: 'Login',
              function: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnalysisForm()));
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text('Don\'t have account?, Sign Up'))
          ],
        ),
      ),
    );
  }
}




