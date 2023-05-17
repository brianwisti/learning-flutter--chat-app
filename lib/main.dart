import 'package:chat_app/chat_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.blue, foregroundColor: Colors.black)),
        title: 'Flutter Chat App',
        home: LoginPage(),
        routes: {
          '/chat': (context) => ChatPage(),
        });
  }
}