import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_input.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  ChatBubble fromMe(message) {
    return ChatBubble(alignment: Alignment.centerRight, message: message);
  }

  ChatBubble fromThem(message) {
    return ChatBubble(alignment: Alignment.centerLeft, message: message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Hi USER'),
          actions: [
            IconButton(
                onPressed: () {
                  print('Logout pressed');
                },
                icon: Icon(Icons.logout))
          ]),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return index % 2 == 0
                      ? fromThem("Hello, this is Pooja!")
                      : fromMe("Oh hey!");
                }),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
