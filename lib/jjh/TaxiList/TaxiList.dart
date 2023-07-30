import 'dart:convert';

// import 'package:project_cinderella_test3/roomparse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';
import 'package:project_cinderella_test3/msp/Http/HttpHelper.dart';
import 'package:project_cinderella_test3/msp/TaxiMainPages/joinModal.dart';

// import 'MakeList.dart';
import '../../msp/login.dart';
import '../../msp/TaxiMainPages/taxi_history.dart';
import 'CreateGroup.dart';
import 'MakeList.dart';
import 'package:http/http.dart' as http;
import '../../roomparse.dart';
// import 'roomparse.dart';
import 'package:fluttertoast/fluttertoast.dart';



Future<List> fetchInfo(url) async {
  
  /// 이곳은 네트워크 통신을 하여 json을 가져오는 곳입니다 ///////
  final jsonString = await http.get(Uri.parse(url),headers: {'Content-Type': 'application/json',
      'Cookie' : cookieRecieved},);
  if (jsonString.statusCode == 200) {
    //만약 서버가 ok응답을 반환하면, json을 파싱합니다
    // print('백엔드쪽에서 응답 완료.');
    var jsonstring = utf8.decode(jsonString.bodyBytes);
    // print(json.decode(jsonString.body));
    List<dynamic> jsonMaps = jsonDecode(jsonstring);
    List<roomMember> jsonLists =
        jsonMaps.map((dynamic item) => roomMember.fromJson(item)).toList();
    return jsonLists;
    // return Info.fromJson(json.decode(response.body));
  } else {
    //만약 응답이 ok가 아니면 에러를 던집니다.
    throw Exception('몬가 몬가 에러임');
  }
  //// 혼자 테스트한곳 //////
  // String jsonString = await rootBundle.loadString('assets/jsonTest.json');
  // List<dynamic> jsonMaps = jsonDecode(jsonString);
  // List<roomMember> jsonLists =
  //     jsonMaps.map((dynamic item) => roomMember.fromJson(item)).toList();
  // return jsonLists;
  //// 여기까지 남겨두기 //////
}

class TaxiList extends StatefulWidget {
  const TaxiList({super.key});

  @override
  State<TaxiList> createState() => _TaxiListState();
}

class _TaxiListState extends State<TaxiList> {
  // 여기가 네비게이션 바 /////
  // int _selectedIndex = 0;

  // final List<Widget> _widgetOptions = <Widget>[
  //   TaxiHistory(),
  //   TaxiList(),
  //   CreateGroup()
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  /// 네비게이션 바 끝  //////
  /// 
  

  var button_not_selected = Color.fromRGBO(118, 118, 128, 0.12);
  var button_selected = Colors.white;
  var button_bank = Colors.white;
  var button_station = Color.fromRGBO(118, 118, 128, 0.12);
  var button_front = Color.fromRGBO(118, 118, 128, 0.12);
  String url = "http://10.0.2.2:8080/chatlist/bank";
  late FToast fToast; //// 플러터 토스트 ////

  @override
  dynamic jsonList;
  dynamic _jsonList;

  @override
  void initState() {
    super.initState();
    jsonList = fetchInfo(url);
    fToast = FToast(); //// 플러터 토스트 ////
    fToast.init(context); //// 플러터 토스트 ////
  }

  void _bankurl() {
    setState(() {
      url = "http://10.0.2.2:8080/chatlist/bank";
      button_bank = button_selected;
      button_station = button_not_selected;
      button_front = button_not_selected;
      jsonList = fetchInfo(url);
    });
  }

  void _stationurl() {
    setState(() {
      url = "http://10.0.2.2:8080/chatlist/subway";
      button_bank = button_not_selected;
      button_station = button_selected;
      button_front = button_not_selected;
      jsonList = fetchInfo(url);
    });
  }

  void _fronturl() {
    setState(() {
      url = "http://10.0.2.2:8080/chatlist/school";
      button_bank = button_not_selected;
      button_station = button_not_selected;
      button_front = button_selected;
      jsonList = fetchInfo(url);
    });
  }

