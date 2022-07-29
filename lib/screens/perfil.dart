import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/screens/edit_name.dart';
import 'package:webproject/screens/home.dart';
import 'package:webproject/screens/login.dart';
import 'package:webproject/widgets/DisplayImage.dart';

class Perfil extends StatefulWidget {

  final Usuario usuario;
  Perfil({Key? key, required Usuario this.usuario}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: ()=>{
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
          builder: (context)=>Home(usuario!)),(Route<dynamic> route) => false)
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          const Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Editar Perfil',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(64, 105, 225, 1),
                    ),
                  ))),
          InkWell(
              onTap: () {
              },
              child: DisplayImage(
                imagePath: 'https://igd-wp-uploads-pluginaws.s3.amazonaws.com/wp-content/uploads/2016/05/30105213/Qual-e%CC%81-o-Perfil-do-Empreendedor.jpg',
                onPressed: () {},
              )),
          buildUserInfoDisplay(widget.usuario.usuTxNome, 'Name', EditNameFormPage(usuario: usuario!,)),
          buildUserInfoDisplay(widget.usuario.usuTxLogin, 'Login', EditNameFormPage(usuario: usuario!,)),
          buildUserInfoDisplay(widget.usuario.usuTxSenha, 'Senha', EditNameFormPage(usuario: usuario!,)),
        ],
      ),
    );
  }

  Widget buildUserInfoDisplay(String? getValue, String title, Widget editPage) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                  width: 350,
                  height: 40,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue ?? '',
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));


  // Refrshes the Page after updating user info.
  Future onGoBack(dynamic value) async{
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }

}