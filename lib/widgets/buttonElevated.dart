import 'package:flutter/material.dart';

class buttonElevated extends StatelessWidget {

  final Function callback;
  final String text;
  final ButtonStyle style;
  const buttonElevated({required this.callback, required this.text, required this.style});


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: style,
      child: Text(
        text,
        style: TextStyle(color: Colors.black45, fontSize: 50, fontFamily: 'burbank-big', fontWeight: FontWeight.normal),
      ),
      onPressed: (){
        callback();
      },
    );
  }
}