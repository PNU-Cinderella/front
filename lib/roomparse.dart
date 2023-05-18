import 'dart:convert';

////////// 리스트를 받아오는 과정입니다 /////////////
//////// 여기 밑은 리스트 안입니다.////////
class roomMember {
  final String host;
  final String start;
  final String dest;
  final int time;
  final int num_of_people;

  roomMember(
      {required this.host,
      required this.start,
      required this.dest,
      required this.time,
      required this.num_of_people});

  factory roomMember.fromJson(Map<String, dynamic> json) {
    return roomMember(
      host: json['host'],
      start: json['start'],
      dest: json['dest'],
      time: json['time'],
      num_of_people: json['num_of_people'],
    );
  }
}
// 정산 상태
// 일자