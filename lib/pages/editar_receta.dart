import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/models/receta_model.dart';

class EditarReceta extends StatefulWidget {
  const EditarReceta({Key? key, required this.receta}) : super(key: key);

  final Map<String, dynamic> receta;

  @override
  _EditarReceta createState() => _EditarReceta(receta);
}

class _EditarReceta extends State<EditarReceta> {
  late Map<String, dynamic> receta;
  String id = '';
  TextEditingController nombreController = TextEditingController();
  TextEditingController descripcionController = TextEditingController();
  TextEditingController duracionController = TextEditingController();
  TextEditingController ingredientesController = TextEditingController();
  TextEditingController preparacionController = TextEditingController();
  TextEditingController dificultadController = TextEditingController();
  TextEditingController imagenController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();

  _EditarReceta(this.receta);

  initState() {
    receta = widget.receta;
    id = widget.receta['id'];

    nombreController.text = receta['nombre'];
    descripcionController.text = receta['descripcion'];
    duracionController.text = receta['duracion'];
    ingredientesController.text = receta['ingredientes'];
    preparacionController.text = receta['preparacion'];
    dificultadController.text = receta['dificultad'];
    imagenController.text = receta['imagen'];
    categoriaController.text = receta['categoria'];
  }

  @override
  Widget build(BuildContext context) {
    receta = widget.receta;

    Future crearReceta(Receta recetaE) async {
      final docReceta =
          FirebaseFirestore.instance.collection('recetas').doc(id);

      final json = recetaE.toJson();
      await docReceta.set(json);
    }

    Future deleteReceta() async {
      final docReceta =
          FirebaseFirestore.instance.collection('recetas').doc(id);
      await docReceta.delete();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar receta'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
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
          ),
          Align(
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
                      categoriaController.text.isNotEmpty) {
                    final nuevaReceta = Receta(
                        {},
                        id: receta['id'],
                        nombre: nombreController.text,
                        descripcion: descripcionController.text,
                        duracion: duracionController.text,
                        ingredientes: ingredientesController.text,
                        preparacion: preparacionController.text,
                        dificultad: dificultadController.text,
                        imagen: imagenController.text,
                        categoria: categoriaController.text);

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
                  'Actualizar receta',
                  style: TextStyle(color: Colors.black),
                ),
              )),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                deleteReceta();
                Navigator.pop(context);
              },
              child: const Text(
                'Eliminar',
                style: TextStyle(color: Colors.black),

              ),
            ),
          )
        ],
      ),
    );
  }
}
