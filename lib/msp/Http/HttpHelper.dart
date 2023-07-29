import 'dart:convert';
import 'package:project_cinderella_test3/msp/login.dart';
import 'package:http/http.dart' as http;

const String URL_USER_BLOCK = 'http://10.0.2.2:8080/addblocklist';
const String URL_USER_UNBLOCK = 'http://10.0.2.2:8080/removeblocklist';
const String URL_CHECK_PARTICIPATE = 'http://10.0.2.2:8080/isparticipate';

//url은 "/addblocklist"
//리퀘스트는 put방식
//"blockEmail"을 json형태로 보내고싶어
void RequestHttpPut({required Map dataSet, required String URL, required void Function() func})
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
void RequestHttpDelete({required Map dataSet, required String URL, required void Function() func})
async {
  Map data = dataSet;
  final response = await http.delete(
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
void RequestHttpGet({required String URL, required void Function() func})
async {
  final response = await http.get(
    Uri.parse(URL),
    headers: {
      'Content-Type': 'application/json',
      'Cookie' : cookieRecieved,
    },
  );
  print(response.statusCode);
  func;
}
Future<bool> CheckUserParticipate({required String URL})
async {
  final response = await http.get(
    Uri.parse(URL),
    headers: {
      'Content-Type': 'application/json',
      'Cookie' : cookieRecieved,
    },
  );
  print(response.statusCode);

  if (response.statusCode == 200) return true;
  return false;
}