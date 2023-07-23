import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Classes.dart';
import 'package:project_cinderella_test3/msp/functions.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';

class FAQExpansionBlock extends StatefulWidget
{

  double? width;
  double? height;

  @override
  State<FAQExpansionBlock> createState() => _FAQExpansionBlockState();
}

class _FAQExpansionBlockState extends State<FAQExpansionBlock> {

  bool _isExpanded = false;

  Container childBlock()
  {
    return Container(

    );
  }


  void _ExpandControl()
  {
    setState(() {
      if(_isExpanded)
        {

        }
      else
        {

        }
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}



class PageCustomerFAQ extends StatefulWidget
{

  @override
  State<PageCustomerFAQ> createState() => _PageCustomerFAQState();
}

class _PageCustomerFAQState extends State<PageCustomerFAQ> {
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
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("고객문의", style: SimpleTextStyle(size: 22, weight: FontWeight.w700))
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("FAQ", style: SimpleTextStyle(size: 17, weight: FontWeight.w400))
                ),
              ),              Container(
                alignment: Alignment.topLeft,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("오픈채팅방 링크는 어디서 다시 볼 수 있나요?\n"
                        "확인 페이지 내에 상단 참여 중 박스 오른쪽 위 버튼을 클릭하시면 확인할 수 있어요.", style: SimpleTextStyle(size: 17, weight: FontWeight.w400))
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: GetRealHeight(pixel: 200, context: context),
                child: Container(
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("참여중인 택시팟에서 나가고 싶어요\n"
                        "확인 페이지 내에 상단 참여 중 박스 왼쪽 아래 버튼을 클릭하시면 나갈 수 있어요.", style: SimpleTextStyle(size: 17, weight: FontWeight.w400)),
                )
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(

                    child: Text("문의 051-0000-0000", style: SimpleTextStyle(size: 17.5, weight: FontWeight.w400, color: Color(0xFF333333)))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}