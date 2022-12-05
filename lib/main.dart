import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyectofinal/pages/agregar_receta.dart';
import 'package:proyectofinal/pages/categoria_page.dart';
import 'package:proyectofinal/pages/home_page.dart';
import 'package:proyectofinal/pages/login.dart';
import 'package:proyectofinal/pages/receta_completa.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes:<String, WidgetBuilder> {
        'login' : (BuildContext) => Login(),
        '/': (BuildContext) => HomePage(),
        'categoria': (BuildContext) => CategoriaPage(),
        'completa': (BuildContext) => CompletaPage(),
        'crear': (BuildContext) => AgregarReceta(),

        //'editar': (BuildContext) =>
      },
    );
  }
}



