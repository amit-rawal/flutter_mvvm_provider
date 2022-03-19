// To parse this JSON data, do
// final users = usersFromJson(jsonString);

import 'dart:convert';

class Users {
  Users({
    required this.name,
    required this.city,
  });

  String name;
  String city;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        name: json["name"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "city": city,
      };
}

List<Users> userlistFromJson(List<dynamic> json) {
  return json == null
      ? []
      : json.map((value) => Users.fromJson(value)).toList();
}

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/*

url - https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8
json to dart model from - https://app.quicktype.io

[
  {
    "name": "Harry Potter",
    "city": "London"
  },
  {
    "name": "Don Quixote",
    "city": "Madrid"
  },
  {
    "name": "Joan of Arc",
    "city": "Paris"
  },
  {
    "name": "Rosa Park",
    "city": "Alabama"
  }
]
 */
