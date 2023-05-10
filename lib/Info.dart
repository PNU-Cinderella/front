class Post {
  final int message;
  // final int id;
  // final String title;
  // final String body;

  // Post({this.userId, this.id, this.title, this.body});
  Post({required this.message});

  // ignore: empty_constructor_bodies
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      message: json['message'],
      // id: json['id'],
      // title: json['title'],
      // body: json['body'],
    );
  }
}
