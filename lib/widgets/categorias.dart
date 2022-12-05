import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:proyectofinal/providers/provider.dart';
import 'package:proyectofinal/viewModels/categorias_listado.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

class Categorias extends StatelessWidget{

  final controller = PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return FutureBuilder(
              future: recetasProvider.cargarCategorias(),
              initialData: [],
              builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
                return PageView(
                  controller: controller,
                  children: categoriaListado(context),
                );
              }
          );
        },
        itemCount: 3,
        layout: SwiperLayout.DEFAULT,
      ),
    );
  }
}
