import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Components/Classes.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';

class ServiceQuitPage extends StatefulWidget
{

  @override
  State<ServiceQuitPage> createState() => _ServiceQuitPageState();
}

class _ServiceQuitPageState extends State<ServiceQuitPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Colors.white,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              RealSizedBox(width: 0, height: GetStatusBarHeight(context: context)),
              Container(
                alignment: Alignment.topLeft,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("회원탈퇴", style: SimpleTextStyle(size: 22, weight: FontWeight.w700))
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("탈퇴 전, 아래의 사항을 꼭 확인해주세요.", style: SimpleTextStyle(size: 17, weight: FontWeight.w400, color: Color(0xFF7F8287)))
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: GetRealHeight(pixel: 200, context: context),
                child: Container(
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("참여 중인 택시팟이 있을 경우, 탈퇴가 제한됩니다.\n닉네임, 회원정보 등 데이터는 삭제되며, 복구 할 수 없 습니다.\n탈퇴 시 신데렐라 서비스 이용에 제한이 생깁니다.", style: SimpleTextStyle(size: 17.5, weight: FontWeight.w400))
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(

                    child: Text("그동안 신데렐라를 이용해 주셔서 감사합니다.", style: SimpleTextStyle(size: 19, weight: FontWeight.w400))
                ),
              ),
              BasicButton(width: 280, height: 45, text: "탈퇴하기", 
                buttonStyle: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                  side: BorderSide(color: Colors.black, width: 1.4,),
                  backgroundColor: Color(0xFF222222),
              ),
                textStyle: SimpleTextStyle(size: 20, weight: FontWeight.w500, color: Color(0xFFF6F5F5)),
                func: (){
                print('탈퇴하는 함수');
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()) );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}