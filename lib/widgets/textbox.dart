import 'package:flutter/material.dart';

class TextFieldBox extends StatelessWidget {
  const TextFieldBox({
    super.key,
    required this.textEditingController,
    required this.hintText,
  });

  final TextEditingController textEditingController;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          color: Colors.white,
          borderRadius: BorderRadius.circular(4)),
      child: TextField(
        controller: textEditingController,
        decoration:
            InputDecoration(border: InputBorder.none, hintText: hintText),
      ),
    );
  }
}

class DropDownTextFieldBox extends StatefulWidget {
  const DropDownTextFieldBox({
    super.key,

    required this.hintText,
  });


  final String hintText;

  @override
  State<DropDownTextFieldBox> createState() => _DropDownTextFieldBoxState();
}

class _DropDownTextFieldBoxState extends State<DropDownTextFieldBox> {
  List<DropdownMenuItem> dropdownItems = [
    DropdownMenuItem(
      child: Text('Male'),
      value: 0,
    ),
    DropdownMenuItem(
      child: Text('Female'),
      value: 1,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
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
        items: dropdownItems,
        onChanged: (value) {},
      ),
    );
  }
}
