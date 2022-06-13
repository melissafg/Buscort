import 'package:flutter/material.dart';

class screen_home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Color(0xFF6E1300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/carne.png',  width: 100),
            Text("BUSCORT", style: Theme.of(context).textTheme.headline1,),
          ],
        ),
      ),
    );
  }
}