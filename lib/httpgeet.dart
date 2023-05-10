// import 'dart:async';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// Future<Post> fetchPost() async {
//   final response =
//       await http.get('https://jsonplaceholder.typicode.com/posts/1'); // 여기수정

//   if (response.statusCode == 200) {
//     print('성공입니다~');
//     // 만약 서버로의 요청이 성공하면, JSON을 파싱합니다.
//     return Post.fromJson(json.decode(response.body));
//   } else {
//     // 만약 요청이 실패하면, 에러를 던집니다.
//     throw Exception('Failed to load post');
//   }
// }

// class Post {
//   final int message;
//   // final int id;
//   // final String title;
//   // final String body;

//   // Post({this.userId, this.id, this.title, this.body});
//   Post({required this.message});

//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       message: json['message'],
//       // id: json['id'],
//       // title: json['title'],
//       // body: json['body'],
//     );
//   }
// }

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: TextButton(
//             onPressed: () {
//               fetchPost();
//             },
//             child: Text('이거눌러용'),
//           ),
//         ),
//       ),
//     );
//   }
// }
