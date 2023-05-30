import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
<<<<<<< Updated upstream
import 'package:project_cinderella_test3/msp/sign_up.dart';

Container MakeContainer(double? myWidth, double? myHeight)
{
=======
import 'package:webview_flutter/webview_flutter.dart';

const SIZE_FIGMA_WIDTH = 393;
const SIZE_FIGMA_HEIGHT = 852;

//For PlaceHolding
Container MakeContainer(double? myWidth, double? myHeight) {
>>>>>>> Stashed changes
  return Container(
    width: myWidth,
    height: myHeight,
    color: Colors.lightGreen,
  );
}

<<<<<<< Updated upstream
class MyContainer extends StatelessWidget
{
  double? myWidth;
  double? myHeight;
  MyContainer(double? width, double? height)
  {
    this.myWidth = width;
    this.myHeight = height;
  }
=======
//Return Real Width from Figma's Widget width
double GetRealWidth({
  required double pixel,
  required BuildContext context,
}) {
  double PX = MediaQuery.of(context).size.width / 393;
  return pixel * PX;
}

//Return Real Height from Figma's Widget height
double GetRealHeight({
  required double pixel,
  required BuildContext context,
}) {
  double PX = MediaQuery.of(context).size.height / 852;
  // print(pixel* PX);
  return pixel * PX;
}

//Return Status Bar Height
double GetStatusBarHeight({required BuildContext context}) {
  return MediaQuery.of(context).viewPadding.top;
}

TextStyle SimpleTextStyle(
    {required double size,
    Color color = colorBlack,
    String family = 'Pretendard',
    FontWeight weight = FontWeight.w400}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontFamily: family,
    fontWeight: weight,
    letterSpacing: -0.4,
  );
}

void MakeToast({required String msg}) {
  Fluttertoast.showToast(msg: msg);
}

/// Flutter code sample for [ToggleButtons].

const List<Widget> fruits = <Widget>[
  Text('Apple'),
  Text('Banana'),
  Text('Orange')
];

const List<Widget> vegetables = <Widget>[
  Text('Tomatoes'),
  Text('Potatoes'),
  Text('Carrots')
];

const List<Widget> icons = <Widget>[
  Icon(Icons.sunny),
  Icon(Icons.cloud),
  Icon(Icons.ac_unit),
];

void main() => runApp(const ToggleButtonsExampleApp());

class ToggleButtonsExampleApp extends StatelessWidget {
  const ToggleButtonsExampleApp({super.key});
>>>>>>> Stashed changes

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: myWidth,
        height: myHeight,
        color: Colors.blue,
      ),
    );
  }
}

class TaxiHistoryBox extends MyContainer
{

  double? myWidth;
  double? myHeight;

  TaxiHistoryBox(double? width, double? height):super(0,0){
    this.myWidth = width;
    this.myHeight = height;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        width: myWidth,
        height: myHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.greenAccent,
        ),
        child: new Text("I'm HistoryBox!"),
      ),
    );
  }

}


class Functions extends StatelessWidget {
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
              SizedBox(height: 100,),
              MakeContainer(120, 50),
              SizedBox(height: 50,),
              MyContainer(120, 50),
              SizedBox(height: 50,),
              TaxiHistoryBox(120, 50),
            ],
          ),
        ),
      ),
    );
  }
}
<<<<<<< Updated upstream
=======

final notifications = FlutterLocalNotificationsPlugin();

//1. 앱로드시 실행할 기본설정
initNotification() async {
  //안드로이드용 아이콘파일 이름
  var androidSetting = AndroidInitializationSettings('@mipmap/ic_launcher');

  //ios에서 앱 로드시 유저에게 권한요청하려면
  var iosSetting = IOSInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings =
      InitializationSettings(android: androidSetting, iOS: iosSetting);
  await notifications.initialize(
    initializationSettings,
    //알림 누를때 함수실행하고 싶으면
    //onSelectNotification: 함수명추가
  );

  print("Init Notification!");
  showNotification();
}

//2. 이 함수 원하는 곳에서 실행하면 알림 뜸
showNotification() async {
  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 채널 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );

  var iosDetails = IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
  );

  // 알림 id, 제목, 내용 맘대로 채우기
  notifications.show(1, 'test', 'hihi',
      NotificationDetails(android: androidDetails, iOS: iosDetails));
  print("Show NOtification!");
}
>>>>>>> Stashed changes
