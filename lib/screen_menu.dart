import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_options.dart';
import 'package:proyecto_carnes/screen_options_pork.dart';

class screen_menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Seleccione un animal", style: Theme.of(context).textTheme.headline3 ,),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Image.asset('assets/vaca.png'),
                  iconSize: 150,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => screen_options()),
                    );
                  },
                ),
                IconButton(
                  icon: Image.asset('assets/cerdo.png'),
                  iconSize: 150,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => screen_options_pork()),
                    );
                  },
                ),
              ],
            ),
            Text("BUSCORT", style: Theme.of(context).textTheme.headline2,),
          ],
        ),
      ),
    );
  }
}