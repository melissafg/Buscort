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
        title: Text("TRADUCIR", style: Theme.of(context).textTheme.headline4,),
      ),
        body:  Center(
          child:  MyStatefulWidget(),
        ),
    );
  }

}
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'Argentina';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['Argentina', 'Bolivia', 'Chile', 'Colombia','Ecuador','España','México','Peru','Uruguay']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
