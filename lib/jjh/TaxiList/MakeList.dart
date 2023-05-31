import 'package:flutter/material.dart';
import '../../msp/functions.dart';
import 'package:project_cinderella_test3/roomparse.dart';
// import 'roomparse.dart';

Container listView_group(
        String start, List Arival, double RealHeight, double RealWidth) =>
    Container(
        width: 353 * RealWidth,
        height: 90 * RealHeight,
        decoration: BoxDecoration(
            // color: Color.fromRGBO(239, 239, 239, 1),
            // border: Border.all(
            //   color: Color.fromRGBO(0, 0, 0, 1),
            //   width: 1,
            // ),
            ),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/images/ListView/Union.png"),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    "${start}",
                    style: SimpleTextStyle(size: 14),
                  ),
                ),
              ],
            ),
            for (var i = 0; i < Arival.length; i++) ...{
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "${i + 1}",
                          style: SimpleTextStyle(
                              size: 18,
                              weight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        "${Arival[i]}..",
                        style: SimpleTextStyle(size: 14),
                      ),
                    ),
                  ],
                ),
              ),
            }
            // Text("${Arival}"),
          ],
        ));

class Makelist extends StatelessWidget {
  roomMember userlists;
  double RealHeight;
  double RealWidth;
  Makelist(this.userlists, this.RealHeight, this.RealWidth);
  // int person;
  // String time;
  // Makelist(this.person, this.time, this.Arrive);
  // @override
  // State<Makelist> createState() => _MakelistState();
// }

  @override
  Widget build(BuildContext context) {
    // box-shadow: 0px 3px 3px 5px rgba(245, 245, 245, 0.25);

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(245, 245, 245, 0.25),
              offset: Offset(0, 3),
              blurRadius: 3)
        ],
      ),
      width: 353 * RealWidth,
      height: 156 * RealHeight,

      // color: Colors.blueAccent,
      // child: Text(usermaps as String),
      child: Column(
        children: [
          SizedBox(
            height: GetRealHeight(pixel: 13, context: context),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  "${userlists.host} (${userlists.num_of_people}/4)",
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "${userlists.time}",
                    style: TextStyle(
                        fontFamily: "Pretendard",
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color.fromRGBO(64, 113, 205, 1)),
                  ),
                  Icon(
                    Icons.more_vert,
                  ),
                ],
              ),

              // Text(usermaps.runtimeType as String),
              // Image.asset('assets/images/ListView/user1.png'), //크기 20x20이미지
              // Text(lsts),
            ],
          ),
          SizedBox(
            height: GetRealHeight(pixel: 26, context: context),
          ),
          listView_group(
              userlists.start, userlists.dest, RealHeight, RealWidth),
        ],
      ),
    );
  }
}
