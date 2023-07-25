import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_cinderella_test3/msp/Components/Classes.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/TaxiMainPages/taxi_main.dart';
import 'package:http/http.dart' as http;

const logoutURL = "http://10.0.2.2:8080/memberlogout";

class MypageMyInfo extends StatelessWidget
{
  double myWidth = 393;
  double myHeight = 119;
  Widget myImage = Image.asset("assets/images/Mypage/image_default_myimage.png");
  String myName = "기본";
  String myGender = "남성";


  @override
  Widget build(BuildContext context) {
    return Container(
      width: GetRealWidth(pixel: 393, context: context),
      height: GetRealHeight(pixel: 119, context: context),
      color: colorWhite,
      child: Row(
        children: [
          Container(
            width: GetRealWidth(pixel: 65, context: context),
            height: GetRealHeight(pixel: 65, context: context),
            margin: RealLTRB(left: 33, top: 27, right: 0, bottom: 0, context: context),
            child: myImage,
          ),
          Container(
            margin: RealLTRB(left: 18, top: 34, right: 0, bottom: 0, context: context),
            width: GetRealWidth(pixel: 120, context: context),
            height: GetRealHeight(pixel: 55, context: context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(myName, style: SimpleTextStyle(size: 22, weight: FontWeight.w500),),
                RealSizedBox(width: 0, height: 7),
                Text(myGender, style: SimpleTextStyle(size: 17, color: Color(0xff7F8287)),)
              ],
            ),
          ),
          Container(
            margin: RealLTRB(left: 57, top: 47, right: 0, bottom: 0, context: context),
            width: GetRealWidth(pixel: 70, context: context),
            height: GetRealHeight(pixel: 33, context: context),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
                backgroundColor: Color(0xff222222),
              ),
              onPressed: (){
                final TaxiMainState state = context.findAncestorStateOfType<TaxiMainState>()!;
                state.SetIndex(6);
                },
              child: Text("수정", style: SimpleTextStyle(size: 20, weight: FontWeight.w500, color: Color(0xffF6F5F5)),),
            ),
          )
        ],
      ),
    );
  }
}

class MypageOptionBox extends StatelessWidget
{
  double myWidth = 393;
  double myHeight = 60;
  String optionText = "기본";
  void Function() onTapFunction = (){};

  MypageOptionBox({text,function})
  {
    optionText = text;
    onTapFunction = function ?? (){};
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        color: Colors.white,
        width: GetRealWidth(pixel: myWidth, context: context),
        height: GetRealHeight(pixel: myHeight, context: context),
        child: Container(
          margin: RealLTRB(left: 39, top: 20, right: 0, bottom: 0, context: context),
            child: Text(optionText, style: SimpleTextStyle(size: 19),)
        ),
      ),
    );
  }

}

class TaxiMypage extends StatefulWidget
{

  @override
  State<TaxiMypage> createState() => _TaxiMypageState();
}

class _TaxiMypageState extends State<TaxiMypage> {
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
                    child: Text("마이페이지", style: SimpleTextStyle(size: 22, weight: FontWeight.w700))
                ),
              ),
              MypageMyInfo(),
              MypageOptionBox(text: "차단목록",function: () {
                final TaxiMainState state = context.findAncestorStateOfType<TaxiMainState>()!;
                state.SetIndex(3);
                // Navigator.push(context, MaterialPageRoute(builder: (context) => BlockList()));
                },),
              MypageOptionBox(text: "로그아웃", function: () async {
                final response =  await http.post(Uri.parse(logoutURL),
                headers: {'Cookie' : cookieRecieved,});
                print(response.statusCode);
                if(response.statusCode.isEqual(200) || response.statusCode.isEqual(302))
                  {
                    print("Success!");
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  }
                print('LogOutPressed');
              }),
              MypageOptionBox(text: "회원탈퇴", function: (){
                final TaxiMainState state = context.findAncestorStateOfType<TaxiMainState>()!;
                state.SetIndex(4);
              },),
              MypageOptionBox(text: "고객문의", function: ()  {
                final TaxiMainState state = context.findAncestorStateOfType<TaxiMainState>()!;
                state.SetIndex(5);
              }
              ),
            ],
          ),
        ),
      ),
    );
  }
}