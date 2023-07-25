import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/Root/Classes.dart';
import 'package:project_cinderella_test3/msp/Root/functions.dart';
import 'package:url_launcher/url_launcher.dart';

const myTestUrl = 'http://10.0.2.2:8080/chatroom/1';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "test",
      home: TestUrl()
    ),
  );
  initNotification();
}

class TestUrl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Container(
            width: 200,
            height: 200,
            child:
            Container(
              width: 290,
              height: 53,
              child: OutlinedButton(
                onPressed: () {
                  showNotification();
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  side: BorderSide(color: Colors.blue, width: 1.4),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Text("TEST"),
              ),
            )
          ),
    )
      )
    );
  }
}
