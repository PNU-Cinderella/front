import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Classes.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';

class MypageMyInfo extends StatelessWidget
{
  Widget myImage = Image.asset("assets/images/Mypage/image_default_myimage.png");
  String myName = "기본";
  String myGender = "남성";


  @override
  Widget build(BuildContext context) {
    return Container(
      width: GetRealWidth(pixel: 393, context: context),
      height: GetRealHeight(pixel: 119, context: context),
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
              children: [
                Text(myName, style: SimpleTextStyle(size: 22, weight: FontWeight.w500),),
                RealSizedBox(width: 0, height: 7),
                Text(myGender, style: SimpleTextStyle(size: 17, color: Color(0xff7F8287)),)
              ],
            ),
          ),
          Container(
            margin: RealLTRB(left: 57, top: 47, right: 0, bottom: 0, context: context),
            width: 70,
            height: 33,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
                backgroundColor: Color(0xff222222),
              ),
              onPressed: (){},
              child: Text("수정", style: SimpleTextStyle(size: 20, weight: FontWeight.w500, color: Color(0xffF6F5F5)),),
            ),
          )
        ],
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
          color: colorBackground,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              RealSizedBox(width: 0, height: GetStatusBarHeight(context: context)),
              MypageMyInfo(),
            ],
          ),
        ),
      ),
    );
  }
}