import 'package:flutter/material.dart';

Widget appBar(BuildContext context, GlobalKey<ScaffoldState> key){
  return SliverAppBar(
    backgroundColor: Colors.orange,
    floating: false,
    leading: GestureDetector(
      onTap: (){
        key.currentState?.openDrawer();
      },
      child: Container(
        padding: EdgeInsets.all(15.0),
        child: Icon(Icons.menu),//Image.network('https://thenounproject.com/api/private/icons/462023/edit/?backgroundShape=SQUARE&backgroundShapeColor=%23000000&backgroundShapeOpacity=0&exportSize=752&flipX=false&flipY=false&foregroundColor=%23000000&foregroundOpacity=1&imageFormat=png&rotation=0&token=gAAAAABjjAj38e_aNXbI2qxDBf3gM8pIm3zEnqfERFmBqRlawqJPZGWENloNbmf_Ir9EZTkArVtB7RZ-RK47SMGWUWaObaR9gA%3D%3D'),
        width: 10.0,
        height: 10.0,
      ),
    ),
  );
}

