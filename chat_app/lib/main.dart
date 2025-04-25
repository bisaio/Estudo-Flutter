import 'package:flutter/material.dart';
import 'package:chat_app/chat.app.dart';
import 'package:firebase_core/firebase_core.dart';

const firebaseConfig = FirebaseOptions(
  apiKey: "AIzaSyANQnmI7rMoy5zlGLeqx32y0sxh3wUqWes",
  authDomain: "chat-8bff6.firebaseapp.com",
  projectId: "chat-8bff6",
  storageBucket: "chat-8bff6.firebasestorage.app",
  messagingSenderId: "191020992171",
  appId: "1:191020992171:web:582a7498a7a974f3e099ee",
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // garante que primeiro carregara os widgets e depois o firebase
  await Firebase.initializeApp(options: firebaseConfig); //pega as configurações passadas no config e conecta no firebase
  runApp(ChatApp());
}
