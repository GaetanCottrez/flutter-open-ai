import 'dart:convert' show utf8;
import 'package:logger/logger.dart';

String utf8convert(String text) {
  List<int> bytes = text
      .toString()
      .codeUnits;
  return utf8.decode(bytes);
}

class ChatData {
  final String role;
  final String content;

  ChatData({required this.role, required this.content});

  factory ChatData.fromJson(Map<String, dynamic> json) {
    return ChatData(
      role: json['role'],
      content: utf8convert(json['content']),
    );
  }
}
