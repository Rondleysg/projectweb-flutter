import 'dart:convert';

import 'package:webproject/model/Usuario.dart';
import 'package:http/http.dart' as http;
import 'global.dart' as global;

class UsuarioWs{
  var header = <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  };

  Future<Usuario?> autenticarUsuario({required String login, required String senha}) async{
  var url = Uri.parse(global.url+'/login');
  var body = jsonEncode({
    "usuTxLogin": "$login",
    "usuTxSenha": "$senha"
  });
  var response = await http.post(url, body: body, headers: header);
  if(response.statusCode==200){
    Usuario usuario = Usuario.fromJson(jsonDecode(response.body));
    return usuario;
  }else{
   return null;
   }
  }

  Future<bool> usuarioExiste({required String login}) async{
    final queryParameters = {
      'usuTxLogin': '$login'
    };
    final urlExiste = Uri.http(global.url.replaceAll('http://', ''), '/api/usuario/usuByLoginExist', queryParameters);
    final responseExiste = await http.get(urlExiste, headers: header);
    if (responseExiste.body.toLowerCase() == 'true') {
      return true;
    } else if (responseExiste.body.toLowerCase() == 'false') {
      return false;
    }
    return false;
  }





}