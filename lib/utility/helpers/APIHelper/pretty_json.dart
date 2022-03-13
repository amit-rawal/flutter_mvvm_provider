import 'dart:convert';

import 'package:flutter/cupertino.dart';

///Helps printing formatted server response
String prettyJson(dynamic json, {int indent = 2}) {
  var spaces = ' ' * indent;
  var encoder = JsonEncoder.withIndent(spaces);
  return encoder.convert(json);
}

void prettyJsonPrint(dynamic json, {int indent = 2}) {
  debugPrint(prettyJson(json, indent: indent));
}
