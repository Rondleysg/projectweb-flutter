
import 'dart:convert';


import 'package:http/http.dart' as http;
import 'ws/global.dart' as global;
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
  void initState(){
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black45);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Inicio',
      style: optionStyle,
    ),
    Text(
      'Serviços',
      style: optionStyle,
    ),
    Text(
      'Suporte',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: _widgetOptions.elementAt(_selectedIndex),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            iconSize: 37,
            onPressed: () {
              },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(),
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
                            fontSize: 37,
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
                              fontSize: 37,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Text(
                      'Olá! Seja bem vindo a página inicial do aplicativo.',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        color: Color(0xFF57636C),
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              )

            ],
          )
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black54,
        selectedItemColor: Color(0xFF4B39EF),
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
}