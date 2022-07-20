
import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/widgets/confirmationDialog.dart';
import 'package:webproject/ws/UsuarioWs.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

String login = '', senha = '';
Usuario? usuario = new Usuario();


void _exibirDialogNaoExiste(BuildContext context){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return confirmationDialog(
          text: 'Login inexistente!',
          desc: 'Erro ao fazer login: Login não existe.');
    }
  );
}

Future _acionarDialog(BuildContext context) async{
  bool responseExiste = await UsuarioWs().usuarioExiste(login: login);
  if(responseExiste){
  _exibirDialogExiste(context);
  }else{
  _exibirDialogNaoExiste(context);
  }
}

void _exibirDialogExiste(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return confirmationDialog(
            text: 'Senha incorreta!',
            desc: 'Erro ao fazer login: senha incorreta.');
      }
  );
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return Scaffold(
        //resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover,),
              ),
            ),
            Center(
              child:
              Container(
                padding: const EdgeInsets.all(35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Login', style: TextStyle(
                        fontSize: 75,
                        fontFamily: 'burbank-big',
                        color: Colors.black54
                    )),
                    Image(image: AssetImage('assets/images/rondley.png'),color: Colors.black54,width: 200,),
                    Divider(
                      color: Colors.transparent,
                    ),
                    TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black45, fontSize: 40, fontFamily: 'burbank-big-light',
                          fontWeight: FontWeight.w900),
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Informe o Login',
                        hintStyle: TextStyle(fontSize: 25),
                        labelText: "Login",
                        labelStyle: TextStyle(color: Colors.black, fontSize: 30)
                      ),
                      onChanged: (String logintext) async {
                        login = logintext;
                      },
                    ),
                    TextField(
                      autofocus: true,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(color: Colors.black45, fontSize: 40, fontFamily: 'burbank-big-light', fontWeight: FontWeight.w900),
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                          prefixIcon: Icon(Icons.password),
                          hintText: 'Informe a Senha',
                          hintStyle: TextStyle(fontSize: 25),
                          labelText: "Senha",
                          labelStyle: TextStyle(color: Colors.black, fontSize: 30)
                      ),
                      onChanged: (String senhatext) async {
                        senha = senhatext;
                      },
                    ),
                    ButtonTheme(
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        child: Column(
                          children: [
                            ElevatedButton(onPressed: () async {
                              usuario = await UsuarioWs().autenticarUsuario(login: login, senha: senha);
                              if(usuario!=null){
                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                    builder: (context)=>Home(usuario!)),(Route<dynamic> route) => false);
                              }else{
                                _acionarDialog(context);
                              }
                            },
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.black26),
                                  elevation: MaterialStateProperty.all(5),
                                  minimumSize: MaterialStateProperty.all(Size(150, 60))),
                              child: Text(
                                "Entrar",
                                style: TextStyle(color: Colors.black45, fontSize: 50, fontFamily: 'burbank-big', fontWeight: FontWeight.normal),
                              ),
                            ),
                            ButtonTheme(child: TextButton(
                              onPressed: () => {debugPrint('toquei2'),},
                              style: ButtonStyle(),
                              child: Text(
                                "Esqueci a senha",
                                style: TextStyle(color: Colors.blueGrey, fontSize: 20, fontFamily: 'burbank-big', fontWeight: FontWeight.normal),
                              ),
                            ))
                          ],
                        )
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );

  }
}
