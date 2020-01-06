import 'package:beats_app/src/models/producto_model.dart';
import 'package:beats_app/src/provider/producto_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CardsView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context).size;
    final productos = Provider.of<ProductosProvider>(context);

    return Container(
      width: double.infinity,
      height: 460.0,
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.8,
        ),
        children: productos.productos.map((producto) => _Card(producto)).toList(),
      ),
    );
  }
}

class _Card extends StatelessWidget {

  ProductoModel prod;

  _Card(this.prod);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              _PrimeraDescripcion(prod),
              SizedBox(width: 55.0,),
              _TarjetaDescripcion(prod)
            ],
          ),

          Positioned(
            top: 90,
            left: 50,
            child: Image(
              image: AssetImage('assets/${prod.url}'),
              width: 160.0,
            ),
          )



        ],
      ),
    );



  }



}

class _TarjetaDescripcion extends StatelessWidget {

  ProductoModel prod;

  _TarjetaDescripcion(this.prod);

  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context).size;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: mq.width * 0.55,
          height: 340.0,
          color: Color(prod.color),
          child: Column(
            children: <Widget>[
              SizedBox(height: 25.0,),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(prod.titulo, style: TextStyle(color: Colors.white24, fontSize: 30, fontWeight: FontWeight.bold),),
                    Text(prod.subtitulo, style: TextStyle(color: Colors.white24, fontSize: 30, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Text(prod.nombre, style: TextStyle(color: Colors.white)),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart, color: Colors.white,)
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Text('\$${prod.precio}', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
                    width: 80.0,
                  ),
                  Container(
                    child: Center(
                      child: Text('Al Cariito', style: TextStyle(color: Colors.white),),
                    ),
                    width: 120.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0))
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}

class _PrimeraDescripcion extends StatelessWidget {

  ProductoModel prod;

  _PrimeraDescripcion(this.prod);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.batteryFull, size: 15.0),
            SizedBox(width: 10.0,),
            Text('${prod.bateria}-Horas de Bateria', style: TextStyle(fontSize: 12.0),),
            SizedBox(width: 30.0,),
            Icon(FontAwesomeIcons.wifi, size: 15.0),
            SizedBox(width: 10.0,),
            Text('Wireless', style: TextStyle(fontSize: 12.0),),
          ],
        ),
      ),
    );
  }



}