import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:welly/screens/screens.dart';

class ApiService extends GetxController {
  Future<void> postFormData(Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        headers: {'Content-Type': 'application/json'},
        Uri.parse(
            'https://7fbe-41-190-139-2.ngrok-free.app/predict_insurance_cost'),
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        // Successful post request
        Get.snackbar(
          'Success',
          'Data sent successfully!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        Get.to(const Successful());
      } else {
        // Error in post request
        Get.snackbar('Error', 'Failed to send data. Please try again.');
      }
    } catch (e) {
      // Exception occurred
      Get.snackbar('Error', 'An error occurred. Please try again.');
    }
  }

  Future<void> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://your-api-endpoint.com/get-data'));
      if (response.statusCode == 200) {
        // Successful get request
        final responseData = response.body;
        // Process the retrieved data as per your requirement
        Get.snackbar('Success', 'Data retrieved successfully!');
      } else {
        // Error in get request
        Get.snackbar('Error', 'Failed to retrieve data. Please try again.');
      }
    } catch (e) {
      // Exception occurred
      Get.snackbar('Error', 'An error occurred. Please try again.');
    }
  }
}
