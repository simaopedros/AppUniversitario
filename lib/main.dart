import 'package:appuniversitario/src/pages/estudo_page.dart';
import 'package:appuniversitario/src/pages/grade_page.dart';
import 'package:appuniversitario/src/pages/home_page.dart';
import 'package:appuniversitario/src/pages/materia_page.dart';
import 'package:appuniversitario/src/pages/provas_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentsTasks',
      initialRoute: 'home',
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        'provas'  : (BuildContext context) => ProvaPage(),
        'grade'   : (BuildContext context) => GradePage(),
        'materia' : (BuildContext context) => MateriaPage(),
        'estudo'  : (BuildContext context) => EstudoPage(),
      },
    );
  }
}