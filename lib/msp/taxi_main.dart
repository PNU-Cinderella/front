import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_cinderella_test3/jjh/TaxiList/CreateGroup.dart';
import 'package:project_cinderella_test3/jjh/TaxiList/TaxiList.dart';
import 'package:project_cinderella_test3/msp/taxi_mypage.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/taxi_history.dart';


class TaxiMain extends StatefulWidget {

  @override
  State<TaxiMain> createState() => _TaxiMainState();
}

class _TaxiMainState extends State<TaxiMain>
{
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = <Widget>[
    TaxiHistory(),
    TaxiList(),
    TaxiMypage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar:
         BottomNavigationBar(
          currentIndex: _selectedIndex,
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
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
