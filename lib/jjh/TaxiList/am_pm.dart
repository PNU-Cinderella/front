// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AmPm extends StatelessWidget {
  final bool isItAm;

  AmPm({required this.isItAm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            isItAm == true ? '오전' : '오후',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
