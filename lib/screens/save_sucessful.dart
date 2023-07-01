import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:welly/screens/screens.dart';
import 'package:welly/widgets/widgets.dart';

class Successful extends StatelessWidget {
  const Successful({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        child: Column(
          children: [
            Spacer(),
            Icon(Icons.check_circle, size: 100.0, color: Colors.green),
            Text(
              'Saved Successfully',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Your form has been saved successfully',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            AppButton(
              actionName: 'Go Home',
              function: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnalysisForm()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
