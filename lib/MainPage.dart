import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';

var buttonBackgroundColor = const Color.fromRGBO(217, 217, 217, 0.2);
// var myBackgroundColor = const Color(0xff000D2F);
var myBackgroundColor = Color.fromARGB(15, 255, 255, 255);

var Vector = SvgPicture.asset(
  'assets/images/vector.svg',
  semanticsLabel: 'vector',
  width: 13.75,
  height: 14.7,
);

var buttonGoogleLogin = Container(
  width: 249,
  height: 53,
  child: OutlinedButton(
    onPressed: () {},
    child: const Text(
      "구글로 로그인",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
    style: OutlinedButton.styleFrom(
      backgroundColor: buttonBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
    ),
  ),
);

var buttonAppleLogin = Container(
  width: 293,
  height: 381,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(45),
    color: buttonBackgroundColor,
    // boxShadow: BoxShadow(),
  ),
);

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        color: myBackgroundColor,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(23, 0, 0, 0),
              child: Vector,
            ),
            SizedBox(
              height: 134.3,
            ),
            Center(
              child: buttonGoogleLogin,
            ),
            Text('displaySize : ${MediaQuery.of(context).size}'),
            Text('displayHeight : ${MediaQuery.of(context).size.height}'),
            Text('displayWidth : ${MediaQuery.of(context).size.width}'),
            Text(
                'devicePixelRatio : ${MediaQuery.of(context).devicePixelRatio}'),
            Text('statusBarHeight : ${MediaQuery.of(context).padding.top}'),
          ],
        ),
      )),
    );
  }
}