  void ShowToast() {
    fToast.showToast(
      positionedToastBuilder: (context, child) {
        return Positioned(
          child: child,
          top: GetRealHeight(pixel: 212, context: context),
          left: GetRealWidth(pixel: 20, context: context),
          // left: 16.0,
        );
      },
      toastDuration: Duration(milliseconds: 3000),
      child: (
        //// 만들어졌을때 컨테이너 ////
        Container(
        width: GetRealWidth(pixel: 354, context: context),
        height: GetRealHeight(pixel: 47, context: context),
        // padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 40.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromRGBO(13, 154, 255, 0.8),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: GetRealWidth(pixel: 14, context: context),
            ),
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22), color: Colors.white),
              child: Center(
                child:
                    Image(image: AssetImage("assets/images/TaxiList/Tick.png")),
              ),
            ),
            SizedBox(width: GetRealWidth(pixel: 10, context: context)),
            Text(
              "택시팟을 생성했어요.",
              style: SimpleTextStyle(
                  size: 16,
                  color: Color.fromRGBO(245, 245, 245, 1),
                  weight: FontWeight.w500),
            ),
            SizedBox(
              width: GetRealWidth(pixel: 108, context: context),
            ),
            TextButton(
              onPressed: () {
                fToast.removeCustomToast();
                // print("눌림");
              },
              child: Text(
                "확인",
                style: SimpleTextStyle(
                    size: 16, color: Colors.white, weight: FontWeight.w600),
              ),
            )
          ],
        ),
      )
      //// 이거 다른거임 ////
      // Container(
      //   width: GetRealWidth(pixel: 354, context: context),
      //   height: GetRealHeight(pixel: 47, context: context),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10.0),
      //     color: Color.fromRGBO(207, 4, 4, 0.8),
      //   ),
      //   child: Row(
      //     // mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       SizedBox(
      //         width: GetRealWidth(pixel: 14, context: context),
      //       ),
      //       Image(image: AssetImage("assets/images/TaxiList/xmark_Taxi.png")),
      //       // Container(
      //       //   width: 22,
      //       //   height: 22,
      //       //   decoration: BoxDecoration(
      //       //       borderRadius: BorderRadius.circular(22), color: Colors.white),
      //       //   child: Center(
      //       //     child:
      //       //         Image(image: AssetImage("assets/images/TaxiList/xmark_Taxi.png")),
      //       //   ),
      //       // ),
      //       SizedBox(width: GetRealWidth(pixel: 10, context: context)),
      //       Text(
      //         "이미 참여 중인 택시팟이 있어요.",
      //         style: SimpleTextStyle(
      //             size: 16,
      //             color: Color.fromRGBO(245, 245, 245, 1),
      //             weight: FontWeight.w500),
      //       ),
      //       SizedBox(
      //         width: GetRealWidth(pixel: 48, context: context),
      //       ),
      //       TextButton(
      //         onPressed: () {
      //           fToast.removeCustomToast();
      //           // print("눌림");
      //         },
      //         child: Text(
      //           "확인",
      //           style: SimpleTextStyle(
      //               size: 16, color: Colors.white, weight: FontWeight.w600),
      //         ),
      //       )
      //     ],
      //   ),
      // )
      ///// 여까지 ////
      ),
    );
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
        color: Color.fromRGBO(253, 253, 253, 0.3),
        child: Padding(
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: GetRealHeight(pixel: 10, context: context),
                        left: GetRealWidth(pixel: 20, context: context)),
                    child: Text(
                      "택시팟 목록",
                      style: TextStyle(
                        fontFamily: "Pretendard", //우선 주희님 용으로 폰트삭제
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                      ), // 후에 폰트 추가좀 이거 왜 폰트적용안됨?
                    ),
                  ),
                  SizedBox(
                    width: GetRealWidth(pixel: 223, context: context),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          //여기 정렬 해주는걸 목표로 하기.
                          top: GetRealHeight(pixel: 24, context: context),
                          // right: 20 * PX,
                        ),
                        child: GestureDetector(
                          // 이게 답이였구나 이걸로 만들면 정렬하기 편할듯
                          onTap: () {
                            CheckUserParticipate(URL: URL_CHECK_PARTICIPATE);
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) {
                                  return CreateGroup(); //변경 필요
                                },
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                            ).then((value) {
                              ShowToast();
                              _bankurl();
                            });
                          },
                          child: Image(
                            image:
                                AssetImage("assets/images/TaxiList/Plus.png"),
                            //중앙정렬좀 해주기
                          ),
                        ),
                      ),
                      Text(
                        "create",
                        style: TextStyle(
                          fontFamily: "Pretendard",
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color.fromRGBO(149, 142, 142, 1),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: GetRealHeight(pixel: 2, context: context),
                color: Color.fromRGBO(247, 247, 247, 1),
              ),

              SizedBox(
                height: 13 * PX,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      // top: 13 * PX,
                      left: GetRealWidth(pixel: 27, context: context),
                    ),
                    child: Text(
                      "출발지",
                      style: TextStyle(
                        fontFamily: "Pretendard",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: GetRealHeight(pixel: 8, context: context),
              ),
              Container(
                height: GetRealHeight(pixel: 32, context: context),
                width: GetRealWidth(pixel: 343, context: context),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(118, 118, 128, 0.12),
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Padding(
                  padding: EdgeInsets.all(2),
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
                height: GetRealHeight(pixel: 10, context: context),
              ),
              (snapshot.data.length == 0)
                  ? Center(
                      child: Text(
                      "아직 방이 없어요ㅜ",
                      style: SimpleTextStyle(size: 30, color: Colors.grey),
                    ))
                  : Expanded(
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 0),
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                JoinModalFirst();
                                print(index);
                              },
                              child: Makelist(
                                  snapshot.data[index],
                                  GetRealHeight(pixel: 1, context: context),
                                  GetRealWidth(pixel: 1, context: context)),
                            );
                          }),
                    ),
              // Text("${snapshot.data}"),
              // Text("${GetRealHeight(pixel: 13, context: context)}"),
              // Text("${runtimeType(snapshot)}"),
              // Text("${jsonList?[1].dest}"),
              // Container(
              //     child: (snapshot.data == null)
              //         ? Text(
              //             "아직 방이 없어요 ㅠㅠ",
              //             style: SimpleTextStyle(size: 30, color: Colors.grey),
              //           )
              //         : Container()),

              // for (roomMember inlsts in snapshot.data) ...[
              //   GestureDetector(
              //     onTap: () {
              //       print("클릭방");
              //     },
              //     child: Makelist(
              //         inlsts,
              //         GetRealHeight(pixel: 1, context: context),
              //         GetRealWidth(pixel: 1, context: context)),
              //   ),
              // ],
            ],
          ),
        ),
      ),
    );
  }
}
