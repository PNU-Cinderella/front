import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/Classes.dart';

class TaxiHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: colorLightGray,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top,),
              BasicTitle(width: 393, height: 50, title: "확인",
              left: 20, top: 14, bottom: 14,textStyle: textstylePageHeader,),
              SizedBox(height: 35,),
              TaxiStatusBox(
                status: "참여중이에요",
                subStatus: "부산은행에서 2:30 출발예정",
              ),
              SizedBox(height: 90,),
              TaxiHistorySearchBar(),
              SizedBox(height: 11,),
              TaxiHistoryList(),
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
}