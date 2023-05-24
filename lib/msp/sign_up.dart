import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/CreateGroup.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/MakeList.dart';
import 'package:project_cinderella_test3/msp/Classes.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpButton extends BasicButton
{
  @override
  Widget build(BuildContext context)
  {
    return super.build(context);
  }

}

class SignUp extends StatelessWidget {

  final String userName = "Default";
  final bool isMan = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: colorBackground,
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              // SizedBox(height : 89),
              boxSingupTitle,
              boxSignup,
              SizedBox(height: 416,),
              Container(
                width: 290,
                height: 53,
                child: OutlinedButton(
                  onPressed: () {

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => TaxiHistory()) );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CreateGroup()) );
                    // launchUrl(Uri.parse('http://10.0.2.2.nip.io:8080/oauth2/authorization/google'));
                    MakeToast(msg: userName + " " + isMan.toString() + "Send!");
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
