
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_cam.dart';
import 'package:proyecto_carnes/screen_options.dart';
import 'package:proyecto_carnes/screen_result.dart';

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

  void Cam(){
    Navigator.push(
      context,
      MaterialPageRoute(builder:(context) => screen_cam()),
    );
  }

  void getCorte(String pais) async{
    CollectionReference collectionReference = FirebaseFirestore.instance.collection(pais);
    QuerySnapshot corte = await collectionReference.get();
    if(corte.docs.length != 0){
      for(var doc in corte.docs){
        print(doc.data());
      }
    }
  }
  void _submit() {
    print("Nombre ${dropdownValue1}");
    print("Nombre $dropdownValue2");
    print("Corte ${corte}");
    getCorte(dropdownValue1);
    print(traduccion);
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
    }

  }
  int Corte1= 0;
  String palabra="";
  String traduccion="no se encontro";
  String dropdownValue1 = 'Argentina';
  String dropdownValue2 = 'Argentina';
  String corte = "No se encontro";
  static const diccionario = {
    'Bolivia':{
      'Peceto':1,
      'Punta de s':2,
      'Cuadril': 3,
      'Bife angosto':4,
      'Bife ancho':5,
      'Aguja':6,
      'Giba':7,
      'Cogote':8,
      'Chingolo':9,
      'Marucha':10,
      'Pecho':11,
      'Paleta':12,
      'Garron entero':13,
      'Tira':14,
      'Keperí':15,
      'Costilla':16,
      'Pollerita':17,
      'Lomo':18,
      'Chuleta':19,
      'Cuadrada':20,
      'Bollo grande':21,
      'Bollo chico':22,
      'Cola':23,
      'Garron trasero':24,
      'Matambre':25,
      'Tortuguita':26
    },
    'Argentina':{
      'Peceto'	:1,
      'Tapa de cuadril'	:2,
      'Cuadril'	:3,
      'Bife angosto'	:4,
      'Bife ancho'	:5,
      'Aguja'	:6,
      'Joroba'	:7,
      'Cogote'	:8,
      'chingolo'	:9,
      'Marucha'	:10,
      'Pecho'	:11,
      'Lomillo'	:12,
      'Brazuelo'	:13,
      'Asado'	:14,
      'asado'	:15,
      'Tira de asado'	:16,
      'Falda'	:17,
      'Lomo'	:18,
      'bife ancho'	:19,
      'cuadril'	:20,
      'Bola de lomo'	:21,
      'Roat beef'	:22,
      'Colita'	:23,
      'Garrón trasero'	:24,
      'Vacío'	:25,
      'Tortuguita'	:26,
    },
    'Peru':{
      'Pejerey'	:1,
     ' Picaña'	:2,
      'Cuadril'	:3,
      'Churrasco' 	:4,
      'Churrasco largo'	:5,
      'Asado de aguja'	:6,
      'Guiso'	:7,
      'Pescuezo'	:8,
      'Bistec de paleta'	:9,
      'Asado ruso'	:10,
      'Malaya'	:11,
      'Asado de brazuelo'	:12,
      'Sancocho de osobuco'	:13,
      'asado de aguja'	:14,
      'Asado de aguja bajo'	:15,
      'Costilla'	:16,
      'Vacio'	:17,
      'Lomo'	:18,
      'lomo'	:19,
      'Asado de pierna'	:20,
      'Bistek de tapa'	:21,
      'Asado de Pierna'	:22,
      'cola' :23,
      'Choclo'	:24,
      'matambre'	:25,
      'Bisteck de pierna'	:26,
    },
    'Ecuador':{
      'Salon'	:1,
      'Punta de Cadera'	:2,
      'Corazon de cuadril'	:3,
      'Bife angosto'	:4,
      'Lomo de Falda'	:5,
      'Lomo de aguja'	:6,
      'Cogote con Azotillo'	:7,
      'Nuca'	:8,
      'lomo de aguja'	:9,
      'Marucha'	:10,
      'Pecho fresco'	:11,
      'Codillo'	:12,
      'Morcillo'	:13,
      'Entraña'	:14,
      'Asado'	:15,
      'Costilla'	:16,
      'Falda'	:17,
      'falda'	:18,
      'Chata'	:19,
      'punta de cadera'	:20,
      'Tapa de cuadrada'	:21,
      'asado'	:22,
      'Lomo'	:23,
      'Garron trasero'	:24,
      'Falda '	:25,
      'Tortuga'	:26,
    },
    'Uruguay':{
      'Nalga'	:1,
      'Tapa de cuadril'	:2,
      'Cuadril'	:3,
      'Bife angosto'	:4,
      'Espinazo'	:5,
      'Aguja'	:6,
      'Cogote'	:7,
      'cogote'	:8,
      'Chingolo'	:9,
      'Marucha'	:10,
      'Pecho'	:11,
      'Paleta redonda'	:12,
      'Brazuelo'	:13,
      'Entraña fina'	:14,
      'Asado'	:15,
      'asado'	:16,
      'Falda'	:17,
      'Lomito'	:18,
      'Trencito'	:19,
      'tapa de cuadril'	:20,
      'Cuadrada'	:21,
      'rueda'	:22,
      'Bola de lomo'	:23,
      'Ossosuco'	:24,
      'Matambre'	:25,
      'Tortuguita'	:26,
    },
    'Colombia':{
      'Muchacho'	:1,
      'Punta de anca'	:2,
      'cuadril'	:3,
      'Solomo'	:4,
      'lomo angosto'	:5,
      'Lomo de aguja'	:6,
      'cogote'	:7,
      'Cogote'	:8,
      'lomo de brazo'	:9,
      'Paletero'	:10,
      'Paletero interno'	:11,
      'Bola de brazo'	:12,
      'Lagarto'	:13,
      'Asado de tira' 	:14,
      'asado de tira' 	:15,
      'Costilla'	:16,
      'Sobre barriga'	:17,
      'Chata'	:18,
      'chata'	:19,
      'punta de Anca'	:20,
      'Bola de pierna'	:21,
      'Centro de pierna'	:22,
      'Cola'	:23,
      'Tableado'	:24,
      'sobre barriga'	:25,
      'muchacho'	:26,
    },
    'Mexico':{
      'Cuete'	:1,
      'Filete'	:2,
      'Palanca'	:3,
      'New York'	:4,
      'Chuletón'	:5,
      'Rollo de diezmillo'	:6,
      'Joroba'   :7,
      'Pescuezo'	:8,
      'Jiel'	:9,
      'Diezmillo'	:10,
      'Pecho'	:11,
      'Planchuela' 	:12,
      'Chambarete delantero'	:13,
      'Costilla'	:14,
      'Aguja norteña'	:15,
      'Arrachera'	:16,
      'Suadero'	:17,
      'Falda interna'	:18,
      'Falda externa'	:19,
      'Aguayon'	:20,
      'Pulpa bola'	:21,
      'Pulpa blanca'	:22,
      'Cola'	:23,
      'Chambarete trasero'	:24,
      'Concha de falda'	:25,
      'Nalga de afuera'	:26,
    },
    'Chile':{
      'Pollo ganso'	:1,
      'Punta de anso'	:2,
      'Palanca'	:3,
      'lomo liso'	:4,
      'lomo vetado'	:5,
      'Huacha-lomo'	:6,
      'Huachalomo'	:7,
      'Cogote'	:8,
      'Choclillo'	:9,
      'choclillo'	:10,
      'Plateada'	:11,
      'posta paleta'	:12,
      'Osobuco'	:13,
      'Asado de tira'	:14,
      'Malaya'	:15,
      'Malaya '	:16,
      'Falda'	:17,
      'Filete'	:18,
      'Lomo vetado'	:19,
      'punta de ganso'	:20,
      'Posta rosada'	:21,
      'abastero'	:22,
      'Cola'	:23,
     'osobuco'	:24,
     'Coluda'	:25,
      'Abastero'	:26,
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
            Padding(
              padding: EdgeInsets.all(12),
              child: ElevatedButton(
                onPressed: Cam,
                child: const Text('Usar Cámara'),
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF6E1300),
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),

              ),
            ),
          ],

        ),
      ),
    );
  }
}
