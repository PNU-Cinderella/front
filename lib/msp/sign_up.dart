import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/taxi_history.dart';
import 'package:project_cinderella_test3/msp/Classes.dart';
=======
import '../jjh/TaxiList/CreateGroup.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import '../jjh/TaxiList/MakeList.dart';
import 'package:project_cinderella_test3/msp/Classes.dart';
// import 'package:url_launcher/url_launcher.dart';
>>>>>>> Stashed changes

class SignUpButton extends BasicButton {
  @override
  Widget build(BuildContext context) {
    return super.build(context);
  }
}

class SignUp extends StatelessWidget {
<<<<<<< Updated upstream
=======
  final String userName = "Default";
  final bool isMan = true;

>>>>>>> Stashed changes
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
              SizedBox(
                height: 416,
              ),
              Container(
                width: 290,
                height: 53,
                child: OutlinedButton(
                  onPressed: () {
<<<<<<< Updated upstream
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TaxiHistory()) );
=======
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateGroup()));
                    MakeToast(msg: userName + " " + isMan.toString() + "Send!");
>>>>>>> Stashed changes
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: colorDarkGray,
                    side: BorderSide(color: colorDarkGray, width: 1.4),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
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
