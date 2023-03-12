import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_chatgpt/core/custom_exceptions.dart';
import 'package:flutter_chatgpt/features/chat/data/model/chat_model.dart';
import 'package:flutter_chatgpt/features/chat/domain/usecases/chat_usecase.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatUseCase chatUseCase;

  ChatCubit({required this.chatUseCase}) : super(ChatInitial());


  Future<void> Chat({required String query}) async {
    emit(ChatLoading());
    try {
      final ChatModelData = await chatUseCase.call(query);
      emit(ChatLoaded(ChatModelData: ChatModelData));
    } on SocketException catch (e) {
      emit(ChatFailure(errorMsg: e.message));
    } on ServerException catch (e) {
      emit(ChatFailure(errorMsg: e.message));
    }
  }
}
