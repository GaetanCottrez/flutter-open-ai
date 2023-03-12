import 'package:flutter_chatgpt/features/chat/data/model/chat_model.dart';

abstract class ChatRemoteDataSource {


  Future<ChatModel> getChat(String query);
}
