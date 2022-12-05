import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

List<Widget> recetasListado(BuildContext context, List<dynamic> recetas) {
  final List<Widget> listadoRecetas = [];
  recetas.forEach((receta) {
    final listadoWidgetProv = _cuerpoRecetaListado(context, receta);
    listadoRecetas.add(listadoWidgetProv);
  });
  return listadoRecetas;
}

Widget _cuerpoRecetaListado(BuildContext context, Map<String,dynamic> receta){
  return Column(
    children:<Widget> [
      SizedBox(
        height: 20.0,
      ),
      GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, 'completa', arguments: receta );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: receta['imagen'],
              fit: BoxFit.scaleDown,
              width: 360,
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
      )
    ],
  );
}