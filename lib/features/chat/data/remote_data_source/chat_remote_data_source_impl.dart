import 'dart:convert';

import 'package:flutter_chatgpt/core/custom_exceptions.dart';
import 'package:flutter_chatgpt/core/open_ai_data.dart';
import 'package:flutter_chatgpt/features/global/provider/provider.dart';
import 'package:flutter_chatgpt/features/chat/data/model/chat_model.dart';
import 'package:flutter_chatgpt/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:http/http.dart' as http;

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final http.Client httpClient;

  ChatRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<ChatModel> getChat(String query) async {
    final String _endPoint = "chat/completions";

    Map rowParams = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {"role": "system", "content": query},
      ]
    };

    final encodedParams = json.encode(rowParams);
    final response = await httpClient.post(
      Uri.parse(endPoint(_endPoint)),
      body: encodedParams,
      headers: headerBearerOption(OPEN_AI_KEY),
    );

    if (response.statusCode == 200) {
      return ChatModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(message: "Chat Server Exception");
    }
  }
}
