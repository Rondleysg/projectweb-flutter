import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:webproject/screens/cadastro.dart';
import 'package:webproject/screens/login.dart';
import 'package:webproject/widgets/buttonElevated.dart';

class InicioHome extends StatefulWidget {
  const InicioHome({Key? key}) : super(key: key);

  @override
  State<InicioHome> createState() => _InicioHomeState();
}

class _InicioHomeState extends State<InicioHome> {

  mostrarLogin(){
    Future.delayed(Duration.zero, () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
    });
  }
  mostrarCadastro(){
    Future.delayed(Duration.zero, () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Cadastro()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover,),
              ),
            ),
            SingleChildScrollView(child:
            Center(
              child:
              Container(
                padding: const EdgeInsets.all(35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [
                      Text('Bem-vindo', style: TextStyle(
                          fontSize: 45,
                          fontFamily: 'burbank-big',
                          color: Colors.black54
                      )),
                      Divider(color: Colors.transparent,),
                      Text('Aplicativo criado para matéria de Programação WEB I, autenticação e autorização consumindo api externa',
                        style: TextStyle(color: Colors.black54,fontSize: 20, fontFamily: 'burbank-big-light', fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,)
                    ],),
                    Divider(color: Colors.transparent,),
                    Image(image: AssetImage('assets/images/rondley.png'),color: Colors.black54),
                    Divider(color: Colors.transparent,),
                    Column(children: [
                      buttonElevated(callback: ()=>mostrarLogin(), text: "Login", style: new ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200, 60)),),),
                      Divider(color: Colors.transparent,),
                      buttonElevated(callback: ()=>mostrarCadastro(), text: "Cadastrar", style: new ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200, 60))),),
                    ],),
                    Divider(color: Colors.transparent,),
                    Divider(color: Colors.transparent,),
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                    child: Column(children: [
                      Text("Outras formas de login", style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'burbank-big',
                        color: Colors.black54,
                      ), ),
                      Divider(color: Colors.transparent,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: ()=>{}, icon: Icon(
                            MdiIcons.facebook,
                            size: 40,
                          )),
                          IconButton(onPressed: ()=>{}, icon: Icon(
                            MdiIcons.twitter,
                            size: 40,
                          )),
                          IconButton(onPressed: ()=>{}, icon: Icon(
                            MdiIcons.google,
                            size: 40,
                          )),
                        ],
                      )
                    ],),)
                  ],
                ),
              ),
            ),),
          ],
        )
    );
  }
}
