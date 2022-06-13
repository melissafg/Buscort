import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_menu.dart';
import 'package:proyecto_carnes/screen_options.dart';

class screen_search extends StatefulWidget{
  @override
  screenSearch createState()=>screenSearch();
}
class screenSearch extends State<screen_search>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar (
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        elevation: 0.0,
        bottomOpacity: 0.0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/vaca.png'),
                  iconSize: 40.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => screen_options()),
                    );
                  },
                ),
                Text("BUSCORT", style: Theme.of(context).textTheme.headline5,),
              ],
            ),

          ],
        ),
      ),
        body:  Container(
          width: double.infinity,
          color: Colors.white,
          
        ),
    );
  }

}
class dropdownState extends State<screen_search>{
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