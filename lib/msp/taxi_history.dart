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
  double? myWidth;
  double? myHeight;
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
      width: myWidth,
      height: myHeight,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 52, top: 24),
            width: 118,
            height: 48,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  textStatus!,
                  SizedBox(height: 4,),
                  textStatusSub!,
                ]
            ),
          ),
          SizedBox(height: 25,),
          Container(
              margin: EdgeInsets.only(left: 24),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 10,
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
    Image.asset("assets/images/ListView/icon_taxi_start.png"),
    Image.asset("assets/images/ListView/icon_dest_1.png"),
    Image.asset("assets/images/ListView/icon_dest_2.png"),
    Image.asset("assets/images/ListView/icon_dest_3.png"),
    Image.asset("assets/images/ListView/icon_dest_4.png"),
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
        children: [
          imageList[order],
          SizedBox(height: 4,),
          textIcon!
        ],
      ),
    );
  }
}

class TaxiHistorySearchBar extends StatelessWidget{

  double? myWidth = 356;
  double? myHeight = 53;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      child: Row(
        children: [
          SizedBox(width: 15,),
          Image.asset("assets/images/icon_search.png"),
          SizedBox(width: 240,),
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

class TaxiHistoryList extends StatelessWidget
{
  double? myWidth = 356;
  double? myHeight = 340;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: TaxiHistoryBox(
                date: '2023.03.01',
                routeTitle: '부산은행-명륜역',
                peopleCount: '4',
                historyState: '정산완료',
                time: '02:30',
                route: '부산은행-명륜역-교대역-서면역-송정역',),
            );
          }
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

      ),
    );
  }
}