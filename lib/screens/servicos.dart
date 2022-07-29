
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/screens/screens_service/lista_usuarios.dart';
import 'package:webproject/screens/screens_service/pesquisarId_usuarios.dart';
import 'package:webproject/screens/screens_service/pesquisarLogin_usuarios.dart';
import 'package:webproject/widgets/cardServiceButtom.dart';

class Servicos extends StatefulWidget {

  final Usuario usuario;
  Servicos(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red);
  }
  @override
  State<Servicos> createState() => _ServicosState();
}

class _ServicosState extends State<Servicos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [Padding(padding: EdgeInsetsDirectional.fromSTEB(15, 0, 24, 0),
            child: Column(
              children: [
                Divider(color: Colors.transparent,),
                Text('Pesquisar usuário: ', style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF4B39EF),
                    fontWeight: FontWeight.bold
                ),),
                cardServiceButtom(icon: MdiIcons.idCard, text: 'Pesquisar pelo id', onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>PesquisarIdUsuario(usuario: widget.usuario,)
                  ))
                },),
                cardServiceButtom(icon: MdiIcons.textAccount, text: 'Pesquisar pelo login', onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> PesquisarLoginUsuario(usuario: widget.usuario,)
                  ))
                },),
                cardServiceButtom(icon: MdiIcons.accountGroup, text: 'Listar todos usuários', onPressed: ()=>{
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>ListaUsuarios(usuario: widget.usuario,)
                  ))
                },),
            Divider(thickness: 2,color: Colors.black54,),
            Divider(color: Colors.transparent,),
            Text('Pesquisar Perfil: ', style: TextStyle(
                fontSize: 20,
                color: Color(0xFF4B39EF),
                fontWeight: FontWeight.bold
            ),),
                cardServiceButtom(icon: MdiIcons.idCard, text: 'Pesquisar pelo id'),
                cardServiceButtom(icon: MdiIcons.formatListGroup, text: 'Listar todos perfis'),
            Divider(thickness: 2,color: Colors.black54,),
            Divider(color: Colors.transparent,),
            Text('Pesquisar Servicos: ', style: TextStyle(
                fontSize: 20,
                color: Color(0xFF4B39EF),
                fontWeight: FontWeight.bold
            ),),
                cardServiceButtom(icon: MdiIcons.idCard, text: 'Pesquisar pelo id'),
                cardServiceButtom(icon: MdiIcons.textAccount, text: 'Listar todos serviços'),
            Divider(thickness: 2,color: Colors.black54,),
            Divider(color: Colors.transparent,),
            Text('Pesquisar Transações: ', style: TextStyle(
                fontSize: 20,
                color: Color(0xFF4B39EF),
                fontWeight: FontWeight.bold
            ),),
                cardServiceButtom(icon: MdiIcons.idCard, text: 'Pesquisar pelo id'),
                cardServiceButtom(icon: MdiIcons.textAccount, text: 'Listar todas transações'),
            Divider(thickness: 2,color: Colors.black54,),
          ],
        ),),

          ],)
      ),
    );
  }


}