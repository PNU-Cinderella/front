import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Components/Classes.dart';
import 'package:project_cinderella_test3/msp/Components/functions.dart';
import 'package:project_cinderella_test3/msp/Http/HttpHelper.dart';
import 'package:project_cinderella_test3/msp/viewstyle.dart';

class BlockBlockUserNameSearch extends StatefulWidget
{
  Function(String) func;

  BlockBlockUserNameSearch({required this.func});

  @override
  State<BlockBlockUserNameSearch> createState() => _BlockBlockUserNameSearchState();
}

class _BlockBlockUserNameSearchState extends State<BlockBlockUserNameSearch> {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: RealLTRB(left: 16, top: 21, right: 0, bottom: 0, context: context),
      child: TextField(
        onSubmitted: (text){
          widget.func;
        },
        style: SimpleTextStyle(size: 20, weight: FontWeight.w600),
        decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder()
        ),
      ),
    );
  }
}


class BlockUserBox extends StatelessWidget
{
  double myWidth = 393;
  double myHeight = 87;
  Widget userImage = Image.asset("assets/images/Mypage/image_default_myimage.png");
  String userName = "기본";

  BlockUserBox({image, name}){
    userName = name ?? "기본값";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: GetRealWidth(pixel: myWidth, context: context),
      height: GetRealHeight(pixel: myHeight, context: context),
      child: Row(
        children: [
          Container(
            width: GetRealWidth(pixel: 48, context: context),
            height: GetRealHeight(pixel: 48, context: context),
            margin: RealLTRB(left: 33, top: 13, right: 0, bottom: 0, context: context),
            child: userImage,
          ),
          Container(
            margin: RealLTRB(left: 28, top: 26, right: 0, bottom: 0, context: context),
            width: GetRealWidth(pixel: 120, context: context),
            height: GetRealHeight(pixel: 22, context: context),
            child: Text(userName, style: SimpleTextStyle(size: 22, weight: FontWeight.w500),)
          ),
          Container(
            margin: RealLTRB(left: 37, top: 25, right: 0, bottom: 0, context: context),
            width: GetRealWidth(pixel: 95, context: context),
            height: GetRealHeight(pixel: 33, context: context),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13)),
                backgroundColor: Color(0xff113B6D),
              ),
              onPressed: (){print("hi!");},
              child: Text("차단해제", style: SimpleTextStyle(size: 19, weight: FontWeight.w500, color: Color(0xffF6F5F5)),),
            ),
          )
        ],
      ),
    );
  }
}

class BlockListPage extends StatefulWidget
{
  @override
  State<BlockListPage> createState() => _BlockListPageState();
}

class _BlockListPageState extends State<BlockListPage> {

  String userEmail = 'default@default.com';

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
                alignment: Alignment.topLeft,
                height: GetRealHeight(pixel: 70, context: context),
                child: Container(
                    margin: RealLTRB(left: 20, top: 33, right: 0, bottom: 0, context: context),
                    child: Text("차단목록", style: SimpleTextStyle(size: 22, weight: FontWeight.w700))
                ),
              ),
              BlockUserBox(),
              BlockUserBox(),
              BlockUserBox(),
              // BlockBlockUserNameSearch(func: (val) => setState(() {
              //   userEmail = val.toString();
              //   print(userEmail);
              //       }
              //   )
              // ),
          Container(
            margin: RealLTRB(left: 16, top: 21, right: 0, bottom: 0, context: context),
            child: TextField(
              onSubmitted: (text){
                userEmail = text;
                print(userEmail);
              },
              style: SimpleTextStyle(size: 20, weight: FontWeight.w600),
              decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder()
              ),
            ),
          ),
              BasicButton(width: 100, height: 50,text: '차단', func: (){
                print(userEmail);
                RequestHttpPut(
                    dataSet : {'blockEmail' : userEmail },
                    URL: URL_USER_BLOCK,
                    func: (){
                });
                },
              ),
              BasicButton(width: 100, height: 50,text: '차단해제', func: (){
                print(userEmail);
                RequestHttpDelete(
                    dataSet : {'blockEmail' : userEmail },
                    URL: URL_USER_UNBLOCK,
                    func: (){
                });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}