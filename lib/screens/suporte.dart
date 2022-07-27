import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';

class Suporte extends StatefulWidget {

  final Usuario usuario;
  Suporte(this.usuario);

  @override
  State<Suporte> createState() => _SuporteState();
}

class _SuporteState extends State<Suporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsetsDirectional.fromSTEB(34, 44, 100, 0),
            child: Text('Suporte,', style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold, color: Color(0xFF4B39EF)),),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(34, 10, 0, 0),
            child: Text('Como podemos ajudar?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),)
          ],
        ),
      ),
    );
  }



}