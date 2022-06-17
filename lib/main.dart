import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_home.dart';
import 'package:proyecto_carnes/screen_menu.dart';
import 'package:proyecto_carnes/screen_options.dart';
import 'package:proyecto_carnes/screen_search.dart';
import 'package:proyecto_carnes/screen_options.dart';

void main(){
  runApp(carga());
}
class carga extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BusCort",
      home: screen_menu(),
      theme: ThemeData(
        primaryColor: Colors.white,
          textTheme: const TextTheme(

            headline1:TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF2FACF),
            ),
            headline6:TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFFF2FACF),
            ),
            headline2:TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6E1300),
            ),
            headline3:TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6E1300),
            ),
            headline4:TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6E1300),
            ),
            headline5:TextStyle(
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6E1300),
            ),

          )
      ),
    );
  }
}