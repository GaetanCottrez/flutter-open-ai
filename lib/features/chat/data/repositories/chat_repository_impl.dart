import 'package:flutter_chatgpt/features/chat/data/model/chat_model.dart';
import 'package:flutter_chatgpt/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:flutter_chatgpt/features/chat/domain/repositories/chat_repository.dart';

class ChatRepositoryImpl implements ChatRepository {

  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ChatModel> getChat(String query) async =>
      remoteDataSource.getChat(query);

}
