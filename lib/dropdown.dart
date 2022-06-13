import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdown extends StatefulWidget{
  @override
  dropdownState createState() => dropdownState();
}
class dropdownState extends State<Dropdown>{
  final lista = ['España', 'Peru','Bolivia','Argentina','Ecuador', 'Chile', 'Colombia'];
  String? texto;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar (title: Text('Dropdown Menu'), centerTitle: true),
      body: Center(
        child: DropdownButton<String>(
            items: lista.map(crearLista).toList(),
          onChanged: (value)=> setState(() =>this.texto= value),
        ),
      ),
  );

  DropdownMenuItem<String> crearLista(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
  );
}