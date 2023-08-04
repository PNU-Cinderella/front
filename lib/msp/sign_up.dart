import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';
import 'package:project_cinderella_test3/msp/TaxiMainPages/taxi_main.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/Components/Classes.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:http/http.dart' as http;

const SignUpURL = "http://10.0.2.2:8080/signup";
const ChatRoomURL = "http://10.0.2.2:8080/chatroom";

UserActive userActive = new UserActive(userName: "", userGender: "");

Future createData(String nickName, String gender, BuildContext context) async {
  if (nickName == '' && gender == '')
  {
    MakeToast(msg: "닉네임과 성별을 선택해주세요!");
    throw Exception('닉네임과 성별 오류');
  }
  else if(gender == '')
    {
      MakeToast(msg: "성별을 선택해주세요!");
      throw Exception('성별 오류');
    }
  else if (nickName == '')
  {
    MakeToast(msg: "닉네임을 입력해주세요!");
    throw Exception('닉네임 오류');
  }
  else
    {
      Map data = {'name': nickName, 'gender': gender};
      final response = await http.put(
        Uri.parse(SignUpURL),
        headers: {
          'Content-Type': 'application/json',
          'Cookie' : cookieRecieved,
        },
        body: json.encode(data),
      );
      print(response.statusCode);
      if (response.statusCode == 201 || response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => TaxiMain()) );
        userActive.userName = nickName;
        userActive.userGender = gender;
        MakeToast(msg: "SetData Success!");
      } else
      {
        MakeToast(msg: nickName + " " + gender + " Failed!");
        throw Exception('Failed to create Data.');
      }
    }
}

class GenderButton extends StatefulWidget
{
  double width = 50;
  double height = 50;
  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: colorWhite,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
  );
  void Function() buttonFunction = (){};
  String buttonText = "기본";
  TextStyle textStyle = SimpleTextStyle(size: 14, weight: FontWeight.w400);

  GenderButton({required double this.width, required double this.height, ButtonStyle? style, void Function()? function, required String this.buttonText, TextStyle? textStyle})
  {
    if(style != null)
      {
        buttonStyle = style;
      }
    if(function != null)
      {
        this.buttonFunction = function;
      }
    if(textStyle != null)
      {
        this.textStyle = textStyle;
      }
  }

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: GetRealWidth(pixel: widget.width, context: context),
      height: GetRealHeight(pixel: widget.height, context: context),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
            widget.buttonFunction;
          });
        },
        style: isSelected ? ElevatedButton.styleFrom(
          backgroundColor: Color(0xff484848),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ) : widget.buttonStyle,
        child: Text(widget.buttonText,
            style: isSelected ? SimpleTextStyle(size: 14, weight: FontWeight.w400, color: colorWhite) : widget.textStyle,
        ),
      ),
    );
  }
}

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String userName = "";
  String gender = "MALE";

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
              Container(
                margin: EdgeInsets.only(top: GetRealHeight(pixel: 42, context: context), left: GetRealWidth(pixel: 15, context: context)),
                child: Row(
                    children: [
                      Text(
                        "회원가입",
                        style: SimpleTextStyle(size: 22, weight: FontWeight.w600),
                      ),
                    ]
                ),
              ),
              Container(
                  margin: RealLTRB(left: 0, top: 34, right: 0, bottom: 0, context: context),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Padding(
                          padding: RealLTRB(left: 19, top: 0, right: 0, bottom: 0, context: context),
                          child: Text(
                            "닉네임",
                            style: SimpleTextStyle(size: 17, weight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: RealLTRB(left: 16, top: 21, right: 0, bottom: 0, context: context),
                          child: TextField(
                            onSubmitted: (text){
                              userName = text;
                            },
                            style: SimpleTextStyle(size: 20, weight: FontWeight.w600),
                            decoration: const InputDecoration(
                                enabledBorder: UnderlineInputBorder(),
                              suffixIcon: Icon(Icons.cancel)
                            ),
                          ),
                        ),
                        Padding(
                          padding: RealLTRB(left: 19, top: 48, right: 0, bottom: 0, context: context),
                          child: Text(
                            "성별",
                            style: SimpleTextStyle(size: 17, weight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: RealLTRB(left: 15, top: 10, right: 0, bottom: 0, context: context),
                          child: Row(
                            children: [
                              GenderButton(width: 68.18, height: 40, buttonText: "남성", function: (){gender = "MALE";MakeToast(msg: gender);},),
                              RealSizedBox(width : 13.64, height: 0,),
                              GenderButton(width: 68.18, height: 40, buttonText: "여성", function: (){gender = "FEMALE";MakeToast(msg: gender);}),
                            ],
                          ),
                        )
                      ]
                  )
              ),
              SizedBox(height: GetRealHeight(pixel: 416, context: context),),
              Container(
                width: 290,
                height: 53,
                child: OutlinedButton(
                  onPressed: () {
                    createData(userName,gender,context);
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: colorDarkGray,
                    side: BorderSide(color: colorDarkGray, width: 1.4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text("완료", style: textstyleLoginButtonInvert),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
