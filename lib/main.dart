import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:project_cinderella_test3/MainPage.dart';

// import 'Test4.dart';
import 'package:project_cinderella_test3/TaxiList.dart';
import 'package:project_cinderella_test3/TaxiList/CreateGroup.dart';
// import 'TaxiList.dart';
// import 'package:project_cinderella_test3/TaxiList/IntoList.dart';

// import 'package:project_cinderella_test3/Login%20copy.dart';
// import 'package:project_cinderella_test3/Login.dart';
// import 'Test4.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "project_cinderella_test3",
      theme: ThemeData(fontFamily: 'Pretendard'),
      themeMode: ThemeMode.system,
      home: CreateGroup(),
    ),
  );
}

// class roomMember {
//   final String host;
//   final String start;
//   final String dest;
//   final int time;
//   final int num_of_people;

//   roomMember(
//       {required this.host,
//       required this.start,
//       required this.dest,
//       required this.time,
//       required this.num_of_people});

//   factory roomMember.fromJson(Map<String, dynamic> json) {
//     return roomMember(
//       host: json['host'],
//       start: json['start'],
//       dest: json['dest'],
//       time: json['dest'],
//       num_of_people: json['dest'],
//     );
//   }
// }

// class tsts extends StatelessWidget {
//   var res;
//   Future calljson() async {
//     String jsonString = await rootBundle.loadString('assets/jsonTest.json');
//     List<dynamic> jsonList = jsonDecode(jsonString);
//     return jsonList;
//   }

//   tsts({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: TextButton(
//               onPressed: () async {
//                 res = await calljson();
//                 print(res.runtimeType);
//                 print(res);
//               },
//               child: Text("${res}"))),
//     );
//   }
// }
