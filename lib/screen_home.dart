import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_menu.dart';

class screen_home extends StatefulWidget{
  @override
  State<screen_home> createState() => _screen_homeState();
}

class _screen_homeState extends State<screen_home> {
  @override
  void initState(){
    super.initState();
    navigateToMenu();
  }
  navigateToMenu()async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder:(context) => screen_menu()),
    );
}
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