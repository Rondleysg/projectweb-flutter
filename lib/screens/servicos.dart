
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/screens/screens_service/lista_usuarios.dart';

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
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
            child: Row(children: [
              Icon(MdiIcons.idCard, size: 30,),
              VerticalDivider(color: Colors.transparent,),
              TextButton(onPressed: ()=>{},child: Text('Pesquisar pelo id', style: TextStyle(
                fontSize: 17,
                color: Colors.black54
              ),),)
            ],),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(children: [
                Icon(MdiIcons.textAccount, size: 30,),
                VerticalDivider(color: Colors.transparent,),
                TextButton(onPressed: ()=>{},child: Text('Pesquisar pelo login', style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                ),),)
              ],),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(children: [
                Icon(MdiIcons.accountGroup, size: 30,),
                VerticalDivider(color: Colors.transparent,),
                TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>ListaUsuarios(usuario: widget.usuario,)))},child: Text('Listar todos usuários', style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                ),),)
              ],),),
            Divider(thickness: 2,color: Colors.black54,),
            Divider(color: Colors.transparent,),
            Text('Pesquisar Perfil: ', style: TextStyle(
                fontSize: 20,
                color: Color(0xFF4B39EF),
                fontWeight: FontWeight.bold
            ),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
              child: Row(children: [
                Icon(MdiIcons.idCard, size: 30,),
                VerticalDivider(color: Colors.transparent,),
                TextButton(onPressed: ()=>{},child: Text('Pesquisar pelo id', style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                ),),)
              ],),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(children: [
                Icon(MdiIcons.formatListGroup, size: 30,),
                VerticalDivider(color: Colors.transparent,),
                TextButton(onPressed: ()=>{},child: Text('Listar todos perfis', style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                ),),)
              ],),),
            Divider(thickness: 2,color: Colors.black54,),
            Divider(color: Colors.transparent,),
            Text('Pesquisar Servicos: ', style: TextStyle(
                fontSize: 20,
                color: Color(0xFF4B39EF),
                fontWeight: FontWeight.bold
            ),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
              child: Row(children: [
                Icon(MdiIcons.idCard, size: 30,),
                VerticalDivider(color: Colors.transparent,),
                TextButton(onPressed: ()=>{},child: Text('Pesquisar pelo id', style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                ),),)
              ],),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(children: [
                Icon(MdiIcons.textAccount, size: 30,),
                VerticalDivider(color: Colors.transparent,),
                TextButton(onPressed: ()=>{},child: Text('Listar todos serviços', style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                ),),)
              ],),),
            Divider(thickness: 2,color: Colors.black54,),
            Divider(color: Colors.transparent,),
            Text('Pesquisar Transações: ', style: TextStyle(
                fontSize: 20,
                color: Color(0xFF4B39EF),
                fontWeight: FontWeight.bold
            ),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
              child: Row(children: [
                Icon(MdiIcons.idCard, size: 30,),
                VerticalDivider(color: Colors.transparent,),
                TextButton(onPressed: ()=>{},child: Text('Pesquisar pelo id', style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                ),),)
              ],),),
            Padding(padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(children: [
                Icon(MdiIcons.textAccount, size: 30,),
                VerticalDivider(color: Colors.transparent,),
                TextButton(onPressed: ()=>{},child: Text('Listar todas transações', style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                ),),)
              ],),),
            Divider(thickness: 2,color: Colors.black54,),
          ],
        ),),

          ],)
      ),
    );
  }


}