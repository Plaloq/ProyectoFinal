import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


Widget appBarCompleta(String titulo, String imagen) {
  return SliverAppBar(
    backgroundColor: Colors.orange,
    expandedHeight: 200,
    floating: false,
    pinned: true,
    elevation: 0.0,
    title: Text(titulo, style: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
    ),
    iconTheme: IconThemeData(
        color: Colors.black
    ),
    flexibleSpace: FlexibleSpaceBar(
      background: FadeInImage(
        placeholder: NetworkImage(imagen),
        image:  NetworkImage(imagen),
        fadeInDuration: Duration(milliseconds: 150),
        fit: BoxFit.cover,
      ),
    )
  );
}