import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// Sign up with email and password
  Future<void> signUp(
      String email, String password, String repeatPassword) async {
    if (password != repeatPassword) {
      // Passwords do not match
      Get.snackbar(
        'Error',
        'Passwords do not match. Please try again.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Registration successful
      Get.snackbar(
        'Success',
        'Account created successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      // Registration failed
      String errorMessage = 'Failed to create an account. Please try again.';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }
      Get.snackbar(
        'Error',
        errorMessage,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

// Log in with email and password
  Future<void> login(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Login successful
      Get.snackbar(
        'Success',
        'Logged in successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      // Login failed
      String errorMessage = 'Failed to log in. Please try again.';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
      }
      Get.snackbar(
        'Error',
        errorMessage,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  // Log out the current user
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
    Get.snackbar('Success', 'Logged out successfully!',
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}
