import 'package:flutter/material.dart';

import 'package:chat_app/login.page.dart';
import 'package:chat_app/register.page.dart';
import 'package:chat_app/chat.page.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/chat": (context) => ChatPage(),
      },
      initialRoute: "/login",
    );
  }
}
