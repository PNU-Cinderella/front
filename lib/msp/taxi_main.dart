import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_cinderella_test3/jjh/TaxiList/CreateGroup.dart';
import 'package:project_cinderella_test3/jjh/TaxiList/TaxiList.dart';
import 'package:project_cinderella_test3/msp/blockList.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
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
    TaxiMypage(),
    BlockList()
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
        body:
        _widgetOptions.elementAt(_selectedIndex),
        // Navigator(
        //   onGenerateRoute: (settings){
        //     Widget page = TaxiList();
        //     if(settings.name == 'taxiHistory') page = TaxiHistory();
        //     else if(settings.name == 'taxiMypage') page = TaxiMypage();
        //     else if(settings.name == 'blockList') page = BlockList();
        //   },
        // ),
        bottomNavigationBar:
         Container(
           height: GetRealHeight(pixel: 84, context: context),
           child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            selectedItemColor: colorBlack,
            unselectedFontSize: 14,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  label: '확인',
                  icon: Image.asset("assets/images/BottomNavigationBar/icon_history_passive.png", width: 25, height: 25,),
                  activeIcon: Image.asset("assets/images/BottomNavigationBar/icon_history_active.png", width: 25, height: 25,),
                  backgroundColor: colorLightGray),
              BottomNavigationBarItem(
                  label: '택시팟',
                  icon: Image.asset("assets/images/BottomNavigationBar/icon_taxi_passive.png", width: 25, height: 25,),
                  activeIcon: Image.asset("assets/images/BottomNavigationBar/icon_taxi_active.png", width: 25, height: 25,),
                  backgroundColor: colorLightGray),
              BottomNavigationBarItem(
                  label: '마이',
                  icon: Image.asset("assets/images/BottomNavigationBar/icon_my_passive.png", width: 25, height: 25,),
                  activeIcon: Image.asset("assets/images/BottomNavigationBar/icon_my_active.png", width: 25, height: 25,),
                  backgroundColor: colorLightGray),
            ],
            onTap: _onItemTapped,
        ),
         ),
      ),
    );
  }
}
