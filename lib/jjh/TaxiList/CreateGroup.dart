import 'dart:convert';
import 'package:project_cinderella_test3/msp/functions.dart';

import '../../msp/taxi_main.dart';
import 'package:http/http.dart' as http;
import 'am_pm.dart';
import 'hours.dart';
import 'minutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class User {
  String host = "host";
  int time;
  String dest;
  String start;

  User(this.time, this.start, this.dest);
}

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  int AM_PM = 0;
  int CurrentHour = 0;
  int CurrentMinute = 0;

  final _formKey = GlobalKey<FormState>(); //여기쪽을 위에 함수에 올려서 사용하기
  User user = User(0, "", "");
  final url = Uri.parse("http://10.0.2.2:8080/chatroom");

  Future save() async {
    Map data = {
      'host': user.host,
      'time': user.time,
      'start': user.start,
      'dest': user.dest
    };
    var body = json.encode(data);
    http.Response res = await http.post(
      // 나중에 여기 주석처리 해제해서 사용.
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    print(body);
  }

  var button_woongbi = Color.fromRGBO(238, 238, 239, 1);
  var button_woongbi_text = Color.fromRGBO(173, 173, 173, 1);
  var button_jinri = Color.fromRGBO(238, 238, 239, 1);
  var button_jinri_text = Color.fromRGBO(173, 173, 173, 1);
  var button_jayou = Color.fromRGBO(238, 238, 239, 1);
  var button_jayou_text = Color.fromRGBO(173, 173, 173, 1);
  var button_hyowon = Color.fromRGBO(238, 238, 239, 1);
  var button_hyowon_text = Color.fromRGBO(173, 173, 173, 1);
  var button_dest_not_selected = Color.fromRGBO(238, 238, 239, 1);
  var button_dest_not_selected_text = Color.fromRGBO(173, 173, 173, 1);
  var button_dest_selected = Color.fromRGBO(33, 146, 251, 1);
  var button_dest_selected_text = Colors.white;

  var button_not_selected = Color.fromRGBO(118, 118, 128, 0.12);
  var button_selected = Colors.white;
  var button_bank = Colors.white;
  var button_station = Color.fromRGBO(118, 118, 128, 0.12);
  var button_front = Color.fromRGBO(118, 118, 128, 0.12);
  FocusNode textFocus = FocusNode();

  void _notselected() {
    setState(() {
      // user.dest = "웅비관";
      button_woongbi = button_dest_not_selected;
      button_woongbi_text = button_dest_not_selected_text;
      button_jinri = button_dest_not_selected;
      button_jinri_text = button_dest_not_selected_text;
      button_jayou = button_dest_not_selected;
      button_jayou_text = button_dest_not_selected_text;
      button_hyowon = button_dest_not_selected;
      button_hyowon_text = button_dest_not_selected_text;
    });
  }

  void _woongbi() {
    setState(() {
      user.dest = "웅비관";
      button_woongbi = button_dest_selected;
      button_woongbi_text = button_dest_selected_text;
      button_jinri = button_dest_not_selected;
      button_jinri_text = button_dest_not_selected_text;
      button_jayou = button_dest_not_selected;
      button_jayou_text = button_dest_not_selected_text;
      button_hyowon = button_dest_not_selected;
      button_hyowon_text = button_dest_not_selected_text;
      textFocus.unfocus();
    });
  }

  void _jinri() {
    setState(() {
      user.dest = "진리관";
      button_woongbi = button_dest_not_selected;
      button_woongbi_text = button_dest_not_selected_text;
      button_jinri = button_dest_selected;
      button_jinri_text = button_dest_selected_text;
      button_jayou = button_dest_not_selected;
      button_jayou_text = button_dest_not_selected_text;
      button_hyowon = button_dest_not_selected;
      button_hyowon_text = button_dest_not_selected_text;
      textFocus.unfocus();
    });
  }

  void _jayou() {
    setState(() {
      user.dest = "자유관";
      button_woongbi = button_dest_not_selected;
      button_woongbi_text = button_dest_not_selected_text;
      button_jinri = button_dest_not_selected;
      button_jinri_text = button_jinri_text = button_dest_not_selected_text;
      button_jayou = button_dest_selected;
      button_jayou_text = button_dest_selected_text;
      button_hyowon = button_dest_not_selected;
      button_hyowon_text = button_dest_not_selected_text;
      textFocus.unfocus();
    });
  }

  void _hyowon() {
    setState(() {
      user.dest = "효원재";
      button_woongbi = button_dest_not_selected;
      button_woongbi_text = button_dest_not_selected_text;
      button_jinri = button_dest_not_selected;
      button_jinri_text = button_jinri_text = button_dest_not_selected_text;
      button_jayou = button_dest_not_selected;
      button_jayou_text = button_dest_not_selected_text;
      button_hyowon = button_dest_selected;
      button_hyowon_text = button_dest_selected_text;
      textFocus.unfocus();
    });
  }

  void _bankurl() {
    setState(() {
      // url = "http://10.0.2.2:8080/bank";
      button_bank = button_selected;
      button_station = button_not_selected;
      button_front = button_not_selected;
      user.start = "bank";
      textFocus.unfocus();
      // jsonList = fetchInfo(url);
    });
  }

  void _stationurl() {
    setState(() {
      // url = "http://10.0.2.2:8080/station";
      button_bank = button_not_selected;
      button_station = button_selected;
      button_front = button_not_selected;
      // jsonList = fetchInfo(url);
      user.start = "subway";
      textFocus.unfocus();
    });
  }

  void _fronturl() {
    setState(() {
      // url = "http://10.0.2.2:8080/front";
      button_bank = button_not_selected;
      button_station = button_not_selected;
      button_front = button_selected;
      // jsonList = fetchInfo(url);
      user.start = "school";
      textFocus.unfocus();
    });
  }

  // late FixedExtentScrollController _controller;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   _controller = FixedExtentScrollController();
  // }

  // String timeString;
  @override
  Widget build(BuildContext context) {
    double PX = MediaQuery.of(context).size.width / 393; // 요게 픽셀값
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return GestureDetector(
      onTap: () {
        textFocus.unfocus();
      },
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.white),
          // color: Color(0xffF5F5F5),
          child: Padding(
            padding: EdgeInsets.only(top: statusBarHeight),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.dest,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 20.5 * PX,
                      ),
                      Text(
                        "택시팟 생성",
                        style: TextStyle(
                          fontSize: 25 * PX,
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 223.75 * PX,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //   context,
                          //   PageRouteBuilder(
                          //     pageBuilder: (BuildContext context,
                          //         Animation<double> animation1,
                          //         Animation<double> animation2) {
                          //       return TaxiMain(); //변경 필요
                          //     },
                          //     transitionDuration: Duration.zero,
                          //     reverseTransitionDuration: Duration.zero,
                          //   ),
                          // );
                        },
                        child: Image(
                          width: 12.5 * PX,
                          height: 12.5 * PX,
                          image: AssetImage(
                              "assets/images/CreateGroup/Vector-47.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14 * PX,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Divider(color: Color(0xffF7F7F7), thickness: 2.0)),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 2 * PX),
                //   child: Container(
                //     // color: const Color(0xFFF7F7F7).withOpacity(1),
                //     decoration: BoxDecoration(
                //       color: Color.fromRGBO(247, 247, 247, 1),
                //     ),
                //     // color: Color(0xffF7F7F7),
                //     // color: Colors.black,
                //     height: 2 * PX,
                //     width: MediaQuery.of(context).size.width,
                //   ),
                // ),
                SizedBox(
                  height: GetRealHeight(pixel: 16, context: context),
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 26 * PX),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "출발시간",
                          style: TextStyle(
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                        Text("출발시간 30,20,10분전에 알림이 갑니다.")
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 343 * PX,
                      height: 96 * PX,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // am or pm
                          Container(
                            width: 70,
                            child: ListWheelScrollView.useDelegate(
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  AM_PM = value;
                                  // user.time = value;
                                });
                              },
                              itemExtent: 50,
                              perspective: 0.005,
                              diameterRatio: 1.2,
                              physics: FixedExtentScrollPhysics(),
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 2,
                                builder: (context, index) {
                                  if (index == 0) {
                                    return AmPm(
                                      isItAm: true,
                                    );
                                  } else {
                                    return AmPm(
                                      isItAm: false,
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // hours wheel
                          Container(
                            width: 70,
                            child: ListWheelScrollView.useDelegate(
                              onSelectedItemChanged: (value) {
                                setState(
                                  () {
                                    CurrentHour = value;
                                    user.time = value;
                                  },
                                );
                              },
                              // controller: _controller,
                              itemExtent: 50,
                              perspective: 0.005,
                              diameterRatio: 1.2,
                              physics: FixedExtentScrollPhysics(),
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 13,
                                builder: (context, index) {
                                  return MyHours(
                                    hours: index,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          // minutes wheel
                          Container(
                            width: 70,
                            child: ListWheelScrollView.useDelegate(
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  CurrentMinute = value;
                                });
                              },
                              itemExtent: 50,
                              perspective: 0.005,
                              diameterRatio: 1.2,
                              physics: FixedExtentScrollPhysics(),
                              childDelegate: ListWheelChildBuilderDelegate(
                                childCount: 60,
                                builder: (context, index) {
                                  return MyMinutes(
                                    mins: index,
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Container(
                //   width: 343 * PX,
                //   height: 96 * PX,
                //   decoration: BoxDecoration(
                //       color: Colors.amberAccent,
                //       borderRadius: BorderRadius.circular(8 * PX)),
                // ),
                SizedBox(
                  height: 29 * PX,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 26 * PX),
                      child: Text(
                        "도착지",
                        style: TextStyle(
                            fontFamily: "Pretendard",
                            fontWeight: FontWeight.w600,
                            fontSize: 20 * PX),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9 * PX,
                ),
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 28 * PX, right: 15 * PX),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          focusNode: textFocus,
                          controller: TextEditingController(text: user.dest),
                          onChanged: (val) {
                            user.dest = val;
                          },
                          validator: (value) {
                            // 나중에 여따가 email정규식 끼워넣기
                            if (value!.isEmpty) {
                              return "출발지를 정해주세요.";
                            }
                            return "";
                          },
                          style: TextStyle(fontSize: 22, color: Colors.black),
                          decoration: InputDecoration(
                            errorStyle: TextStyle(color: Colors.black),
                            focusedErrorBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            )),
                            hintText: "입력하세요",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(60, 60, 67, 0.6),
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              //     color: Colors.blueAccent,
                              fontSize: 17 * PX,
                            ),
                            //   border: OutlineInputBorder(
                            //       borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 345 * PX, top: 17 * PX),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            user.dest = "";
                          });
                        },
                        child: Image(
                          image: AssetImage(
                              "assets/images/CreateGroup/CreategroupXmark.png"),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14 * PX,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 29 * PX),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _woongbi();
                          });
                        },
                        child: Container(
                          width: 58 * PX,
                          height: 28 * PX,
                          decoration: BoxDecoration(
                              color: button_woongbi,
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(7 * PX)),
                          child: Center(
                              child: Text(
                            "웅비관",
                            style: TextStyle(
                              color: button_woongbi_text,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              fontSize: 13 * PX,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 8 * PX,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _jinri();
                          });
                        },
                        child: Container(
                          width: 58 * PX,
                          height: 28 * PX,
                          decoration: BoxDecoration(
                              color: button_jinri,
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(7 * PX)),
                          child: Center(
                              child: Text(
                            "진리관",
                            style: TextStyle(
                              color: button_jinri_text,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              fontSize: 13 * PX,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 8 * PX,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _jayou();
                          });
                        },
                        child: Container(
                          width: 58 * PX,
                          height: 28 * PX,
                          decoration: BoxDecoration(
                              color: button_jayou,
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(7 * PX)),
                          child: Center(
                              child: Text(
                            "자유관",
                            style: TextStyle(
                              color: button_jayou_text,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w400,
                              fontSize: 13 * PX,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: 8 * PX,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _hyowon();
                          });
                        },
                        child: Container(
                          width: 58 * PX,
                          height: 28 * PX,
                          decoration: BoxDecoration(
                              color: button_hyowon,
                              // color: Colors.black,
                              borderRadius: BorderRadius.circular(7 * PX)),
                          child: Center(
                            child: Text(
                              "효원재",
                              style: TextStyle(
                                color: button_hyowon_text,
                                fontFamily: "Pretendard",
                                fontWeight: FontWeight.w400,
                                fontSize: 13 * PX,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 76 * PX,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 31 * PX),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "출발지",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 20 * PX,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 25 * PX,
                    right: 25 * PX,
                  ),
                  child: Container(
                    height: 32 * PX,
                    width: 343 * PX,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(118, 118, 128, 0.12),
                        borderRadius: BorderRadius.all(Radius.circular(8.0))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _bankurl();
                          },
                          child: Container(
                            height: 28 * PX,
                            width: 113 * PX,
                            child:
                                Stack(children: [Center(child: Text("부산은행"))]),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5 * PX,
                                  color: Color.fromRGBO(0, 0, 0, 0.04),
                                ),
                                color: button_bank,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _stationurl();
                          },
                          child: Container(
                            height: 28 * PX,
                            width: 113 * PX,
                            child:
                                Stack(children: [Center(child: Text("부산대역"))]),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5 * PX,
                                  color: Color.fromRGBO(118, 118, 128, 0.12),
                                ),
                                color: button_station,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _fronturl();
                          },
                          child: Container(
                            height: 28 * PX,
                            width: 113 * PX,
                            child:
                                Stack(children: [Center(child: Text("부산대정문"))]),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5 * PX,
                                  color: Color.fromRGBO(118, 118, 128, 0.12),
                                ),
                                color: button_front,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7.0))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Text(
                //     "${CurrentMinute}${CurrentHour}${AM_PM}${user.dest}${user.start}${(AM_PM * 12 * 60) +
                //         (CurrentHour * 60) +
                //         CurrentMinute}"),
                SizedBox(
                  height: 150 * PX,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20 * PX),
                  child: GestureDetector(
                    onTap: () {
                      final formKeyState = _formKey.currentState!;
                      if (formKeyState.validate()) {
                        formKeyState.save();
                      }
                      user.time = (AM_PM * 12 * 60) +
                          (CurrentHour * 60) +
                          CurrentMinute;
                      user.time >= 1440
                          ? user.time = user.time % 1440
                          : user.time = user.time;
                      print(user.time);
                      save();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 60 * PX,
                      width: 353 * PX,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20 * PX),
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Text(
                          "완료",
                          style: TextStyle(
                              fontSize: 17 * PX,
                              color: Colors.white,
                              fontFamily: "Apple SD Gothic Neo"),
                        ),
                      ),
                    ),
                  ),
                ),
              ], // 이 안에따 넣으셈
              // Container(
              //   height: 7,
              //   // width: 300,
              //   color: const Color(0xFF0E3311).withOpacity(0.5),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
