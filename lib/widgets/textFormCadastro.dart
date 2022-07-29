import 'package:flutter/material.dart';

class textFormCadastro extends StatelessWidget {
  final String? textValidator;
  final String hintText, labelText;
  final controller = TextEditingController();
  final Function(String)? onChanged;
  textFormCadastro({Key? key, String? this.textValidator, TextEditingController? controller,
    required String this.hintText, required String this.labelText, required Function(String)? this.onChanged}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
      child: TextFormField(
        validator: (value){
          if (value == null || value.isEmpty) {
            return textValidator;
          }
          return null;
        },
        autofocus: true,
        keyboardType: TextInputType.text,
        controller: controller,
        style: const TextStyle(color: Colors.black45, fontSize: 40, fontFamily: 'burbank-big-light', fontWeight: FontWeight.w900),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.black26),
            ),
            prefixIcon: Icon(Icons.drive_file_rename_outline_sharp),
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 25),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black, fontSize: 30)
        ),
        onChanged: onChanged,
      ),);
  }
}