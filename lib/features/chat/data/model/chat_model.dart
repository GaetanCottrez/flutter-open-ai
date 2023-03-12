import 'package:flutter_chatgpt/features/chat/data/model/chat_data.dart';

class ChatModel {
  final ChatData message;

  ChatModel({required this.message});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    final chatItems = json['choices'] as List;
    chatItems.retainWhere((choice) {
      return choice['message']['role'] == "assistant";
    });

    ChatData message = ChatData.fromJson(chatItems[0]['message']);

    return ChatModel(message: message);
  }
}
