import 'package:flutter/material.dart';
import 'dart:math' as math;

class CinderellaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CinderellaWidget - TEXT
    return Transform.rotate(
      angle: 16.79876225447699 * (math.pi / 180),
      child: Text(
        'Cinderella',
        textAlign: TextAlign.right,
        style: TextStyle(
            color: Color.fromRGBO(26, 69, 109, 1),
            fontFamily: 'Italianno',
            fontSize: 135,
            letterSpacing: -0.40799999237060547,
            fontWeight: FontWeight.normal,
            height: 0.16296296296296298),
      ),
    );
  }
}
