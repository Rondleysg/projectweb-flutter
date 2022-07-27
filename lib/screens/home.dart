import 'dart:async';

import 'package:webproject/screens/login.dart';
import 'package:webproject/screens/inicio_menu.dart';
import 'package:webproject/screens/perfil.dart';
import 'package:webproject/screens/servicos.dart';
import 'package:webproject/screens/suporte.dart';
import 'package:flutter/material.dart';
import 'package:webproject/model/Usuario.dart';

class Home extends StatefulWidget {

  Home(this.usuario);
  final Usuario usuario;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  void initState() {
    super.initState();
  }

  int _selectedIndex = 0;

  Widget _selectTitle(){
    if(_selectedIndex == 0){
      return const Text(
        'Inicio',
        style: optionStyle,
      );
    }else{
      if(_selectedIndex == 1){
        return const Text(
          'Serviços',
          style: optionStyle,
        );
      }else{
        return const Text(
          'Suporte',
          style: optionStyle,
        );
      }
    }
  }


  static const TextStyle optionStyle =
  TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black45);

  final List<Widget> _telasOptions = <Widget>[
    Inicio(usuario!),
    Servicos(usuario!),
    Suporte(usuario!),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _selectTitle;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: _selectTitle(),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            iconSize: 37,
            onPressed: ()=>mostrarPerfil(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ],
      ),
      body: _telasOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: const Color(0xFF4B39EF),
        type: BottomNavigationBarType.shifting,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.miscellaneous_services),
            label: 'Serviços',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_support_rounded),
            label: 'Suporte',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  mostrarPerfil(){
    Future.delayed(Duration.zero, () {
      Navigator.push(context, MaterialPageRoute(builder: (_) => Perfil(usuario: usuario!)));
    });
  }
}