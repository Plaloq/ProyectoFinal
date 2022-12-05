import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/models/receta_model.dart';

class AgregarReceta extends StatefulWidget{
  const AgregarReceta({Key? key}) : super(key: key);

  @override
  State<AgregarReceta> createState() => _AgregarReceta();
}

class _AgregarReceta extends State<AgregarReceta>{
  final nombreController = TextEditingController();
  final descripcionController = TextEditingController();
  final duracionController = TextEditingController();
  final ingredientesController = TextEditingController();
  final preparacionController = TextEditingController();
  final dificultadController = TextEditingController();
  final imagenController = TextEditingController();
  final categoriaController = TextEditingController();


  @override
  Widget build(BuildContext context){
    Future crearReceta(Receta receta) async {
      final docReceta = FirebaseFirestore.instance.collection('recetas').doc();

      receta.id = docReceta.id;

      final json = receta.toJson();
      await docReceta.set(json);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar receta'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16), children: <Widget>[
          TextField(
            decoration: const InputDecoration(labelText: 'Nombre'),
            controller: nombreController,
          ),
        TextField(
          decoration: const InputDecoration(labelText: 'Descripcion'),
          controller: descripcionController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Ingredientes'),
          controller: ingredientesController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'preparacion'),
          controller: preparacionController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'duracion'),
          controller: duracionController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'dificultad'),
          controller: dificultadController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'Link de imagen'),
          controller: imagenController,
        ),
        TextField(
          decoration: const InputDecoration(labelText: 'categoria'),
          controller: categoriaController,
        ),Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                if (nombreController.text.isNotEmpty &&
                    descripcionController.text.isNotEmpty &&
                    duracionController.text.isNotEmpty &&
                    ingredientesController.text.isNotEmpty &&
                    preparacionController.text.isNotEmpty &&
                    dificultadController.text.isNotEmpty &&
                    imagenController.text.isNotEmpty &&
                    categoriaController.text.isNotEmpty ) {
                  final nuevaReceta = Receta(
                    {},
                    nombre: nombreController.text,
                    descripcion: descripcionController.text,
                    duracion: duracionController.text,
                    ingredientes: ingredientesController.text,
                    preparacion: preparacionController.text,
                    dificultad: dificultadController.text,
                    imagen: imagenController.text,
                    categoria: categoriaController.text
                  );

                  crearReceta(nuevaReceta);

                  Navigator.pop(context);
                } else {
                  final snackBar = SnackBar(
                      content: const Text('Alguno de los campos esta vacio'),
                      action:
                      SnackBarAction(label: 'Cerrar', onPressed: () {}));

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text(
                'Agregar receta',
                style: TextStyle(color: Colors.black),
              ),
            )),
        ],
      ),
    );
  }
}