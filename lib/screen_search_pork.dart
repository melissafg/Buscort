
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_options.dart';
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
      'Peceto':1,
      'Punta de S':2,
      'Cuadril': 3,
      'Bife Angosto':4,
      'Bife Ancho':5,
      'Aguja':6,
      'Giba':7,
      'Cogote':8,
      'Chingolo':9,
      'Marucha':10,
      'Pecho':11,
      'Paleta':12,
      'Garron Entero':13,
      'Tira':14,
      'Keperí':15,
      'Costilla':16,
      'Pollerita':17,
      'Lomo':18,
      'Chuleta':19,
      'Cuadrada':20,
      'Bollo Grande':21,
      'Bollo Chico':22,
      'Cola':23,
      'Garron trasero':24,
      'Matambre':25,
      'Tortuguita':26
    },
    'España':{
      'Redondo': 1,
      'Tapilla': 2,
      'Falda':3,
      'lomo bajo':4,
      'lomo alto':5,
      'Lomo Aguja':6,
      'aguja':7,
      'Pescuezo':8,
      'pez':9,
      'Espaldilla':10,
      'Aleta':11,
      'Pez':12,
      'morcillo anterior':13,
      'Aguja':14,
      'Aguja ':15,
      'Costillar':16,
      'Falda ':17,
      'Solomillo':18,
      'Lomo alto':19,
      'Cadera':20,
      'Tapa':21,
      'Contra':22,
      'Rabo':23,
      'Morcillo posterior':24,
      'Falda Barriga':25,
      'Culata de Contra':26

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
