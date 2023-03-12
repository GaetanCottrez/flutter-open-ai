part of 'chat_cubit.dart';

abstract class ChatState extends Equatable {
  const ChatState();
}

class ChatInitial extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoading extends ChatState {
  @override
  List<Object> get props => [];
}

class ChatLoaded extends ChatState {
  final ChatModel ChatModelData;

  ChatLoaded({required this.ChatModelData});

  @override
  List<Object> get props => [];
}

class ChatFailure extends ChatState {
  final String? errorMsg;

  ChatFailure({this.errorMsg});

  @override
  List<Object> get props => [];
}
