
import 'dart:io';

import 'package:tflite_flutter/tflite_flutter.dart';

void main() {

  loadModel();

}

Future<void> loadModel() async {
  try {
    String modelPath = 'assets/model.tflite';
    final interpreter = await Interpreter.fromFile(File(modelPath));

    // Allocate memory for the input tensor
    interpreter.allocateTensors();

    // Prepare input data (apply the same preprocessing or scaling if needed)
    var input = [
      [43, 1.9, 97.3, 27, 24.4, 35, 66, 9, 1944, 38, 1, 1]
    ];

    // Convert input data to float32 (if needed)
    var inputFloat32 = input.map((list) => list.map((value) => value.toDouble()).toList()).toList();

    // Get input tensor information
    var inputTensor = interpreter.getInputTensor(0);
    var inputType = inputTensor.type;
    var inputShape = inputTensor.shape;

    print(inputType); // output float32
    print(inputShape); // output [1, 23]

    // Prepare output tensor
    var output = List.filled(1 * 1, 0).reshape([1, 1]);

    // Perform inference
    interpreter.run(inputFloat32, output);

    // Print the output
    print(inputFloat32);
    print(output);

    // Dispose the interpreter when finished
    // interpreter.close();
  } catch (e) {
    print('Failed to load the model: $e');
  }
}