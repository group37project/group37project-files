import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welly/controllers/controllers.dart';
import 'package:welly/models/analysis_model.dart';
import 'package:welly/widgets/widgets.dart';

class AnalysisForm extends StatelessWidget {
  const AnalysisForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnalysisFormController analysisFormController =
        Get.put(AnalysisFormController());
    ApiService apiService = Get.put(ApiService());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 25.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ListView(
            shrinkWrap: true,
            children: [
              const Text(
                'Analysis Form',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Fill this records below to determine your cost of insurance charges',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              DropDownTextFieldBox(
                label: 'Select Gender',
                textEditingController: analysisFormController.genderController,
                hintText: 'Select Gender',
                dropdownItems: const [
                  DropdownMenuItem(
                    value: 'male',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem(
                    value: 'female',
                    child: Text('Female'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFieldBox(
                label: 'Enter Age',
                keyboardType: TextInputType.number,
                textEditingController: analysisFormController.ageController,
                hintText: 'Enter Age eg 20',
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFieldBox(
                label: 'Enter BMI',
                keyboardType: TextInputType.number,
                textEditingController: analysisFormController.bmiController,
                hintText: 'Enter BMI eg 21.7',
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextFieldBox(
                label: 'How many children',
                keyboardType: TextInputType.number,
                textEditingController:
                    analysisFormController.childrenController,
                hintText: 'Enter number of children',
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropDownTextFieldBox(
                label: 'Are you a Smoker',
                textEditingController: analysisFormController.genderController,
                hintText: 'Are you a Smoker',
                dropdownItems: const [
                  DropdownMenuItem(
                    value: true,
                    child: Text('Yes'),
                  ),
                  DropdownMenuItem(
                    value: false,
                    child: Text('No'),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              DropDownTextFieldBox(
                label: 'Select Region',
                textEditingController: analysisFormController.regionController,
                hintText: 'Select region',
                dropdownItems: const [
                  DropdownMenuItem(
                    value: 'northeast',
                    child: Text('North East'),
                  ),
                  DropdownMenuItem(
                    value: 'northwest',
                    child: Text('North West'),
                  ),
                  DropdownMenuItem(
                    value: 'southeast',
                    child: Text('South East'),
                  ),
                  DropdownMenuItem(
                    value: 'southwest',
                    child: Text('South West'),
                  )
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const SizedBox(
                height: 40.0,
              ),
              AppButton(
                actionName: 'Save',
                function: () {
                  if (analysisFormController.areAllFieldsFilled()) {
                    FormDataModel formData = FormDataModel(
                      age: analysisFormController.ageController.text,
                      region: analysisFormController.regionController.text,
                      children: int.parse(
                          analysisFormController.childrenController.text),
                      bmi: analysisFormController.bmiController.text,
                      gender: analysisFormController.genderController.text,
                      isSmoker: analysisFormController.isSmoker.value,
                    );

                    apiService.postFormData(formData.toMap());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
