import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_menu.dart';
import 'package:proyecto_carnes/screen_options.dart';

class screen_options_pork extends StatefulWidget{
  @override
  pageOptions createState()=>pageOptions();
}
class pageOptions extends State<screen_options_pork>{
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
                  icon: Image.asset('assets/cerdo.png'),
                  iconSize: 40.0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder:(context) => screen_menu()),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                  minWidth: 220.0,
                  height: 120.0,
                  onPressed: (){},
                  color: Color(0xFF6E1300),
                  child: Text('TRADUCIR', style: Theme.of(context).textTheme.headline6,),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(22.0)),
                  minWidth: 220.0,
                  height: 120.0,
                  onPressed: (){},
                  color: Color(0xFF6E1300),
                  child: Text('VER CORTES', style: Theme.of(context).textTheme.headline6,),
                )
              ],
            ),
          ],
        ),
      ),

    );
  }

}