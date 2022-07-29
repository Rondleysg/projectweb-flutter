import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/screens/login.dart';
import 'package:webproject/widgets/confirmationDialog.dart';
import 'package:webproject/widgets/textFormCadastro.dart';
import 'package:webproject/ws/UsuarioWs.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

String login = '', senha = '', nome = '';
Usuario? usuario;


class _CadastroState extends State<Cadastro> {


  final _formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover,),
              ),
            ),
            SingleChildScrollView(
              child:
              Center(
                child:
                Container(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Cadastrar', style: TextStyle(
                          fontSize: 75,
                          fontFamily: 'burbank-big',
                          color: Colors.black54
                      )),
                      const Image(image: AssetImage('assets/images/rondley.png'),color: Colors.black54,width: 200,),
                      const Divider(
                        color: Colors.transparent,
                      ),
                      Form(key: _formKey ,child: Padding(padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Column(
                          children: [
                            textFormCadastro(textValidator: 'Porfavor insira seu nome', controller: nomeController, hintText: 'Informe seu Nome',
                              labelText: "Nome", onChanged: (String nometext) async {
                                nome = nometext;
                              },),
                            textFormCadastro(textValidator: 'Porfavor insira um login', hintText: 'Informe o Login',
                              labelText: "Login", onChanged: (String logintext) async {
                                login = logintext;
                              },),
                            textFormCadastro(hintText: 'Informe a Senha', labelText: "Senha",
                              onChanged: (String senhatext) async {
                                senha = senhatext;
                              },),
                            textFormCadastro(textValidator: 'Senhas diferentes', controller: senhaController, hintText: 'Confirme sua Senha',
                              labelText: "Confirmar Senha", onChanged: (String senha2text) async {
                              },),
                          ],
                        ),),),

                      Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: ButtonTheme(
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            child: Column(
                              children: [
                                ElevatedButton(onPressed: () async {
                                  if(_formKey.currentState!.validate()){
                                    usuario = await UsuarioWs().criarConta(nome: nome, login: login, senha: senha);
                                    if(usuario!=null){
                                      _cadastroSucesso(context);
                                    }else{
                                      _acionarDialog(context);
                                    }}else{
                                  }
                                },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.black26),
                                      elevation: MaterialStateProperty.all(5),
                                      minimumSize: MaterialStateProperty.all(Size(150, 60))),
                                  child: Text(
                                    "Cadastrar",
                                    style: TextStyle(color: Colors.black45, fontSize: 50, fontFamily: 'burbank-big', fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Já tem uma conta? ',style: TextStyle(
                                          fontSize: 20
                                      ),),
                                      TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Login())) , child: Text('Login',style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF4B39EF),
                                          fontWeight: FontWeight.bold
                                      ),))
                                    ],
                                  ),)
                              ],
                            )
                        ),),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );

  }
}

Future<bool> _verificarLogin(String loginVerificar) async{
  bool loginExiste = await UsuarioWs().usuarioExiste(login: loginVerificar);
  return loginExiste;
}

_acionarDialog(BuildContext context) async{
  bool loginExiste = await _verificarLogin(login);
  if(loginExiste){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return confirmationDialog(
              text: 'Login existente!',
              desc: 'Erro na tentativa de criar conta (Login já existente!).');
        }
    );
  }else {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return confirmationDialog(
              text: 'Erro inesperado!',
              desc: 'Erro na tentativa de criar conta (213).');
        }
    );
  }
}

void _cadastroSucesso(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastro Realizado!!'),
          content: Text('Seu cadastro foi realizado com sucesso.'),
          actions: [
            TextButton(onPressed: ()=>{
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context)=>Login()),(Route<dynamic> route) => false)
            }, child: Text('OK'))
          ],
        );
      }

  );
}
