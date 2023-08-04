import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Components/Classes.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';


List<BoxFAQ> list = List.generate(2, (index) => BoxFAQ(header: list[index].header, body: list[index].body));

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

class BoxFAQ
{
  String header;
  bool expanded = false;
  String body;

  BoxFAQ({required this.header, required this.body}) {}
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
                height: GetRealHeight(pixel: 70, context: context),
                child: Row(
                  children: [
                    Container(
                      padding: RealLTRB(left: 10, top: 30, right: 0, bottom: 0, context: context),
                        child: Button_Back()
                    ),
                    Container(
                        margin: RealLTRB(left: 110, top: 33, right: 0, bottom: 0, context: context),
                        child: Text("고객문의", style: SimpleTextStyle(size: 22, weight: FontWeight.w700))
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("FAQ", style: SimpleTextStyle(size: 17, weight: FontWeight.w400))
                ),
              ),
              Container(
                height: GetRealHeight(pixel: 500, context: context),
                  child: MyStatefulWidget()
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

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

/// MyStatefulWidget은 stateful widget으로 하위위젯을 감쌉니다.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// MyStatefulWidget의 개인 상태 클래스입니다.
/// SingleChildScrollView로 ExpansionPanelList를 감쌉니다.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  final List<Item> _data = [
    Item(expandedValue: "확인 페이지 내에 상단 참여 중 박스 오른쪽 위 버튼을 클릭하시면 확인할 수 있어요.", headerValue: "오픈채팅방 링크는 어디서 다시 볼 수 있나요?\n"),
    Item(expandedValue: "확인 페이지 내에 상단 참여 중 박스 왼쪽 아래 버튼을 클릭하시면 나갈 수 있어요.", headerValue: "참여중인 택시팟에서 나가고 싶어요\n")];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  /// ExpansionPanelList
  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(

          /// ExpansionPanel은 header와 body로 구성되어 있습니다.
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Container(
                  height: GetRealHeight(pixel: 20, context: context),
                  child: Text(item.headerValue, style: SimpleTextStyle(size: 17, weight: FontWeight.w400))
              ),
            );
          },
          body: ListTile(
              title: Container(
                height: GetRealHeight(pixel: 80, context: context),
                  child: Text(item.expandedValue, style: SimpleTextStyle(size: 15, weight: FontWeight.w400))),
              ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}