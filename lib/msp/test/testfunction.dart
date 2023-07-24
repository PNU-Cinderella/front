import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';
import 'package:project_cinderella_test3/msp/sign_up.dart';

Container MakeContainer(double? myWidth, double? myHeight)
{
  return Container(
    width: myWidth,
    height: myHeight,
    color: Colors.lightGreen,
  );
}

class MyContainer extends StatelessWidget
{
  double? myWidth;
  double? myHeight;
  MyContainer(double? width, double? height)
  {
    this.myWidth = width;
    this.myHeight = height;
  }

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

class ModalTest extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MODAL'),
      ),
      body: SizedBox( //버튼 크기 조절을 위해 삽입
        width: 100.0,
        height: 100.0,
        child: TextButton(
            child: Text('press this button'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.yellow, //배경색
              primary: Colors.red, // foreground
            ),
            onPressed: (){}
        ),
      ),
    );
  }

}


class SnackTest extends StatelessWidget {
  Widget build(BuildContext context) { //여기 있는 context 가져옴
    return Scaffold(
      appBar: AppBar(
        title: Text('snack bar'),
      ),
      body: SizedBox( //버튼 크기 조절을 위해 삽입
        width: 100.0,
        height: 100.0,
        child: TextButton(
            child: Text('press this button'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.yellow, //배경색
              primary: Colors.red, // foreground
            ),
            onPressed: (){ //버튼을 눌렀을때
              ScaffoldMessenger.of(context).showSnackBar(
                //SnackBar 구현하는법 context는 위에 BuildContext에 있는 객체를 그대로 가져오면 됨.
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    margin: EdgeInsets.only(bottom: 700),
                    content: Text('Like a new Snack bar!'), //snack bar의 내용. icon, button같은것도 가능하다.
                    duration: Duration(seconds: 5), //올라와있는 시간
                    action: SnackBarAction( //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
                      label: '확인', //버튼이름
                      onPressed: (){}, //버튼 눌렀을때.
                    ),
                  )
              );
            }
        ),
      ),
    );
  }
}




