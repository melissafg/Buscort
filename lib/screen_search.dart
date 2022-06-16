
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
      body:  Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text('Seleccione país de origen:'),
                    DropdownStateful(),
                    Text('Seleccione país de traducción:'),
                    MyStatefulWidget(),
                  ],
                ),

              ],
            ),
            MyInputWidget(),

          ],
        ),
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
    return Container(
      height: 100,
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Color(0xFF6E1300)),
              borderRadius: BorderRadius.circular(15),

            ),
          ),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward_outlined),
          elevation: 16,
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
        ),
      ),
    );

  }
}



class DropdownStateful extends StatefulWidget {
  const DropdownStateful({Key? key}) : super(key: key);

  @override
  State<DropdownStateful> createState() => _MyDropdownStatefulState();
}

class _MyDropdownStatefulState extends State<DropdownStateful> {
  String dropdownValue = 'Argentina';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Color(0xFF6E1300)),
              borderRadius: BorderRadius.circular(15),

            ),
          ),
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward_outlined),
          elevation: 16,
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
        ),
      ),
    );

  }
}



class MyInputWidget extends StatefulWidget {
  const MyInputWidget({Key? key}) : super(key: key);

  @override
  State<MyInputWidget> createState() => _MyInputWidgetState();
}

class _MyInputWidgetState extends State<MyInputWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 200,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Escriba el corte de carne',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor llene este campo';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child: const Text('Traducir'),
            ),
          ),
        ],
      ),
    );
  }
}