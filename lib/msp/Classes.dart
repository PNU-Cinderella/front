import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class BasicButton extends StatelessWidget
{
  BuildContext? myContext;
  double? myWidth;
  double? myHeight;
  void Function()? funcOnPressed;
  ButtonStyle? myButtonStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      side: BorderSide(color: Colors.black, width: 1.4)
  );
  Widget? myIcon;
  Widget? myText;

  BasicButton({BuildContext? context, double? width, double? height, void Function()? func, ButtonStyle? style, Widget? icon, Widget? text}){
    myContext = context;
    myWidth = width;
    myHeight = height;
    funcOnPressed = func;
    myButtonStyle = style;
    myIcon = icon;
    myText = text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: myWidth,
      height: myHeight,
      child: OutlinedButton.icon(
        onPressed: funcOnPressed,
        style: myButtonStyle,
        icon: myIcon!,
        label: myText!,
      ),
    );
  }
}

class BasicTitle extends StatelessWidget
{
  double? myWidth;
  double? myHeight;
  double? paddingLeft;
  double? paddingTop;
  double? paddingRight;
  double? paddingBottom;
  TextStyle? myTextStyle;
  String? myTitle;

  BasicTitle({required double? width, required double? height,
  double? left=0,double? top=0,double? right=0,double? bottom=0,
  required TextStyle? textStyle, required String? title})
  {
    width = myWidth;
    height = myHeight;
    paddingLeft = left;
    paddingTop = top;
    paddingRight = right;
    paddingBottom = bottom;
    myTextStyle = textStyle;
    myTitle = title;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
      paddingLeft!, paddingTop!, paddingRight!, paddingBottom!),
      child: Container(
        width: myWidth,
        height: myHeight,
        child :
        Row(
          children: [
            Text(myTitle!, style:myTextStyle),
          ],
        ),
      )
    );
  }
  
}

class BasicStatefulBox extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class BasicCircle extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(Rect.fromLTRB(0, 0, size.width, size.height),
        Paint()
          ..color.blue
          ..strokeWidth = 2
          ..style = PaintingStyle.fill
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
  
}

//Taxi_History Page Classes

class SimpleSizedBox extends StatelessWidget
{
  double? myWidth;
  double? myHeight;

  SimpleSizedBox({required double width, required double height})
  {
    myWidth = width;
    myHeight = height;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: GetRealWidth(pixel: myWidth!, context: context),
      height: GetRealHeight(pixel: myHeight!, context: context),
    );
  }
  
}

class SimpleCheckbox extends StatefulWidget {
  const SimpleCheckbox({super.key});

  @override
  State<SimpleCheckbox> createState() => _SimpleCheckboxState();
}

class _SimpleCheckboxState extends State<SimpleCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}

class SimpleSwitch extends StatefulWidget {
  const SimpleSwitch({super.key});

  @override
  State<SimpleSwitch> createState() => _SimpleSwitchState();
}

class _SimpleSwitchState extends State<SimpleSwitch> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.blue,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

// class MyTextField extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context) {
// return
//   Stack(
//     children:
//     [
//       Padding(
//         padding: EdgeInsets.only(left: GetRealWidth()),
//         child: Form(
//         key: _formKey,
//         child: TextFormField(
//         focusNode: textFocus,
//         controller: TextEditingController(),
//         onChanged: (val) {
//           },
//         validator: (value) {
//         // 나중에 여따가 email정규식 끼워넣기
//         if (value!.isEmpty) {
//         return "출발지를 정해주세요.";
//         }
//         return "";
//         },
//       style: TextStyle(fontSize: 22, color: Colors.black),
//       decoration: InputDecoration(
//       errorStyle: TextStyle(color: Colors.black),
//       focusedErrorBorder: UnderlineInputBorder(
//       borderSide: BorderSide(
//         color: Colors.orange,
//         width: 2,
//       )
//     ),
//     hintText: "입력하세요",
//     hintStyle: TextStyle(
//     color: Color.fromRGBO(60, 60, 67, 0.6),
//     fontFamily: "Pretendard",
//     fontWeight: FontWeight.w400,
//     //     color: Colors.blueAccent,
//     fontSize: 17 * PX,
//     ),
//     //   border: OutlineInputBorder(
//     //       borderSide: BorderSide.none),
//     ),
//     ),
//     ),
//     ),
//     Padding(
//     padding: EdgeInsets.only(left: 345 * PX, top: 17 * PX),
//     child: GestureDetector(
//     onTap: () {
//     setState(() {
//     user.start = "";
//     });
//     },
//     child: Image(
//     image: AssetImage(
//     "assets/images/CreateGroup/CreategroupXmark.png"),
//     ),
//     ),
//     ),
//     ],
//   });
// }

