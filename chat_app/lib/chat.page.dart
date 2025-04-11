import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
          )
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
                )
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
                Expanded(child: TextField(),),
                Icon(Icons.send),
              ],
            ),
          )
        ],
      ),
    );
  }
}