import 'dart:convert';

import '../base_model/base_response_model.dart';

//For model creation
//https://app.quicktype.io

class UserPostResponseModel extends BaseResponseModel {
  UserPostResponseModel(List<Posts>? posts,
      {APIStatus apiStatus = APIStatus.idle, String? message})
      : super(apiStatus, message) {
    _posts = posts;
  }

  List<Posts>? _posts;

  List<Posts>? get posts => _posts;

  UserPostResponseModel.fromJson(List<Map<String, dynamic>> data,
      {APIStatus apiStatus = APIStatus.idle, String? message})
      : super(apiStatus, message) {
    _posts = List<Posts>.from(data.map((x) => Posts.fromJson(x))) ?? [];
  }
}

class Posts {
  Posts({
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

  Posts.fromJson(dynamic json) {
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

// Methods to create list of list of home from json string and vise-versa

List<Posts> PostFromJson(String str) =>
    List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String PostToJson(List<Posts> data) =>
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
