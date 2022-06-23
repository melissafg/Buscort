
import 'dart:io';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:flutter_tesseract_ocr/android_ios.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_carnes/screen_menu.dart';
import 'package:proyecto_carnes/screen_options.dart';
import 'package:proyecto_carnes/screen_search.dart';


class screen_cam extends StatefulWidget{
  @override
  screenCam createState()=>screenCam();
}
class screenCam extends State<screen_cam>{

  bool Scanning = false;
  String extract="";
  File? _pickedImage;
  final picker =ImagePicker();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      MaterialPageRoute(builder:(context) => screen_search()),
                    );
                  },
                ),
                Text("BUSCORT", style: Theme.of(context).textTheme.headline5,),
              ],
            ),

          ],
        ),
      ),
      body: ListView(
        children: [
          _pickedImage==null?
              Container(
                height: 300,
                color: Colors.grey,
                child: const Icon(
                  Icons.image,
                  size: 100,
                ),
              ):Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: FileImage(_pickedImage!),
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
             child:
               ElevatedButton(
                 onPressed:  (){
                   opciones(context);
                 },
                 child: const Text(
                     'Seleccionar Imagen',
                     style: TextStyle(
                         fontSize: 15,
                         color: Colors.white,
                         fontWeight: FontWeight.bold)),
               ),

           ),
          const SizedBox(height: 20),
          Scanning
              ? Center(child: CircularProgressIndicator())
              : Icon(
            Icons.done,
            size: 40,
            color: Colors.green,
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              extract,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
  opciones(BuildContext context){
    showPlatformDialog(
        context: context,
        builder: (_) => AlertDialog(
      contentPadding: EdgeInsets.all(0),
      content: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                selImage(1);
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Colors.black26))
                ),
                child: Row(
                  children: [
                    Expanded(child: Text("Tomar Foto", style: TextStyle(fontSize: 16),)),
                    Icon(Icons.camera_alt, color: Colors.red)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                selImage(2);
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Colors.black26))
                ),
                child: Row(
                  children: [
                    Expanded(child: Text("Abrir galeria", style: TextStyle(fontSize: 16),)),
                    Icon(Icons.browse_gallery, color: Colors.red)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1, color: Colors.black26))
                ),
                child: Row(
                  children: [
                    Expanded(child: Text("Cancelar", style: TextStyle(fontSize: 16),)),
                    Icon(Icons.back_hand, color: Colors.red)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    )
    );
  }

  Future selImage(op) async{
    var getFile;
    setState((){
        Scanning = true;
      });

    if(op ==1){
      getFile = await picker.pickImage(source: ImageSource.camera);
    }else{
      getFile = await picker.pickImage(source: ImageSource.gallery);
      _pickedImage = File(getFile.path);
      extract = await FlutterTesseractOcr.extractText(_pickedImage!.path);
    }
    setState((){
      if(getFile!= null){
        Scanning = false;
      }else{
         print("no se selecciono ninguna imagen");
      }
    });

  }

}