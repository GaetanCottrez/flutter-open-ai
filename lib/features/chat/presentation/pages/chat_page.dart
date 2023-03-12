import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chatgpt/features/global/search_text_field/search_text_field_widget.dart';
import 'package:flutter_chatgpt/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:share_plus/share_plus.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    _searchTextController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat Page"),
      ),
      body: Center(
        child: Column(children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, ChatState) {
                if (ChatState is ChatLoading) {
                  return Center(
                    child: Container(
                        width: 300,
                        height: 300,
                        child: Image.asset("assets/loading.gif")),
                  );
                }
                if (ChatState is ChatLoaded) {
                  final message = ChatState.ChatModelData.message;

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Share.share(message.content);
                                  },
                                  child: Icon(Icons.share, size: 35)),
                              InkWell(
                                  onTap: () {
                                    Clipboard.setData(
                                        ClipboardData(text: message.content));
                                  },
                                  child: Icon(
                                    Icons.copy,
                                    size: 35,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            message.content,
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Center(
                    child: Text(
                      "OpenAI Chat",
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ));
              },
            ),
          ),
          SearchTextFieldWidget(
              textEditingController: _searchTextController,
              onTap: () {
                BlocProvider.of<ChatCubit>(context)
                    .Chat(query: _searchTextController.text)
                    .then((value) => _clearTextField());
              }),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }

  void _clearTextField() {
    setState(() {
      _searchTextController.clear();
    });
  }
}
