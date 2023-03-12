import 'package:flutter_chatgpt/features/chat/data/model/chat_model.dart';

abstract class ChatRepository {


  Future<ChatModel> getChat(String query);
}
