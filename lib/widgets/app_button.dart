
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.actionName, required this.function});
  final String actionName;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 60.0,
            child: CupertinoButton(
              borderRadius: BorderRadius.circular(4.0),
              child: Text(
                actionName,
                style: TextStyle(color: Colors.white),
              ),
              onPressed: function,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
