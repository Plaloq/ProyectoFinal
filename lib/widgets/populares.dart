import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import 'package:flutter_swiper/flutter_swiper.dart';

class Populares extends StatelessWidget{


  final controller = PageController(
    initialPage: 1,
    viewportFraction: 1
  );

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 250,
      child: Swiper(
        itemBuilder: (BuildContext context, int index){
          return  PageView(
            controller: controller,
            children: <Widget>[
              _tarjeta(),
              _tarjeta(),
              _tarjeta()
            ],
          );
        },
        itemCount: 2,
        itemWidth: 200.0,
        itemHeight: 300.0,
        layout: SwiperLayout.DEFAULT,
      )
    );
  }

  Widget _tarjeta(){
    return Container(
      margin: EdgeInsets.only(left: 30.0),
      alignment: AlignmentDirectional.centerEnd,
      child:  CachedNetworkImage(
        imageUrl: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.clara.es%2Frecetas%2Frecetas-comida_19263&psig=AOvVaw1o2Fy95cc43qEMQanD5zoG&ust=1670211361836000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCMiokaiE3_sCFQAAAAAdAAAAABAJ',
        fit: BoxFit.fill,
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
      )
    );
  }
}
