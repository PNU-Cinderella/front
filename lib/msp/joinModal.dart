import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        body: const JoinModalFirst(),
      ),
    );
  }
}

class JoinModalFirst extends StatelessWidget {
  const JoinModalFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: GetRealHeight(pixel: 575, context: context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(0)
                ),
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 16, context: context), GetRealHeight(pixel: 22, context: context), 0, 0),
                                child:
                                Row(
                                    children: [
                                      Image.asset("assets/images/JoinModal/icon_left.png"),
                                      SizedBox(width: GetRealWidth(pixel: 130, context: context),),
                                      Text("참여하기", style: textstyleBoxHeader,),
                                      SizedBox(width: GetRealWidth(pixel: 122, context: context),),
                                      Image.asset("assets/images/JoinModal/icon_x.png"),
                                    ]
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 39, context: context), GetRealHeight(pixel: 50, context: context), 0, 0),
                                child:
                                Row(
                                    children: [
                                      Text("부산은행 앞", style: SimpleTextStyle(size: 19, weight: FontWeight.w600, color: colorDarkBlue),),
                                      SizedBox(width: GetRealWidth(pixel: 113, context: context),),
                                      Text("am 02시 30분", style: SimpleTextStyle(size: 19, weight: FontWeight.w600),),
                                    ]
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 38, context: context), GetRealHeight(pixel: 37, context: context), 0, 0),
                                child:
                                Row(
                                    children: [
                                      Text("동승자의 경유지를 확인해주세요", style: SimpleTextStyle(size: 17, weight: FontWeight.w600),),
                                    ]
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 37, context: context), GetRealHeight(pixel: 30, context: context), 0, 0),
                                child:
                                Row(
                                    children: [
                                      Text("1   명륜역", style: SimpleTextStyle(size: 17),),
                                    ]
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.fromLTRB(0, 0, 0,GetRealHeight(pixel: 62, context: context)),
                        child:
                        ElevatedButton(
                          child: Text("참여하기"),
                          onPressed: () => Navigator.push(context,
                              ModalBottomSheetRoute(builder: (context) => JoinModalSecond(), isScrollControlled: false)),
                        )
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class JoinModalSecond extends StatelessWidget {
  const JoinModalSecond({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetRealHeight(pixel: 575, context: context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0)
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 16, context: context), GetRealHeight(pixel: 22, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Image.asset("assets/images/JoinModal/icon_left.png"),
                        SizedBox(width: GetRealWidth(pixel: 130, context: context),),
                        Text("참여하기", style: textstyleBoxHeader,),
                        SizedBox(width: GetRealWidth(pixel: 122, context: context),),
                        Image.asset("assets/images/JoinModal/icon_x.png"),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 30, context: context), GetRealHeight(pixel: 45, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Text("본인의 목적지를 입력해주세요", style: SimpleTextStyle(size: 17, weight: FontWeight.w600, color: colorBlack),),
                      ]
                  ),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 30, context: context), GetRealHeight(pixel: 45, context: context), 0, 0),
                    width: GetRealWidth(pixel: 333, context: context),
                    height: GetRealHeight(pixel: 49, context: context),
                    child:
                    TextField(
                      decoration: InputDecoration(
                          hintText: "목적지 입력"
                      ),
                    )
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 54, context: context), GetRealHeight(pixel: 14, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Text("택시팟에 무단으로 나오지 않거나, 비매너 행동을 하면\n 사용자의 신고로 인해 앱 사용이 제한될 수 있습니다.", style: SimpleTextStyle(size: 13, weight: FontWeight.w400, color: Color(0xff5C5050)),),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 54, context: context), GetRealHeight(pixel: 14, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        ElevatedButton(
                          child: const Text('이전'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        ElevatedButton(
                          child: const Text('다음'),
                          onPressed: () => Navigator.push(context,
                              ModalBottomSheetRoute(builder: (context) => JoinModalThird(), isScrollControlled: false)),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class JoinModalThird extends StatelessWidget {
  const JoinModalThird({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GetRealHeight(pixel: 575, context: context),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0)
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 16, context: context), GetRealHeight(pixel: 22, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        Image.asset("assets/images/JoinModal/icon_left.png"),
                        SizedBox(width: GetRealWidth(pixel: 99, context: context),),
                        Text("알림 및 유의사항", style: textstyleBoxHeader,),
                        SizedBox(width: GetRealWidth(pixel: 92, context: context),),
                        Image.asset("assets/images/JoinModal/icon_x.png"),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 30, context: context), GetRealHeight(pixel: 45, context: context), 0, 0),
                  child:
                  Column(
                    children: [
                      Row(
                          children: [
                            Text("유의사항", style: SimpleTextStyle(size: 17, weight: FontWeight.w600, color: colorBlack),),
                          ]
                      ),
                      SizedBox(height: GetRealHeight(pixel: 18, context: context),),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: GetRealWidth(pixel: 330, context: context),
                                height: GetRealHeight(pixel: 54, context: context),
                                decoration: BoxDecoration(
                                    color: Color(0xff2192FB),
                                    borderRadius: BorderRadius.circular(24)
                                ),
                                child: Text("시간을 준수해 주세요", style: SimpleTextStyle(size: 19, weight: FontWeight.w600, color: Colors.white),)),
                          ]
                      ),
                      SizedBox(height: GetRealHeight(pixel: 16, context: context),),
                      Row(
                          children: [
                            Container(
                                width: GetRealWidth(pixel: 330, context: context),
                                height: GetRealHeight(pixel: 127, context: context),
                                decoration: BoxDecoration(
                                    color: Color(0xff2192FB),
                                    borderRadius: BorderRadius.circular(24)
                                ),
                                child: Text("지각이나 잠수등의 비매너 행동은\n동승자로 인해 신고당할 수 있으며\n앱 사용이 제한 될 수 있음에 동의\n합니다", style: SimpleTextStyle(size: 19, weight: FontWeight.w600, color: Colors.white),)),
                          ]
                      ),
                      SizedBox(height: GetRealHeight(pixel: 73, context: context),),
                      Row(
                          children: [
                            Text("출발 30분 전 알림을 받아요", style: SimpleTextStyle(size: 17, weight: FontWeight.w400, color: colorBlack),),

                          ]
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(GetRealWidth(pixel: 54, context: context), GetRealHeight(pixel: 14, context: context), 0, 0),
                  child:
                  Row(
                      children: [
                        ElevatedButton(
                          child: const Text('이전'),
                          onPressed: () => Navigator.pop(context),
                        ),
                        ElevatedButton(
                          child: const Text('다음'),
                          onPressed: () => Navigator.push(context,
                              ModalBottomSheetRoute(builder: (context) => JoinModalThird(), isScrollControlled: false)),
                        ),
                      ]
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}