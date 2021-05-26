import 'package:flutter/material.dart';
import 'package:loginfer/src/bloc/provider.dart';
import 'package:loginfer/src/pages/estudiantePage.dart';
import 'package:loginfer/src/pages/homePage.dart';
import 'package:loginfer/src/pages/horarioPage.dart';
import 'package:loginfer/src/pages/loginPage.dart';
import 'package:loginfer/src/pages/profesorPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'estudiantePage': (BuildContext context) => new EstudiantePage(),
          'profesorPage': (BuildContext context) => new ProfesorPage(),
          'horarioPage': (BuildContext context) => new HorarioPage(),
        },
        theme: ThemeData(primaryColor: Colors.brown[800]),
      ),
    );
  }
}
