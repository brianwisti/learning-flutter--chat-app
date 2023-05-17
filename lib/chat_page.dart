import 'dart:convert';

import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/chat_bubble.dart';
import 'widgets/chat_input.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    final response =
    await rootBundle.loadString("resources/mock_messages.json");
    final List<dynamic> decodedList = jsonDecode(response) as List;
    final List<ChatMessageEntity> chatMessages = decodedList
        .map((messageData) => ChatMessageEntity.fromJson(messageData))
        .toList();

    setState(() {
      _messages = chatMessages;
    });
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }

  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
              print('logout');
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                      alignment: _messages[index].author.userName == 'poojab26'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      entity: _messages[index],
                    );
                  })),
          ChatInput(onSubmit: onMessageSent),
        ],
      ),
    );
  }
}