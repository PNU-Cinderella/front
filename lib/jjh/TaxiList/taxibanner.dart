import 'package:flutter/cupertino.dart';
import 'package:project_cinderella_test3/msp/functions.dart';

class Taxibanner extends StatelessWidget {
  const Taxibanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GetRealWidth(pixel: 354, context: context),
      height: GetRealHeight(pixel: 47, context: context),
      decoration: BoxDecoration(color: Color.fromRGBO(13, 154, 255, 0.5), borderRadius: BorderRadius.circular(10))
    );
  }
}