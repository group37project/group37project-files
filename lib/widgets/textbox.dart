import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:welly/controllers/controllers.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({
    super.key,
    this.keyboardType = TextInputType.text,
    required this.textEditingController,
    required this.hintText,
    required this.label,
  });

  final TextEditingController textEditingController;
  final String hintText;
  final String label;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)),
          child: TextField(
            keyboardType: keyboardType,
            controller: textEditingController,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: hintText),
          ),
        ),
      ],
    );
  }
}

class DropDownTextFieldBox extends StatefulWidget {
  const DropDownTextFieldBox({
    super.key,
    required this.hintText,
    required this.label,
    required this.textEditingController,
    required this.dropdownItems,
  });

  final String hintText;
  final String label;
  final TextEditingController textEditingController;
  final List<DropdownMenuItem> dropdownItems;

  @override
  State<DropDownTextFieldBox> createState() => _DropDownTextFieldBoxState();
}

class _DropDownTextFieldBoxState extends State<DropDownTextFieldBox> {
  AnalysisFormController analysisFormController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)),
          child: DropdownButtonFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hintText,
            ),
            items: widget.dropdownItems,
            onChanged: (value) {
              if (value == false || value == true) {
                analysisFormController.isSmoker.value = value;
              } else {
                setState(() {
                  widget.textEditingController.text = value;
                });
              }
            },
          ),
        ),
      ],
    );
  }
}
