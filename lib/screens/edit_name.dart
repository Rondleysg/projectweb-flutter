import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/screens/login.dart';
import 'package:string_validator/string_validator.dart';
import 'package:webproject/ws/UsuarioWs.dart';

class EditNameFormPage extends StatefulWidget {

  final Usuario usuario;
  const EditNameFormPage({Key? key, required Usuario this.usuario}) : super(key: key);

  @override
  EditNameFormPageState createState() {
    return EditNameFormPageState();
  }
}

class EditNameFormPageState extends State<EditNameFormPage> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final secondNameController = TextEditingController();
  var user = usuario;



  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  void updateUserName(String name) {
    user?.usuTxNome = name;
  }

  @override
  Widget build(BuildContext context) {
    //List<String> nomeCompleto=widget.usuario.usuTxNome!.split(' ');
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black), // set backbutton color here which will reflect in all screens.
          leading: BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                  width: 330,
                  child: const Text(
                    "Editar Nome:",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Porfavor insira seu primeiro nome';
                              } else if (!isAlpha(value)) {
                                return 'Somente letras';
                              }
                              return null;
                            },
                            decoration:
                            InputDecoration(labelText: 'Primeiro nome'),
                            controller: firstNameController,
                          ))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                      child: SizedBox(
                          height: 100,
                          width: 150,
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Porfavor insira seu segundo nome';
                              } else if (!isAlpha(value)) {
                                return 'Somente letras';
                              }
                              return null;
                            },
                            decoration:
                            InputDecoration(labelText: 'Segundo nome'),
                            controller: secondNameController,
                          )))
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: 330,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () async{
                            if (_formKey.currentState!.validate() && isAlpha(firstNameController.text + secondNameController.text)) {
                              updateUserName(firstNameController.text +
                                  " " +
                                  secondNameController.text);
                              UsuarioWs().salvarNome(novoNome: firstNameController.text + " " + secondNameController.text,
                                  token: widget.usuario.usuTxToken!);
                              Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            'Salvar',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      )))
            ],
          ),
        ));
  }
}