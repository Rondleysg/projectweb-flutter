
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:webproject/screens/inicio_home.dart';
import 'package:webproject/screens/screens_service/lista_usuarios.dart';

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
    final ButtonStyle style = TextButton.styleFrom(primary: Theme.of(context).colorScheme.onPrimary);
    return _introScreen();
  }
}

Widget _introScreen() {
  return Stack(
    children: <Widget>[
      SplashScreen(
        seconds: 5,
        gradientBackground: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white24,
            Colors.white
          ],
        ),
        navigateAfterSeconds: InicioHome(),
        loaderColor: Colors.transparent,
      ),
      Center(
        child: Image(
          image: AssetImage('assets/images/rondley.png'),color: Colors.black54,
        ),
      ),
    ],
  );
}
