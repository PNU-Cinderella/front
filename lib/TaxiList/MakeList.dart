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
  Makelist(this.userlists);
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
    return Container(
      width: 353,
      height: 110,
      // color: Colors.blueAccent,
      // child: Text(usermaps as String),
      child: Column(
        children: [
          Row(
            children: [
              // Text(usermaps.runtimeType as String),
              Image.asset('assets/images/ListView/user1.png'), //크기 20x20이미지
              // Text(lsts),
              SizedBox(
                width: 4,
              ),
              Text("${userlists.num_of_people} / 4"), //나중에 앞에 person
              SizedBox(
                width: 20,
              ),
              Image.asset('assets/images/ListView/clock1.png'),
              SizedBox(
                width: 4,
              ),
              Text("${userlists.time}"), // 나중에 Time
              SizedBox(
                width: 30,
              ),
              GestureDetector(onTap: () {}, child: Text("참여하기")),
              Text("왼쪽에 누를 수 \n있는 버튼이에요"),
            ],
          ),
          Row(
            children: [
              // for (int arrive in lsts[4]) listView_group(lsts[2]),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
