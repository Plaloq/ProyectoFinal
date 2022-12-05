import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/pages/categoria_page.dart';
import 'package:proyectofinal/providers/provider.dart';

List<Widget> categoriaListado(BuildContext context){
  final List<Widget> listadoCategoria = [];
  final List<dynamic> categorias = recetasProvider.categorias;

  categorias.forEach((categoria) {
    final Widget widgetProv = _imagenCategorias(context, categoria);
    listadoCategoria.add(widgetProv);
  });

  return listadoCategoria;
}

Widget _imagenCategorias(BuildContext context, Map<String, dynamic> categoria) {
  return GestureDetector(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder:(context)=>CategoriaPage()));
      //Navigator.pushNamed(context, 'categoria', arguments: categoria);
    },
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(right: 15, top:10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                imageUrl: categoria['imagen'],
                fit: BoxFit.scaleDown,
                height: 80,
                placeholder: (context, url) => Padding(
                  padding: EdgeInsets.all(18.0),
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.blue),
                ),
                errorWidget: (context, url, error) =>Padding(
                  padding: EdgeInsets.all(18.0),
                  child: CircularProgressIndicator(
                      strokeWidth: 2, color: Colors.blue),
                ),
              ),
            )
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(20),
          child: Text(
            categoria['nombre'],
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              decorationColor: Colors.black,
              decorationStyle: TextDecorationStyle.wavy
            ),
          ),
        )
      ],
    )
  );
}