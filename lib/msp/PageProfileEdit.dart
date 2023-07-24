import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Classes.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:project_cinderella_test3/msp/test/testComponent.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';

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
          Row(
            children: [
              Container(
                margin: RealLTRB(left: 28, top: 26, right: 0, bottom: 0, context: context),
                width: GetRealWidth(pixel: 120, context: context),
                height: GetRealHeight(pixel: 22, context: context),
                child: Text('닉네임', style: SimpleTextStyle(size: 22, weight: FontWeight.w500),)
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  margin: RealLTRB(left: 28, top: 26, right: 0, bottom: 0, context: context),
                  width: GetRealWidth(pixel: 120, context: context),
                  height: GetRealHeight(pixel: 22, context: context),
                  child: Text('성별', style: SimpleTextStyle(size: 22, weight: FontWeight.w500),)
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
              Row(
                children: [
                  Container(
                    margin: RealLTRB(left: 28, top: 26, right: 0, bottom: 0, context: context),
                    width: GetRealWidth(pixel: 120, context: context),
                    height: GetRealHeight(pixel: 22, context: context),
                    child: Text('연령', style: SimpleTextStyle(size: 22, weight: FontWeight.w500),)
                  ),
                  DropdownButtonExample()
                ],
              ),
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
              Container(
                alignment: Alignment.topCenter,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(
                    margin: RealLTRB(left: 0, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("프로필 수정", style: SimpleTextStyle(size: 22, weight: FontWeight.w700))
                ),
              ),
              BoxRequiredAttribute(),
              BoxOptionalAttribute(),
            ],
          ),
        ),
      ),
    );
  }
}