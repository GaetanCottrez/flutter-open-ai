import 'package:flutter_chatgpt/features/chat/data/model/chat_model.dart';
import 'package:flutter_chatgpt/features/chat/domain/repositories/chat_repository.dart';

class ChatUseCase {
  final ChatRepository repository;

  ChatUseCase({required this.repository});


  Future<ChatModel> call(String query) async {
    return repository.getChat(query);
  }
}
