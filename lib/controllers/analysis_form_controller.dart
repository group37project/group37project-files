import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AnalysisFormController extends GetxController {
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController childrenController = TextEditingController();
  TextEditingController bmiController = TextEditingController();

  var isSmoker = false.obs;

  // ... Add more text editing controllers for other fields

  @override
  void dispose() {
    // Dispose the text editing controllers when the controller is disposed
    ageController.dispose();
    regionController.dispose();
    childrenController.dispose();
    bmiController.dispose();
    genderController.dispose();

    super.dispose();
  }

  bool areAllFieldsFilled() {
    if (genderController.text.isEmpty ||
        ageController.text.isEmpty ||
        regionController.text.isEmpty ||
        childrenController.text.isEmpty ||
        bmiController.text.isEmpty) {
      print('Error');
      Get.snackbar('Error', 'Please fill in all fields.',
          backgroundColor: Colors.black, colorText: Colors.white);
      return false;
    }
    return true;
  }
}
