import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/screens/screens_service/usuarioPesquisa.dart';
import 'package:webproject/widgets/confirmationDialog.dart';
import 'package:webproject/ws/UsuarioWs.dart';

class PesquisarIdUsuario extends StatefulWidget {
  final Usuario usuario;
  const PesquisarIdUsuario({Key? key, required this.usuario}) : super(key: key);

  @override
  _PesquisarIdUsuarioScreenState createState() => _PesquisarIdUsuarioScreenState();

}

class _PesquisarIdUsuarioScreenState extends State<PesquisarIdUsuario> {
  final _formKey = GlobalKey<FormState>();
  final idController = TextEditingController();
  late Usuario? usuProcurado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(),
          body: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: SizedBox(
                            child: const Text(
                              "Procurar usuário por id:",
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                            )),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 40, 16, 0),
                                child: SizedBox(
                                    height: 200,
                                    width: 300,
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Porfavor insira um id';
                                        } else if (!isNumeric(value)) {
                                          return 'Somente números';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(labelText: 'Id do usuário: ',labelStyle: TextStyle(
                                        fontSize: 25,
                                      )),
                                      controller: idController,
                                    ))),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: 330,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () async{
                                      if (_formKey.currentState!.validate() && isNumeric(idController.text)) {
                                          usuProcurado = await _getUsuario(idController.text).then((value) {
                                            if(value==null){
                                              _exibirDialog(context);
                                            }else{
                                              Navigator.push(context, MaterialPageRoute(
                                                  builder: (context)=>PageUsuarioPesquisa(usuProcurado: value)));
                                            }
                                          });
                                      }
                                    },
                                    child: const Text(
                                      'Buscar',
                                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )))
                      ],
                    ),
                  ),
                ],
              ),
            );

  }

  Future<Usuario?> _getUsuario(String id) async{
    return await UsuarioWs().getUsuarioId(token: widget.usuario.usuTxToken!, id: id);
  }

  void _exibirDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return confirmationDialog(
              text: 'Id não existe!',
              desc: 'Erro ao buscar id: Id não existe.');
        }
    );
  }

}