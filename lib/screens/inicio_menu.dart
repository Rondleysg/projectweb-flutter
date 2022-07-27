import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:url_launcher/url_launcher.dart';

class Inicio extends StatefulWidget {

  final Usuario usuario;
  Inicio(this.usuario);

  @override
  State<Inicio> createState() => _InicioState();

  refreshNome() {
    usuario.usuTxNome;
  }

}

class _InicioState extends State<Inicio> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.transparent,),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 16, 16, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Olá, ',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Color(0xFF101213),
                              fontSize: 35,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                            child: Text(
                              widget.usuario.usuTxNome ?? '',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                color: Color(0xFF4B39EF),
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 5, 24, 0),
                      child: Text(
                        'Seja bem vindo a página inicial do aplicativo.',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFF57636C),
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),),
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Text('Últimos serviços utilizados:  ',
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Color(0xFF101213),
                          fontSize: 17,
                        ),),
                      Icon(Icons.cached, size: 25,),
                    ],)
                    ),
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(24, 10, 24, 0),
                    child: Center(
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.error_outline, size: 17),
                                ),
                                TextSpan(
                                  text: "Você não utilizou nenhum serviço. ",
                                  style: TextStyle(color: Colors.black, fontSize: 14,
                                  fontWeight: FontWeight.w500)
                                ),
                              ],
                            ),
                          ),
                          Text('Vá até a aba serviços e veja o que tem disponível!'),
                          TextButton(onPressed: () => {}, child: Text('Ver todos',
                          style: TextStyle(color: Color(0xFF4B39EF),
                          fontSize: 17),
                          )
                          ),
                        ],
                      ),
                    ),
                    ),
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Divider(
                        color: Colors.black,
                        thickness: 3,
                      ),),
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(24, 60, 24, 0),
                    child: Column(
                        children: [
                          Text('Mais projetos em: ', style: TextStyle(
                              color: Color(0xFF101213),fontSize: 20),),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsetsDirectional.fromSTEB(10, 10, 24, 0),
                    child: SizedBox(
                      height: 210,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(12),
                          itemBuilder: (context, index){
                          return buildCard(index);
                          },
                          separatorBuilder: (context, index){
                          return const SizedBox(width: 20,);
                          },
                          itemCount: 3
                      ),
                    )
                    )
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

  Widget buildCard(int index) {
    IconData iconData=MdiIcons.nullIcon;
    var nomeOpcao='';
    Uri linkBrowser = Uri.parse('https://flutter.dev');
    switch(index){
      case 0:
        iconData = MdiIcons.github;
        nomeOpcao = 'GitHub';
        linkBrowser = Uri.parse('https://github.com/Rondleysg');
        break;
      case 1:
        iconData = MdiIcons.linkedin;
        nomeOpcao = 'Linkedin';
        linkBrowser = Uri.parse('https://www.linkedin.com/in/rondleysg');
        break;
      case 2:
        iconData = MdiIcons.discord;
        nomeOpcao = 'Discord';
        linkBrowser = Uri.parse('https://github.com/Rondleysg');
        break;
    }
    return Container(
      width: 126,
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsetsDirectional.fromSTEB(0, 0, 75, 0),
          child: IconButton(
            onPressed: () async {
                if (!await launchUrl(linkBrowser)) {
                  throw 'Não foi possível abrir $linkBrowser';
                }
            },
            icon: Icon(iconData, color: Colors.white, size: 110,),
          ),),
          const SizedBox(height: 95,),
          Text(nomeOpcao, style: TextStyle(fontSize: 30,
              fontFamily: 'burbank-big-medium',
              fontWeight: FontWeight.w700,
              color: Colors.black54),)
        ],
      ),
    );
  }

  @override
  void setState(VoidCallback fn) {

  }
}