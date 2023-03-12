import 'package:flutter_chatgpt/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:flutter_chatgpt/features/chat/data/remote_data_source/chat_remote_data_source_impl.dart';
import 'package:flutter_chatgpt/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:flutter_chatgpt/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_chatgpt/features/chat/domain/usecases/chat_usecase.dart';
import 'package:flutter_chatgpt/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter_chatgpt/injection_container.dart';

Future<void> ChatInjectionContainer() async {
  //Futures bloc
  sl.registerFactory<ChatCubit>(
        () =>
        ChatCubit(
          chatUseCase: sl.call(),
        ),
  );

  //UseCase
  sl.registerLazySingleton<ChatUseCase>(() =>
      ChatUseCase(
        repository: sl.call(),
      ));
  //repository
  sl.registerLazySingleton<ChatRepository>(
          () =>
          ChatRepositoryImpl(
            remoteDataSource: sl.call(),
          ));
  //remote data
  sl.registerLazySingleton<ChatRemoteDataSource>(
          () =>
          ChatRemoteDataSourceImpl(
            httpClient: sl.call(),
          ));
}
