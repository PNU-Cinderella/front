import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';

class LoginButton extends StatelessWidget
{
  BuildContext? myContext;
  double? myWidth;
  double? myHeight;
  Function? funcOnPressed;
  ButtonStyle? myButtonStyle = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
  side: BorderSide(color: colorDarkGray, width: 1.4)
  );
  late Widget myIcon;
  late Widget myText;

  LoginButton(BuildContext? context, double? width, double? height, Widget icon, Widget text){
    myContext = context;
    myWidth = width;
    myHeight = height;
    myIcon = icon;
    myText = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      child: OutlinedButton.icon(
        onPressed: ()
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
          print("object");
        },
        style: myButtonStyle,
        icon: myIcon,
        label: myText,
      ),
    );
  }

}


class LoginPage extends StatelessWidget {
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
              SizedBox(height: 85),
              rowLoginPageSub,
              // SizedBox(height: 98),
              SizedBox(height: 192.38),
              // rowLoginLogoSub,
              textLogoShadow,
              textLogoMain,
              SizedBox(height: 150.58,),
              LoginButton(context, 249, 53,
                  Image.asset("assets/images/icon_google_black.png"),
                  Text("구글로 로그인", style: textstyleLoginButton)
              ),
              SizedBox(height: 31,),
              LoginButton(context, 249, 53,
                  Image.asset("assets/images/icon_apple_black.png"),
                  Text("애플로 로그인", style: textstyleLoginButton)
                  )
            ],
          ),
        ),
      ),
    );
  }
}
