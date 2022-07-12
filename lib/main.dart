import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:webproject/login.dart';
import 'package:webproject/widgets/buttonElevated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Project',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Inicio',),
      //MyHomePage(title: 'Inicio',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called
    final ButtonStyle style =
    TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                        Column(children: [
                          Text('Bem-vindo', style: TextStyle(
                              fontSize: 45,
                              fontFamily: 'burbank-big',
                              color: Colors.black54
                          )),
                          Divider(),
                          Text('Aplicativo criado para matéria de Programação WEB I, autenticação e autorização consumindo api externa',
                          style: TextStyle(color: Colors.black54,fontSize: 20, fontFamily: 'burbank-big-light', fontWeight: FontWeight.w900),
                          textAlign: TextAlign.center,)
                        ],),
                        Divider(),
                        Image(image: AssetImage('assets/images/rondley.png'),color: Colors.black54),
                        Divider(),
                        Column(children: [
                          buttonElevated(callback: ()=>mostrarLogin(), text: "Login", style: new ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200, 60)),),),
                          Divider(),
                          buttonElevated(callback: ()=>{}, text: "Cadastrar", style: new ButtonStyle(minimumSize: MaterialStateProperty.all(Size(200, 60))),),
                        ],),
                        Divider(),
                        Divider(),
                        Column(children: [
                          Text("Outras formas de login", style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'burbank-big',
                            color: Colors.black54,
                          ), ),
                          Divider(),
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
                        ],),
                      ],
                    ),
                  ),
            )
        ],
      )
    );
  }
  mostrarLogin(){
    Future.delayed(Duration.zero, () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
    });
  }
}
