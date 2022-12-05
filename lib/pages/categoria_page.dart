import 'package:flutter/material.dart';
import 'package:proyectofinal/viewModels/recetas_listado.dart';
import 'package:proyectofinal/widgets/app_bar_back.dart';
import 'package:proyectofinal/widgets/titles.dart';
import 'package:proyectofinal/providers/provider.dart';

class CategoriaPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    final Map<String, dynamic> categoria = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;


    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          appBarBack(categoria['nombre']),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Titles(categoria['nombre'], 34),
                  FutureBuilder(
                    future: recetasProvider.cargarRecetaCategorias(categoria['nombre']),
                    initialData: [],
                    builder: (BuildContext context, AsyncSnapshot snapshot){
                      return Column(
                        children: recetasListado(context, snapshot.data!), //??[]
                      );
                    },
                  )
                ]
              )
          )
        ],
      ),
    );
  }
}