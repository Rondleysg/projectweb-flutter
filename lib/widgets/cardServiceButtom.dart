import 'package:flutter/material.dart';

class cardServiceButtom extends StatelessWidget {
  IconData icon;
  String text;
  Function()? onPressed;
  cardServiceButtom({required this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
      child: Row(children: [
        Icon(icon, size: 30,),
        const VerticalDivider(color: Colors.transparent,),
        TextButton(onPressed: onPressed,child: Text(text, style: const TextStyle(
            fontSize: 17,
            color: Colors.black54
        ),),)
      ],),);
  }
}
