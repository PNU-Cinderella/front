import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';

Container MakeContainer(double? myWidth, double? myHeight)
{
  return Container(
    width: myWidth,
    height: myHeight,
    color: Colors.lightGreen,
  );
}

class MyContainer extends StatelessWidget
{
  double? myWidth;
  double? myHeight;
  MyContainer(double? width, double? height)
  {
    this.myWidth = width;
    this.myHeight = height;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: myWidth,
        height: myHeight,
        color: Colors.blue,
      ),
    );
  }
}

class TaxiHistoryBox extends MyContainer
{

  double? myWidth;
  double? myHeight;

  TaxiHistoryBox(double? width, double? height):super(0,0){
    this.myWidth = width;
    this.myHeight = height;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: myWidth,
        height: myHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.greenAccent,
        ),
        child: new Text("I'm HistoryBox!"),
      ),
    );
  }

}


class Functions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: colorBackground,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 100,),
              MakeContainer(120, 50),
              SizedBox(height: 50,),
              MyContainer(120, 50),
              SizedBox(height: 50,),
              TaxiHistoryBox(120, 50),
            ],
          ),
        ),
      ),
    );
  }
}
