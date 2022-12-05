import 'package:flutter/material.dart';
import 'package:proyectofinal/providers/provider.dart';
import 'package:proyectofinal/widgets/app_bar.dart';
import 'package:proyectofinal/widgets/categorias.dart';
import 'package:proyectofinal/widgets/menu_lateral.dart';
import 'package:proyectofinal/widgets/populares.dart';
import 'package:proyectofinal/widgets/titles.dart';

import 'package:proyectofinal/viewModels/recetas_listado.dart';

class HomePage extends StatelessWidget{
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context){



    return Scaffold(
      drawer: menuLateral(context),
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers:<Widget> [
          appBar(context, _scaffoldKey),
          SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children:<Widget> [
                      Populares(),
                      Titles('Categorias', 24),
                      Categorias(),
                      Titles('Recetas populares', 24),
                      FutureBuilder(
                        future: recetasProvider.cargarRecetas(),
                        initialData: [],
                        builder: (  BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                          return Column(
                            children: recetasListado(context, snapshot.data!), //??[]
                          );
                        },
                      )
                      //recetasListado(context),
                    ],
                  )
                ]
              )
          )
        ],
      )
    );
  }
}