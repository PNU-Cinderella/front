import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:http/http.dart' as http;

const String URL_USER_BLOCK = 'http://10.0.2.2:8080/addblocklist';
const String URL_USER_UNBLOCK = 'http://10.0.2.2:8080/removeblocklist';

//url은 "/addblocklist"
//리퀘스트는 put방식
//"blockEmail"을 json형태로 보내고싶어
void RequestHttpPut({required BuildContext context, required Map dataSet, required String URL, required void Function() func})
async {
  Map data = dataSet;
  final response = await http.put(
    Uri.parse(URL),
    headers: {
      'Content-Type': 'application/json',
      'Cookie' : cookieRecieved,
    },
    body: json.encode(data),
  );
  print(response.statusCode);
  func;
}