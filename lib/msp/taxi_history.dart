import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/jjh/TaxiList/CreateGroup.dart';
import 'package:project_cinderella_test3/jjh/TaxiList/TaxiList.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/Classes.dart';

class TaxiHistory extends StatefulWidget {

  @override
  State<TaxiHistory> createState() => _TaxiHistoryState();
}

class TaxiStatusBox extends StatelessWidget
{
  double myWidth = 350;
  double myHeight = 190;
  Text? textStatus;
  Text? textStatusSub;

  TaxiStatusBox({double width = 350, double height = 190, required String? status, required String? subStatus})
  {
    myWidth = width;
    myHeight = height;
    textStatus = Text(status!, style: textstyleBoxHeader);
    textStatusSub = Text(subStatus!, style: textstyleBoxSub);
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      margin: RealLTRB(left: 24.55, top: 11, right: 0, bottom: 0, context: context),
      width: GetRealWidth(pixel: myWidth, context: context),
      height: GetRealHeight(pixel: myHeight, context: context),
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: GetRealWidth(pixel: 14, context: context),
                height: GetRealHeight(pixel: 14, context: context),
                margin: RealLTRB(left: 23, top: 27, right: 0, bottom: 0, context: context),
                child: Image.asset("assets/images/TaxiHistory/icon_blue_circle.png"),
              ),
              Container(
                margin: RealLTRB(left: 15, top: 24, right: 0, bottom: 0, context: context),
                width: GetRealWidth(pixel: 118, context: context),
                height: GetRealHeight(pixel: 48, context: context),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      textStatus!,
                      SizedBox(height: 4,),
                      textStatusSub!,
                    ]
                ),
              ),
              BasicButton(width: 112, height: 22,
                mLeft: 55, mTop: 24, func: (){}, buttonStyle: ElevatedButton.styleFrom(backgroundColor: Color(0xffE3EBF7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)) ),
                text: "오픈채팅 바로가기", textStyle: SimpleTextStyle(size: 12, weight: FontWeight.w400, color: Color(0xff0152B1)),)
            ],
          ),
          SizedBox(height: 25,),
          Container(
              margin: EdgeInsets.only(left: 24),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: GetRealWidth(pixel: 14, context: context),
                children: [
                  IconTaxiCurrent(order: 0,
                      text: "부산은행"),
                  IconTaxiCurrent(order: 1,
                      text: "명륜역"),
                  IconTaxiCurrent(order: 2,
                      text: "교대역"),
                  IconTaxiCurrent(order: 3,
                      text: "서면역"),
                  IconTaxiCurrent(order: 4,
                      text: "송정역"),
                ],
              )
          ),
        ],
      ),
    );
  }

}

class IconTaxiCurrent extends StatelessWidget{
  double myWidth = 0;
  double myHeight = 0;
  int order = 0;
  Widget? imageIcon;
  Widget? textIcon;
  List<Widget> imageList = [
    Image.asset("assets/images/TaxiHistory/icon_taxi_start.png"),
    Image.asset("assets/images/TaxiHistory/icon_dest_1.png"),
    Image.asset("assets/images/TaxiHistory/icon_dest_2.png"),
    Image.asset("assets/images/TaxiHistory/icon_dest_3.png"),
    Image.asset("assets/images/TaxiHistory/icon_dest_4.png"),
  ];
  
  IconTaxiCurrent({double width = 50, double height = 70, required int order, required String text})
  {
    myWidth = width;
    myHeight = height;
    this.order = order;
    textIcon = Text(text, style: textstyleBoxDescr);
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: GetRealWidth(pixel: myWidth, context: context),
      height: GetRealHeight(pixel: myHeight, context: context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          imageList[order],
          SizedBox(height: 4,),
          textIcon!
        ],
      ),
    );
  }
}

class TaxiHistorySearchBar extends StatefulWidget{

  @override
  State<TaxiHistorySearchBar> createState() => _TaxiHistorySearchBarState();
}

class _TaxiHistorySearchBarState extends State<TaxiHistorySearchBar> {
  double? myWidth = 356;

  double? myHeight = 53;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      margin: RealLTRB(left: 21, top: 77, right: 0, bottom: 0, context: context),
      child: Row(
        children: [
          RealSizedBox(width: 15, height:0),
          Image.asset("assets/images/icon_search.png"),
          RealSizedBox(width: 240, height:0),
          Text("최신순", style: textstyleBoxDescr,),
          Image.asset("assets/images/icon_down_arrow.png"),
        ],
      ),
      decoration: BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}



class TaxiHistoryBox extends StatelessWidget {
  double? myWidth;
  double? myHeight;
  Text? textDate;
  Text? textRouteTitle;
  Text? textPeople;
  Text? textHistoryState;
  Text? textTime;
  Text? textRoute;

