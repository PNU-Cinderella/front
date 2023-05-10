import 'dart:convert';

////////// 리스트를 받아오는 과정입니다 /////////////
// Future calljson() async {
//   String jsonString = await rootBundle.loadString('assets/jsonTest.json');
//   List<dynamic> jsonList = jsonDecode(jsonString);
//   return jsonList;
// }

// class roomList {
//   List<Photo> parsePhotos(String responseBody) {
//     // 수신 데이터를 JSON 포맷(JSON Array)으로 디코딩
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

//     // JSON Array를 List<Photo>로 변환하여 반환
//     return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
//   }

//   final List roomLists;

//   roomList({
//     required this.roomLists,
//   });

//   factory roomList.fromJson(List<dynamic> parsedJson) {
//     List<roomMember> roomMembers = []; // 여기 이해가 안댕 ㅋㅋ
//     roomMembers = parsedJson.map((i) => roomMember.fromJson(i)).toList();

//     return roomLists(roomMembers: roomMembers);
//   }
// }

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

// class roomMembers {
//   String? host;
//   String? start;
//   String? dest;
//   int? time;
//   int? numOfPeople;

//   roomMembers({this.host, this.start, this.dest, this.time, this.numOfPeople});

//   roomMembers.fromJson(Map<String, dynamic> json) {
//     host = json['host'];
//     start = json['start'];
//     dest = json['dest'];
//     time = json['time'];
//     numOfPeople = json['num_of_people'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['host'] = this.host;
//     data['start'] = this.start;
//     data['dest'] = this.dest;
//     data['time'] = this.time;
//     data['num_of_people'] = this.numOfPeople;
//     return data;
//   }
// }
