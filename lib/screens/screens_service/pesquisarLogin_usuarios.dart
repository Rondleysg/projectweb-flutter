import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/screens/screens_service/usuarioPesquisa.dart';
import 'package:webproject/widgets/confirmationDialog.dart';
import 'package:webproject/ws/UsuarioWs.dart';

class PesquisarLoginUsuario extends StatefulWidget {
  final Usuario usuario;
  const PesquisarLoginUsuario({Key? key, required this.usuario}) : super(key: key);

  @override
  _PesquisarLoginUsuarioScreenState createState() => _PesquisarLoginUsuarioScreenState();

}

class _PesquisarLoginUsuarioScreenState extends State<PesquisarLoginUsuario> {
  final _formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();
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
                        "Procurar usuário por login:",
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
                                  return 'Porfavor insira um login';
                                }
                                return null;
                              },
                              decoration: InputDecoration(labelText: 'Login do usuário: ',labelStyle: TextStyle(
                                fontSize: 25,
                              )),
                              controller: loginController,
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
                              if (_formKey.currentState!.validate()) {
                                usuProcurado = await _getUsuario(loginController.text).then((value) {
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

  Future<Usuario?> _getUsuario(String login) async{
    return await UsuarioWs().getUsuarioLogin(token: widget.usuario.usuTxToken!, login: login);
  }

  void _exibirDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return confirmationDialog(
              text: 'Login não existe!',
              desc: 'Erro ao buscar id: Login não existe.');
        }
    );
  }

}