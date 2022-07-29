import 'package:flutter/material.dart';

class confirmationDialog extends StatelessWidget {
  String text;
  String desc;

  confirmationDialog({required this.text, required this.desc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(text),
      content: Text(desc),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('OK', style: TextStyle(color: Color(0xFF6200EE)),),
        ),
      ],
    );
  }
}
