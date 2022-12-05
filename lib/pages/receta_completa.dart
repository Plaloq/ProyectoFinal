import 'package:flutter/material.dart';
import 'package:proyectofinal/models/receta_model.dart';
import 'package:proyectofinal/widgets/app_bar_completa.dart';
import 'package:proyectofinal/widgets/titles.dart';
import 'package:proyectofinal/pages/editar_receta.dart';

class CompletaPage extends StatelessWidget {
  final String descripcion =
      'Mucho texto Mucho texto Mucho texto Mucho texto Mucho texto Mucho texto';
  final String ingredientes =
      'muchos ingredientes muchos ingredientes muchos ingredientes muchos ingredientesmuchos ingredientes muchos ingredientes muchos ingredientes muchos ingredientes muchos ingredientes muchos ingredientes';

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> receta = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () async {
          Navigator.push(context, MaterialPageRoute(builder:(context)=>EditarReceta(receta: receta)));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.edit),
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          appBarCompleta(receta['nombre'], receta['imagen']),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _cuerpoReceta(receta)
              //textoReceta(),
            ),
            Titles('Ingredientes', 28),
            SizedBox(
              height: 20.0,
            ),
            _textoIngredientes(receta['ingredientes']),
            Titles('Preparacion', 28),
            _textoDescripcion(receta['preparacion']),
          ]))
        ],
      ),
    );
  }

  Widget _cuerpoReceta(Map<String, dynamic> receta){
    return Container(
      alignment: AlignmentDirectional.topStart,
      margin: EdgeInsets.only(left: 30.0, top: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:<Widget> [
          Text(
            receta['nombre'],
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(15, 55, 91, 1.0),
                fontSize: 18.0
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            receta['descripcion'],
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(15, 55, 91, .8),
                fontSize: 14.0
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Container(
            child: Row(
              children:<Widget> [
                Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.alarm, color: Color.fromRGBO(243, 198, 36, 1)),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(receta['duracion'],
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(15, 55, 91, 1),
                              fontSize: 14.0,
                            ),
                          ),
                        )
                      ],
                    )
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.fastfood, color: Color.fromRGBO(243, 198, 36, 1)),
                        Container(
                          margin: EdgeInsets.only(left: 5.0),
                          child: Text(receta['dificultad'],
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(15, 55, 91, 1),
                              fontSize: 14.0,
                            ),
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _textoIngredientes(String texto) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
      child: Text(
        texto,
        style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 13
        ),
      ),
    );
  }

  Widget _textoDescripcion(String texto) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, left: 30.0, right: 30.0),
      child: Text(
        texto,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontSize: 13
        ),
      ),
    );
  }


}
