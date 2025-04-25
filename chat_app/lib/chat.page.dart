import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  final txtMessage = TextEditingController();

  Future<void> sendMessage() async {
    var data = {
      'message': txtMessage.text,
      'user': _auth.currentUser!.displayName,
      'uid': _auth.currentUser!.uid,
      'timestamp': FieldValue.serverTimestamp(),
    };

    await _db.collection('messages').add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView(
              children: [
                ListTile(
                  leading: CircleAvatar(),
                  title: Text("Fulano"),
                  subtitle: Text("Mensagem..."),
                  trailing: Text("10/4"),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 80,
            color: Colors.grey[200],
            child: Row(
              spacing: 10,
              children: [
                Expanded(child: TextField(controller: txtMessage)),
                IconButton(onPressed: sendMessage, icon: Icon(Icons.send)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
