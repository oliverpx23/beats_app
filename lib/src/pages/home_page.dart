import 'package:beats_app/src/widgets/CardsView.dart';
import 'package:beats_app/src/widgets/CustomAppBar.dart';
import 'package:beats_app/src/widgets/FondoCircular.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FondoCircular(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CustomAppBar(),
                  _Header(),
                  CardsView()
                ],
              ),
            ),
          ),
          BuyButton()
        ],
      ),
    );


  }
}


class _Header extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 45.0,),
          Text(
            'Beats', 
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0
            )),
          Text(
            'By Oliver Pots', 
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 18.0
            ))  
        ],
      ),
    );
  }


}



class BuyButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
            width: mq.width * 0.3,
            height: 75.0,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Comprar', 
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )
                ),
                SizedBox(width: 5.0),
                Icon(FontAwesomeIcons.arrowRight, color: Colors.white,)
              ],
            ),
          ),
        )
      ],
    );
  }
}