  TaxiHistoryBox({double width = 356, double height = 110, required String date,
    required String routeTitle, required String peopleCount, required String historyState,
    required String time, required String route})
  {
    myWidth = width;
    myHeight = height;
    textDate = Text(date, style: textstyleBoxDescr,);
    textRouteTitle = Text(routeTitle, style: textstyleBoxDescr,);
    textPeople = Text(peopleCount, style: textstyleBoxDescrHalfVis,);
    textHistoryState = Text(historyState, style: textstyleBoxDescrHalfVis,);
    textTime = Text(time, style: textstyleBoxDescr,);
    textRoute = Text("경로  |  " + route, style: textstyleBoxDescrHalfVis,);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      decoration: BoxDecoration(
        color: colorWhite,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 12, top: 12),
            child: Wrap(
              direction: Axis.vertical,
              spacing: 4,
              children: [
                Row(
                  children:[
                    textDate!,
                    SizedBox(width: 9,),
                    textRouteTitle!,
                    Image.asset("assets/images/icon_room_members.png"),
                    SizedBox(width: 3,),
                    textPeople!,
                    SizedBox(width: 76),
                    textHistoryState!,
                  ],
                ),
                Row(
                  children: [
                    Image.asset("assets/images/icon_clock.png"),
                    textTime!,
                  ],
                ),
                Row(
                  children: [
                    textRoute!,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class TaxiHistoryList extends StatefulWidget
{
  @override
  State<TaxiHistoryList> createState() => _TaxiHistoryListState();
}

class _TaxiHistoryListState extends State<TaxiHistoryList> {
  double? myWidth = 356;

  double? myHeight = 340;

  bool sortAsending = true;

  final List<Map<String, dynamic>> taxiHistory = [
    {'date': '2023.03.31', 'routeTitle': '부산은행-명륜역', 'peopleCount': 4,'historyState': '정산완료','time' : '02:30', 'route' : '부산은행-명륜역-교대역-서면역-송정역'},
    {'date': '2023.02.11', 'routeTitle': '부산대정문-온천역', 'peopleCount': 2,'historyState': '정산완료','time' : '17:40', 'route' : '부산대정문-온천역-롯데백화점'},
    {'date': '2023.01.27', 'routeTitle': '부산대역-부곡동', 'peopleCount': 3,'historyState': '정산완료','time' : '11:50', 'route' : '부산대역-부곡동-해운대-광안리'},
    {'date': '2023.01.03', 'routeTitle': '부산은행-서동고개', 'peopleCount': 3,'historyState': '정산완료','time' : '08:20', 'route' : '부산은행-서동고개-센텀시티-벡스코'},
    {'date': '2022.12.15', 'routeTitle': '부산대정문-광안리', 'peopleCount': 4,'historyState': '정산완료','time' : '12:30', 'route' : '부산대정문-광안리-대구-서울-개성'},
  ];

  void SortTaxiHistory(bool ascending) {
    setState(() {
      sortAsending = ascending;
      taxiHistory.sort((a, b) => ascending
          ? a['date'].compareTo(b['date'])
          : b['date'].compareTo(a['date']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: myWidth,
        height: myHeight,
        margin: RealLTRB(left: 21, top: 0, right: 0, bottom: 0, context: context),
        child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: taxiHistory.length,
            itemBuilder: (BuildContext context, int index){
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: TaxiHistoryBox(
                  date: taxiHistory[index]['date'],
                  routeTitle: taxiHistory[index]['routeTitle'],
                  peopleCount: taxiHistory[index]['peopleCount'].toString(),
                  historyState: taxiHistory[index]['historyState'],
                  time: taxiHistory[index]['time'],
                  route: taxiHistory[index]['route']
                ),
              );
            }
        ),
      ),
    );
  }
}

class _TaxiHistoryState extends State<TaxiHistory> {

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox( height: MediaQuery.of(context).padding.top,),
              Container(
                margin: RealLTRB(left: 25, top: 35, right: 0, bottom: 0, context: context),
                child: Text("확인", style: SimpleTextStyle(size: 25, weight: FontWeight.w700),),
              ),
              Container(
                margin: RealLTRB(left: 25, top: 25, right: 0, bottom: 0, context: context),
                child: Text("탑승 현황", style: SimpleTextStyle(size: 18, weight: FontWeight.w600),),
              ),
              TaxiStatusBox(
                status: "참여중이에요",
                subStatus: "부산은행에서 2:30 출발예정",
              ),
              TaxiHistorySearchBar(),
              RealSizedBox(width: 0, height: 11,),
              TaxiHistoryList(),
            ],
          ),
        ),

      ),
    );
  }
}