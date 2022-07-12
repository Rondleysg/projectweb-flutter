
import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/widgets/confirmationDialog.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

String login = '', senha = '';
Usuario? usuario = new Usuario();


class _CadastroState extends State<Cadastro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();

  }
}
