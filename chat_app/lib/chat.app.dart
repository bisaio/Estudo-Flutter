import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/login.page.dart';
import 'package:chat_app/register.page.dart';
import 'package:chat_app/chat.page.dart';

class ChatApp extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/chat": (context) => ChatPage(),
      },
      initialRoute: _auth.currentUser == null ? "/login" : "chat",
    );
  }
}
