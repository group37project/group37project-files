import 'package:flutter/material.dart';
import 'package:welly/screens/screens.dart';
import 'package:welly/widgets/widgets.dart';

class AnalysisForm extends StatelessWidget {
  const AnalysisForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                'Analysis Form',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Fill this records below to determine your cost of insurance charges',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              DropDownTextFieldBox(
                hintText: 'Select Gender',
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFieldBox(
                textEditingController: TextEditingController(),
                hintText: 'Enter Age eg 20',
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFieldBox(
                textEditingController: TextEditingController(),
                hintText: 'Enter Height eg 1.7',
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFieldBox(
                textEditingController: TextEditingController(),
                hintText: 'Enter Weight eg 70',
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFieldBox(
                textEditingController: TextEditingController(),
                hintText: 'Blood Pressure eg 120/89',
              ),
              SizedBox(height: 40.0),
              AppButton(
                actionName: 'Save',
                function: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Successful()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
