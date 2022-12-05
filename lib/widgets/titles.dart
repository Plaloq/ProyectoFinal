import 'package:flutter/material.dart';


Widget Titles(String texto, double tamLetra) {
  return Container(
    alignment: AlignmentDirectional.topStart,
    margin: EdgeInsets.only(left: 30.0),
    child: Text(
      texto,
      style: TextStyle(
        fontFamily: 'PlayfairDisplay-Bold',
        fontWeight: FontWeight.bold,
        color: Color.fromRGBO(15, 55, 31, 1.0),
        fontSize: tamLetra,
      ),
    ),
  );
}