import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';
import 'package:webproject/ws/UsuarioWs.dart';

class ListaUsuarios extends StatefulWidget {
  final Usuario usuario;
  const ListaUsuarios({Key? key, required this.usuario}) : super(key: key);

  @override
  _ListaUsuariosScreenState createState() => _ListaUsuariosScreenState();

}

class _ListaUsuariosScreenState extends State<ListaUsuarios> {
  List<Usuario>? usuList;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getListUsuarios(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: usuList!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image(
                                      height: 100,
                                      width: 100,
                                      image: NetworkImage(
                                          'https://igd-wp-uploads-pluginaws.s3.amazonaws.com/wp-content/uploads/2016/05/30105213/Qual-e%CC%81-o-Perfil-do-Empreendedor.jpg'),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            usuList![index].usuTxNome!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("Data criação:: " +
                                                usuList![index].usuDtCadastro!,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () { },
                                              child: Container(
                                                height: 35,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.circular(5)),
                                                child: const Center(
                                                  child: Text(
                                                    'Ver mais',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          );
        }
    );

  }

  Future<List<Usuario>?> _getListUsuarios() async{
    usuList = await UsuarioWs().getListaTodosUsuarios(token: widget.usuario.usuTxToken!);
    return usuList;
  }

}