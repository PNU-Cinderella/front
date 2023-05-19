import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/roomparse.dart';
// import 'roomparse.dart';

Container listView_group(String Arival) => Container(
    width: 50,
    height: 50,
    decoration: BoxDecoration(
      color: Color.fromRGBO(239, 239, 239, 1),
      border: Border.all(
        color: Color.fromRGBO(0, 0, 0, 1),
        width: 1,
      ),
      borderRadius: BorderRadius.all(Radius.elliptical(50, 50)),
    ),
    child: Center(
      child: Text("${Arival}"),
    ));

class Makelist extends StatelessWidget {
  roomMember userlists;
  double PX;
  Makelist(this.userlists, this.PX);
  // int person;
  // String time;
  // Makelist(this.person, this.time, this.Arrive);
  // @override
  // State<Makelist> createState() => _MakelistState();
// }

// class _MakelistState extends State<Makelist> {
  // dynamic lsts;
  // Map<String, dynamic> usermaps;
  // _MakelistState(this.usermaps);
  // List<roomMember> lsts = usermaps.isNotEmpty
  // void makelsts() {
  //   dynamic lsts = roomMembers.fromJson(widget.usermaps);
  // }

  // var user = User.fromJson(widget.usermaps);
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   lsts = roomMember.fromJson(usermaps);
  //   print(lsts.runtimeType);
  // }

  @override
  Widget build(BuildContext context) {
    // box-shadow: 0px 3px 3px 5px rgba(245, 245, 245, 0.25);

    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(245, 245, 245, 0.25),
            offset: Offset(0, 3),
            blurRadius: 3)
      ]),
      width: 353 * PX,
      height: 140 * PX,
      color: Color.fromRGBO(255, 255, 255, 1),
      // color: Colors.blueAccent,
      // child: Text(usermaps as String),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 22 * PX, top: 13 * PX),
                child: Text(
                  "${userlists.host} (${userlists.num_of_people}/4)",
                  style: TextStyle(
                      fontSize: 15 * PX,
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: 124 * PX,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20 * PX),
                child: Text(
                  "${userlists.time}",
                  style: TextStyle(
                      fontFamily: "Pretendard",
                      fontWeight: FontWeight.w700,
                      fontSize: 13 * PX,
                      color: Color.fromRGBO(64, 113, 205, 1)),
                ),
              )
              // Text(usermaps.runtimeType as String),
              // Image.asset('assets/images/ListView/user1.png'), //크기 20x20이미지
              // Text(lsts),
            ],
          ),
        ],
      ),
    );
  }
}
