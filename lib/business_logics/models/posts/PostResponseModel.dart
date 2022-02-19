import 'dart:convert';

//For model creation
//https://app.quicktype.io

class Post {
  Post({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    _userId = userId;
    _id = id;
    _title = title;
    _body = body;
  }

  Post.fromJson(dynamic json) {
    _userId = json['userId'];
    _id = json['id'];
    _title = json['title'];
    _body = json['body'];
  }

  int? _userId;
  int? _id;
  String? _title;
  String? _body;

  int? get userId => _userId;
  int? get id => _id;
  String? get title => _title;
  String? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['id'] = _id;
    map['title'] = _title;
    map['body'] = _body;
    return map;
  }
}

// Methods to create list of list of posts from json string and vise-versa

List<Post> PostFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String PostToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//Respose from server  -
//https://jsonplaceholder.typicode.com

/*
[
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },
  {
    "userId": 1,
    "id": 2,
    "title": "qui est esse",
    "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
  }
]
 */
