import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/taxi_history.dart';

Widget buildSegment(String text)
{
  return Container(
    child: Text(text,style: textstylePageSubHeader,),
  );
}

class TaxiMain extends StatefulWidget {
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
              boxTaxiListTitle,
              // CupertinoSegmentedControl<int>(
              //   groupValue: groupValue,
              //   children: {
              //       0 : buildSegment("부산은행"),
              //       1 : buildSegment("부산대역"),
              //       2 : buildSegment("부산대정문"),
              //     },
              //     onValueChanged: (value){setState((){groupValue = value;})}
              // )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          selectedItemColor: colorBlack,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
            label: '탑승기록',
            icon: Image.asset("assets/images/icon_taxi_history.png"),
            backgroundColor: colorLightGray),
            BottomNavigationBarItem(
            label: '택시팟',
            icon: Image.asset("assets/images/icon_taxi_main.png"),
            backgroundColor: colorLightGray),
            BottomNavigationBarItem(
            label: 'my',
            icon: Image.asset("assets/images/icon_taxi_my.png"),
            backgroundColor: colorLightGray),
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
