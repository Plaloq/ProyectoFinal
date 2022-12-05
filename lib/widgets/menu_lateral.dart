import 'package:flutter/material.dart';
import 'package:proyectofinal/pages/agregar_receta.dart';
import 'package:proyectofinal/pages/login.dart';
import 'package:flutterfire_ui/auth.dart';

Drawer menuLateral(context){
  return Drawer(
    elevation: 0.0,
    child: Container(
      color: Colors.orange,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.amber
            ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  'RECETAS APP',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 28
                  ),
                ),
              )
          ),

          ListTile(
            leading: Icon(Icons.create, color: Colors.black),
            title: Text('Crear receta'),
            onTap: () {
              //Navigator.pushNamed(context, 'crear');
              Navigator.push(context, MaterialPageRoute(builder:(context)=>AgregarReceta()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.black),
            title: Text('Cerrar Sesion'),
            onTap: () {
              FlutterFireUIAuth.signOut(
                context: context,
              );
            },
          )
        ],
      ),
    ),
  );
}