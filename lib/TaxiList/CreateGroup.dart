import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    double PX = MediaQuery.of(context).size.width / 393; // 요게 픽셀값
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF5F5F5),
        child: Padding(
          padding: EdgeInsets.only(top: statusBarHeight),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20 * PX, top: 25 * PX),
                          child: Text(
                            "택시팟 생성",
                            style: TextStyle(
                              fontSize: 25 * PX,
                              fontFamily: "Pretendard",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: 24.75 * PX,
                            top: 18.75 * PX,
                            left: 355.75 * PX,
                          ),
                          child: GestureDetector(
                            onTap: () {},
                            child: Image(
                              width: 12.5 * PX,
                              height: 12.5 * PX,
                              image: AssetImage(
                                  "assets/images/CreateGroup/Vector-47.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
