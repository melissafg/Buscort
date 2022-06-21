
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_options.dart';
import 'package:proyecto_carnes/screen_options_pork.dart';
import 'package:proyecto_carnes/screen_result.dart';

class screen_search_pork extends StatefulWidget{
  @override
  screenSearchPork createState()=>screenSearchPork();
}
class screenSearchPork extends State<screen_search_pork>{
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
                      MaterialPageRoute(builder:(context) => screen_options_pork()),
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: const <Widget>[
                      MyStatefulWidget(),
                    ],
                  ),

                ],
              ),

            ],
          ),
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
  void _submit() {
    print("Nombre ${dropdownValue1}");
    print("Nombre $dropdownValue2");
    print("Corte ${corte}");
    for(var v in diccionario.keys){
      if (v==dropdownValue1){
        print("encontro ${v}");
        for(var l in diccionario[v]!.keys){
          if(l == corte){
            print(l);
            palabra= l;
            Corte1=diccionario[v]![l]!;
            print(Corte1);
          }
        }
      }

    }
    for(var v in diccionario.keys){
      if (v==dropdownValue2){
        print("encontro ${v}");
        diccionario[v]!.forEach((k, s) {
          if(s == Corte1){
            traduccion = k;
            print(traduccion);
          }

        });
      }
    }
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder:(context) => screen_result(res: traduccion,)),
      );
    };

  }
  int Corte1= 0;
  String palabra="";
  String traduccion="";
  String dropdownValue1 = 'Argentina';
  String dropdownValue2 = 'Argentina';
  String corte = "Lomo";
  static const diccionario = {
    'Bolivia':{
      'Cabeza'	:1,
      'Bondiola'	:2,
      'Aguja'	:3,
      'Paletilla'	:4,
      'Papada'	:5,
      'Chuleta'	:6,
      'Lomo'	:7,
      'Costilla'	:8,
      'Panceta'	:9,
      'Jamon'	:10,
      'Jamon pierna'	:11,
      'Codillo'	:12,
      'Patitas'	:13,
    },
    'España':{
      'Carriladas y Caprichos'	:1,
      'Plumas'	:2,
      'Aguja'	:3,
      'Paletilla'	:4,
      'Papada'	:5,
      'Chuleta de lomo'	:6,
      'Cinta de lomo'	:7,
      'Costillar'	:8,
      'Panceta'	:9,
      'Solomillo'	:10,
      'Jamon'	:11,
      'Codillo'	:12,
      'Jarrete'	:13,
    },
    'Mexico':{
      'Cabeza'	:1,
      'Cabeza de lomo'	:2,
      'Bondiola'	:3,
      'Pierna delantera'	:4,
      'papada'	:5,
      'Chuleta'	:6,
      'Caña de lomo'	:7,
      'Costillas'	:8,
      'Tocino'	:9,
      'Aguayon'	:10,
      'Jamon'	:11,
      'Codillo'	:12,
      'Manitas'	:13,
    },
    'Peru':{
      'Cabeza'	:1,
      'Lomo'	:2,
      'Chuleta'	:3,
      'Paletilla'	:4,
      'Papada'	:5,
      'Chuleta baja'	:6,
      'Cinta'	:7,
      'Costilla'	:8,
      'Panceta'	:9,
      'Jamon'	:10,
      'Pierna'	:11,
      'Pernil'	:12,
      'Manitos'	:13,

    },
    'Argentina':{
      'Cabeza'	:1,
      'Bondiola'	:2,
      'Carré con hueso'	:3,
      'Paleta'	:4,
      'Churrasquito'	:5,
      'Tocino'	:6,
      'carré con hueso'	:7,
      'Pechito con manta'	:8,
      'Matambrito'	:9,
      'Cuadril y nalga'	:10,
      'Bola de lomo/jamon'	:11,
      'Codillo'	:12,
      'Manitos'	:13,
    },
    'Uruguay':{
      'Cabeza'	:1,
      'Costilla'	:2,
      'bondiola'	:3,
      'Pulpa'	:4,
      'papadita'	:5,
      'Pernil'	:6,
      'lomo'	:7,
      'Pecho'	:8,
      'panceta'	:9,
      'jamon'	:10,
      'Jamon'	:11,
      'Codo'	:12,
      'mano'	:13,
    },
    'Ecuador':{
      'Cabeza'	:1,
      'Chuleta'	:2,
      'Bondiola'	:3,
      'Pulpa'	:4,
      'Papada'	:5,
      'Pernil'	:6,
      'Costilla'	:7,
      'costilla'	:8,
      'Tocino'	:9,
      'Jamon'	:10,
      'Pierna'	:11,
      'Codillo'	:12,
      'Manitas'	:13,
    },
    'Colombia':{
      'cabeza'	:1,
      'Bondiola'	:2,
      'bondiola'	:3,
      'Pulpa pierna'	:4,
      'Cuello'	:5,
      'Pulpa lomo'	:6,
      'Lomo'	:7,
      'Costilla'	:8,
      'Tocino'	:9,
      'Pierna'	:10,
      'Jamon'	:11,
      'Codillo'	:12,
      'Mano'	:13,
    },
    'Chile':{
      'Cabeza'	:1,
      'Chuleta vetada'	:2,
      'Chuleta vetada baja'	:3,
      'Pulpa paleta'	:4,
      'Papada'	:5,
      'Chuleta centro'	:6,
      'Lomo de costilla'	:7,
      'Costilla'	:8,
      'Tocino'	:9,
      'Pulpa pierna'	:10,
      'Pierna'	:11,
      'Pernil pierna'	:12,
      'Mano/pata'	:13,

    }
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Seleccione país de origen:', style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Color(0xFF6E1300)),
                  borderRadius: BorderRadius.circular(15),

                ),
              ),
              value: dropdownValue1,
              icon: const Icon(Icons.arrow_downward_outlined),
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue!;
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
            Text('Seleccione país de traducción:',style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 3, color: Color(0xFF6E1300)),
                  borderRadius: BorderRadius.circular(15),

                ),
              ),
              value: dropdownValue2,
              icon: const Icon(Icons.arrow_downward_outlined),
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue2 = newValue!;
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
                onFieldSubmitted: (value) {
                  setState(() {
                    corte = value;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: _submit,
                child: const Text('Traducir'),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF6E1300),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),

              ),
            ),
          ],

        ),
      ),
    );
  }
}
