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

  Future<bool> salvarNome({required String novoNome, required String token}) async{
    var url = Uri.parse(global.url+'/api/usuario/salvarNome');
    var body = novoNome;
    final responseResult = await http.put(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }, body: body);
    if(responseResult.statusCode!=200){
      return false;
    }else{
      return true;
    }
  }

  Future<Usuario?> criarConta({required String nome, required String login, required String senha}) async{
    bool usuExiste = await usuarioExiste(login: login);
    if(usuExiste){
      return null;
    }
    var url = Uri.parse(global.url+'/api/usuario/criarUsuario');
    var body = jsonEncode({
      "usuTxNome": "$nome",
      "usuTxLogin": "$login",
      "usuTxSenha": "$senha"
    });

    var response = await http.post(url, body: body, headers: header);
    if(response.statusCode==200){
      Usuario? usuario = await autenticarUsuario(login: login, senha: senha);
      return usuario;
    }else{
      return null;
    }

  }

  Future<Usuario?> getUsuarioToken({required String token}) async{
    var url = Uri.parse(global.url+'/api/usuario/usuByToken');

    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode==200){
      Usuario usuario = Usuario.fromJson(jsonDecode(response.body));
      return usuario;
    }else{
      return null;
    }
  }

  Future<List<Usuario>?> getListaTodosUsuarios({required String token}) async{
    var url = Uri.parse(global.url+'/api/usuario/listarTodos');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if(response.statusCode==200){
      var jsonArray = response.body;
      List jsonUsuList = jsonDecode(jsonArray);
      List<Usuario> usuList=[];
      for(int i=0;i<jsonUsuList.length;i++){
        usuList.add(Usuario.fromJson(jsonUsuList[i]));
      }
      return usuList;
    }else{
      print('caindo aqui');
      return null;
    }
  }

  Future<Usuario?> getUsuarioId({required String token, required String id}) async{
    final queryParameters = {
      'usuNrId': '$id'
    };
    final url = Uri.http(global.url.replaceAll('http://', ''), '/api/usuario/usuById', queryParameters);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if(response.statusCode==200){
      Usuario usuario = Usuario.fromJson(jsonDecode(response.body));
      return usuario;
    }else{
      return null;
    }
  }

  Future<Usuario?> getUsuarioLogin({required String token, required String login}) async{
    final queryParameters = {
      'usuTxLogin': '$login'
    };
    final url = Uri.http(global.url.replaceAll('http://', ''), '/api/usuario/usuByLogin', queryParameters);
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if(response.statusCode==200){
      Usuario usuario = Usuario.fromJson(jsonDecode(response.body));
      return usuario;
    }else{
      return null;
    }
  }


}