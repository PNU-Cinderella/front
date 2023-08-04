import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Components/Classes.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';
import 'package:project_cinderella_test3/msp/TaxiMainPages/taxi_main.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';
import 'package:project_cinderella_test3/msp/test/testComponent.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';

TextEditingController controller_userName = TextEditingController();

class BoxRequiredAttribute extends StatelessWidget
{
  double myWidth = 393;
  double myHeight = 290;
  Widget userImage = Image.asset("assets/images/Mypage/image_default_myimage.png");
  String userName = "기본";

  BoxRequiredAttribute({image, name}){
    userName = name ?? "기본값";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: GetRealWidth(pixel: myWidth, context: context),
      height: GetRealHeight(pixel: myHeight, context: context),
      child: Column(
        children: [
          Container(
            width: GetRealWidth(pixel: 70, context: context),
            height: GetRealHeight(pixel: 70, context: context),
            margin: RealLTRB(left: 0, top: 13, right: 0, bottom: 0, context: context),
            child: userImage,
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: RealLTRB(left: 28, top: 26, right: 0, bottom: 0, context: context),
                  height: GetRealHeight(pixel: 22, context: context),
                  child: Text('닉네임', style: SimpleTextStyle(size: 22, weight: FontWeight.w500),)
                ),
                Container(
                  margin: RealLTRB(left: 30, top: 21, right: 0, bottom: 0, context: context),
                  width: GetRealWidth(pixel: 120, context: context),
                  height: GetRealHeight(pixel: 30, context: context),
                  child: TextField(
                    controller: controller_userName,
                    onSubmitted: (text){
                      userName = text;
                    },
                    style: SimpleTextStyle(size: 20, weight: FontWeight.w600),
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder()
                    ),
                  ),
                ),
                Container(
                  padding: RealLTRB(left: 20, top: 10, right: 0, bottom: 0, context: context),
                  child: BasicButton(width: 87, height: 28, text: '중복확인',textStyle: SimpleTextStyle(size: 15, color: Color(0xFFAEAEAE), ),
                    buttonStyle: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xFFFFFFFF),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        side: BorderSide(color: Color(0xFFAEAEAE), width: 1)
                    ),
                    func: (){MakeToast(msg: "OK!");},),
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  margin: RealLTRB(left: 28, top: 26, right: 0, bottom: 0, context: context),
                  height: GetRealHeight(pixel: 22, context: context),
                  child: Text('성별', style: SimpleTextStyle(size: 22, weight: FontWeight.w500),)
              ),
              Container(
                padding: RealLTRB(left: 44, top: 20, right: 0, bottom: 0, context: context),
                child: Row(
                  children: [
                    Container(
                      padding: RealLTRB(left: 0, top: 10, right: 0, bottom: 0, context: context),
                      child: BasicButton(width: 60, height: 30, text: '남성',textStyle: SimpleTextStyle(size: 17.5, color: Color(0xFFFFFFFF), ),
                        buttonStyle: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFFAEAEAE),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                            side: BorderSide(color: Color(0xFFFFFFFF), width: 1)
                        ),
                        func: (){},),
                    ),
                    RealSizedBox(width: 22, height: 0),
                    Container(
                      padding: RealLTRB(left: 0, top: 10, right: 0, bottom: 0, context: context),
                      child: BasicButton(width: 60, height: 30, text: '여성',textStyle: SimpleTextStyle(size: 17.5, color: Color(0xFFAEAEAE), ),
                        buttonStyle: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                            side: BorderSide(color: Color(0xFFAEAEAE), width: 1)
                        ),
                        func: (){},),
                    ),
                  ],
                ),
              ),
              ],
          ),
        ],
      ),
    );
  }
}class BoxOptionalAttribute extends StatelessWidget
{
  double myWidth = 393;
  double myHeight = 290;


   List<String> ageList = <String>['2004', '2003', '2002', '2001','2000','1999','1998','1997' ];
   List<String> residenceList = <String>['자취', '통학', '기숙사', '기타'];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: GetRealWidth(pixel: myWidth, context: context),
      height: GetRealHeight(pixel: myHeight, context: context),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: RealLTRB(left: 28, top: 26, right: 0, bottom: 0, context: context),
                width: GetRealWidth(pixel: 120, context: context),
                height: GetRealHeight(pixel: 22, context: context),
                child: Text('연령', style: SimpleTextStyle(size: 22, weight: FontWeight.w500),)
              ),
              DropdownButtonExample(),
            ],
          ),
          Row(
            children: [
              Container(
                  margin: RealLTRB(left: 28, top: 26, right: 0, bottom: 0, context: context),
                  width: GetRealWidth(pixel: 120, context: context),
                  height: GetRealHeight(pixel: 22, context: context),
                  child: Text('거주', style: SimpleTextStyle(size: 22, weight: FontWeight.w500),)
              ),
              DropdownButtonExample(),
            ],
          ),
        ],
      ),
    );
  }
}

class PageProfileEdit extends StatefulWidget
{

  @override
  State<PageProfileEdit> createState() => _PageProfileEditState();
}

class _PageProfileEditState extends State<PageProfileEdit> {
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
              Row(
                children: [
                  Container(
                  alignment: Alignment.topRight,
                  height: GetRealHeight(pixel: 70, context: context),
                  child: Container(
                    margin: RealLTRB(left: 0, top: 25, right: 0, bottom: 0, context: context),
                    child: Button_Back(),
                  ),
                ),
                  Container(
                    alignment: Alignment.topCenter,
                    height: GetRealHeight(pixel: 70, context: context),
                    child: Container(
                        margin: RealLTRB(left: 100, top: 33, right: 0, bottom: 0, context: context),
                        child: Text("프로필 수정", style: SimpleTextStyle(size: 22, weight: FontWeight.w700))
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    height: GetRealHeight(pixel: 70, context: context),
                    child: Container(
                      margin: RealLTRB(left: 100, top: 33, right: 0, bottom: 0, context: context),
                      child: GestureDetector
                        (
                        child: Text("저장", style: SimpleTextStyle(size: 20, weight: FontWeight.w600)),
                        onTap: (){
                          userActive.userName = controller_userName.text;
                          print('저장하는 함수 실행');
                          // userActive.userName =
                          }
                        ,
                      ),
                    ),
                  ),
                ],
              ),
              BoxRequiredAttribute(),
              // BoxOptionalAttribute(),
            ],
          ),
        ),
      ),
    );
  }
}