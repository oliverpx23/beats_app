import 'package:flutter/material.dart';

class FondoCircular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        Positioned(
          right: -(mq.width) * 1.1,
          top: -(mq.width) * 0.4,
          child: Container(
            width: mq.height * 0.8,
            height: mq.height * 0.8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 239, 239, 1.00),
              borderRadius: BorderRadius.circular(2000.0)
            ),
          ),
        )
      ],
    );

  }
}