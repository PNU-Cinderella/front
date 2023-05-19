import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';

class BasicButton extends StatelessWidget
{
  BuildContext? myContext;
  double? myWidth;
  double? myHeight;
  void Function()? funcOnPressed;
  ButtonStyle? myButtonStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      side: BorderSide(color: Colors.black, width: 1.4)
  );
  Widget? myIcon;
  Widget? myText;

  BasicButton({BuildContext? context, double? width, double? height, void Function()? func, ButtonStyle? style, Widget? icon, Widget? text}){
    myContext = context;
    myWidth = width;
    myHeight = height;
    funcOnPressed = func;
    myButtonStyle = style;
    myIcon = icon;
    myText = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      child: OutlinedButton.icon(
        onPressed: funcOnPressed,
        style: myButtonStyle,
        icon: myIcon!,
        label: myText!,
      ),
    );
  }
}

class BasicTitle extends StatelessWidget
{
  double? myWidth;
  double? myHeight;
  double? paddingLeft;
  double? paddingTop;
  double? paddingRight;
  double? paddingBottom;
  TextStyle? myTextStyle;
  String? myTitle;

  BasicTitle({required double? width, required double? height,
  double? left=0,double? top=0,double? right=0,double? bottom=0,
  required TextStyle? textStyle, required String? title})
  {
    width = myWidth;
    height = myHeight;
    paddingLeft = left;
    paddingTop = top;
    paddingRight = right;
    paddingBottom = bottom;
    myTextStyle = textStyle;
    myTitle = title;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
      paddingLeft!, paddingTop!, paddingRight!, paddingBottom!),
      child: Container(
        width: myWidth,
        height: myHeight,
        child :
        Row(
          children: [
            Text(myTitle!, style:myTextStyle),
          ],
        ),
      )
    );
  }
  
}

class BasicStatefulBox extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class BasicCircle extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(Rect.fromLTRB(0, 0, size.width, size.height),
        Paint()
          ..color.blue
          ..strokeWidth = 2
          ..style = PaintingStyle.fill
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  
}

//Taxi_History Page Classes

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
                  IconTaxiCurrent(image: Image.asset("assets/images/icon_taxi_main.png"),
                      text: "부산은행"),
                  IconTaxiCurrent(image: Image.asset("assets/images/icon_taxi_main.png"),
                      text: "명륜역"),
                  IconTaxiCurrent(image: Image.asset("assets/images/icon_taxi_main.png"),
                      text: "교대역"),
                  IconTaxiCurrent(image: Image.asset("assets/images/icon_taxi_main.png"),
                      text: "서면역"),
                  IconTaxiCurrent(image: Image.asset("assets/images/icon_taxi_main.png"),
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
  double? myWidth;
  double? myHeight;
  int? order;
  Widget? imageIcon;
  Widget? textIcon;

  IconTaxiCurrent({double width = 50, double height = 70, required Widget image, required String text})
  {
    myWidth = width;
    myHeight = height;
    imageIcon = image;
    textIcon = Text(text, style: textstyleBoxDescr);
  }

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: myWidth,
      height: myHeight,
      child: Column(
        children: [
          CustomPaint(
            size: Size(30,30),
            painter: BasicCircle(),
          ),
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

class TaxiHistoryList extends StatelessWidget{
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
