import 'dart:convert';
// import 'package:project_cinderella_test3/roomparse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'MakeList.dart';
import 'package:project_cinderella_test3/TaxiList/MakeList.dart';
import 'package:http/http.dart' as http;
import 'package:project_cinderella_test3/roomparse.dart';
// import 'roomparse.dart';

Future<List> fetchInfo(url) async {
  ///// 이곳은 네트워크 통신을 하여 json을 가져오는 곳입니다 ///////
  // final jsonString = await http.get(Uri.parse(url));

  // if (jsonString.statusCode == 200) {
  //   //만약 서버가 ok응답을 반환하면, json을 파싱합니다
  //   // print('백엔드쪽에서 응답 완료.');
  //   var jsonstring = utf8.decode(jsonString.bodyBytes);
  //   // print(json.decode(jsonString.body));
  //   List<dynamic> jsonMaps = jsonDecode(jsonstring);
  //   List<roomMember> jsonLists =
  //       jsonMaps.map((dynamic item) => roomMember.fromJson(item)).toList();
  //   // List<dynamic> jsonLists = [];
  //   // for (Map<String, dynamic> map in jsonMaps) {
  //   //   roomMember asdf = roomMember.fromJson(map);
  //   //   jsonLists.add(
  //   //       [asdf.host, asdf.start, asdf.dest, asdf.time, asdf.num_of_people]);
  //   // }
  //   return jsonLists;
  //   // return Info.fromJson(json.decode(response.body));
  // } else {
  //   //만약 응답이 ok가 아니면 에러를 던집니다.
  //   throw Exception('몬가 몬가 에러임');
  // }
  //// 혼자 테스트한곳 //////
  String jsonString = await rootBundle.loadString('assets/jsonTest.json');
  // final jsonLists = <Map>[];
  // var responseBody = jsonDecode(jsonString);
  // responseBody.forEach((element) {
  //   jsonLists.add(element);
  // });
  List<dynamic> jsonMaps = jsonDecode(jsonString);
  List<roomMember> jsonLists =
      jsonMaps.map((dynamic item) => roomMember.fromJson(item)).toList();
  // // List<dynamic> jsonLists = [];
  // // for (Map<String, dynamic> map in jsonMaps) {
  // //   roomMember asdf = roomMember.fromJson(map);
  // //   jsonLists
  // //       .add([asdf.host, asdf.start, asdf.dest, asdf.time, asdf.num_of_people]);
  // // }
  return jsonLists;
  //// 여기까지 남겨두기 //////
}

class TaxiList extends StatefulWidget {
  const TaxiList({super.key});

  @override
  State<TaxiList> createState() => _TaxiListState();
}

class _TaxiListState extends State<TaxiList> {
  var button_not_selected = Color.fromRGBO(118, 118, 128, 0.12);
  var button_selected = Colors.white;
  var button_bank = Colors.white;
  var button_station = Color.fromRGBO(118, 118, 128, 0.12);
  var button_front = Color.fromRGBO(118, 118, 128, 0.12);
  String url = "http://10.0.2.2:8080/test"; //초기 받아오는 경로 뒤에 수정해주세요..
  // Future<List>? roominfo = fetchInfo(url);

  @override
  // List<roomMember> roominfo;
  dynamic jsonList;
  dynamic _jsonList;

  @override
  void initState() {
    super.initState();
    jsonList = fetchInfo(url);
    //초기 부산은행 넣어주기 // 여기 나중에 테스트하는거 잊지말기
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _asyncMethod();
    // });
  }

  void _asyncMethod() async {
    _jsonList = await fetchInfo(url);
    setState(() {
      jsonList = _jsonList;
      // if (_jsonList != null) {
      //   jsonList = _jsonList;
      // }
    });
  }

  void _bankurl() async {
    // _jsonList = await fetchInfo(url);
    setState(() {
      url = "http://10.0.2.2:8080/bank";
      button_bank = button_selected;
      button_station = button_not_selected;
      button_front = button_not_selected;
      jsonList = fetchInfo(url);
      // jsonList = _jsonList;
      // if (_jsonList != null) {
      //   jsonList = _jsonList;
      // }
    });
  }

  void _stationurl() async {
    // _jsonList = await fetchInfo(url);
    setState(() {
      url = "http://10.0.2.2:8080/station";
      button_bank = button_not_selected;
      button_station = button_selected;
      button_front = button_not_selected;
      jsonList = fetchInfo(url);
      // jsonList = _jsonList;
      // if (_jsonList != null) {
      //   jsonList = _jsonList;
      // }
    });
  }

  void _fronturl() async {
    // _jsonList = await fetchInfo(url);
    setState(() {
      url = "http://10.0.2.2:8080/front";
      button_bank = button_not_selected;
      button_station = button_not_selected;
      button_front = button_selected;
      // jsonList = _jsonList;
      jsonList = fetchInfo(url);
      // if (_jsonList != null) {
      //   jsonList = _jsonList;
      // }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
        //통신데이터 가져오기
        future: jsonList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildColumn(snapshot);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}에러!!");
            // return buildColumn(snapshot);
          }
          return CircularProgressIndicator();
          // return buildColumn(snapshot);
        },
      ),
    ));
  }

  Widget buildColumn(snapshot) {
    double PX = MediaQuery.of(context).size.width / 393; // 요게 픽셀값
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF5F5F5),
        child: Padding(
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                  "padding :  ${MediaQuery.of(context).padding.top} NOWPX : ${PX}"),
              Text("${url}"),
              Stack(
                //최상위 위젯 표현
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: 14 * PX, left: 20 * PX),
                      child: Text(
                        "마이 택시팟",
                        style: TextStyle(
                          fontFamily: "Pretendard", //우선 주희님 용으로 폰트삭제
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                        ), // 후에 폰트 추가좀
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        //여기 정렬 해주는걸 목표로 하기.
                        top: 20 * PX,
                        right: 20 * PX,
                      ),
                      child: GestureDetector(
                        // 이게 답이였구나 이걸로 만들면 정렬하기 편할듯
                        onTap: () {
                          print("추가 버튼 눌림.");
                        },
                        child: Text(
                          //중앙정렬좀 해주기
                          "추가",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12 * PX,
              ),
              Container(
                height: 32 * PX,
                width: 343 * PX,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(118, 118, 128, 0.12),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Padding(
                  padding: EdgeInsets.all(2 * PX),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _bankurl();
                          },
                          child: Container(
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
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _stationurl();
                          },
                          child: Container(
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
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            _fronturl();
                          },
                          child: Container(
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
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20 * PX,
              ),
              Text("${snapshot.data}"),
              // Text("${runtimeType(snapshot)}"),
              // Text("${jsonList?[1].dest}"),
              for (roomMember inlsts in snapshot.data) ...[
                Makelist(inlsts),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
