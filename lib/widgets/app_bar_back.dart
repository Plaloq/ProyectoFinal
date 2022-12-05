import 'package:flutter/material.dart';

Widget appBarBack(String titulo) {
  return SliverAppBar(
    backgroundColor: Colors.orange,
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
  );
}