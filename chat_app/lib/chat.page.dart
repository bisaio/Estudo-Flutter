import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatPage extends StatelessWidget {
  ChatPage() {
    timeago.setLocaleMessages('pt_br', timeago.PtBrMessages());
  }

  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  final txtMessage = TextEditingController();

  Future<void> sendMessage() async {
    var data = {
      'message': txtMessage.text,
      'user': _auth.currentUser!.displayName,
      'uid': _auth.currentUser!.uid,
      'timestamp': FieldValue.serverTimestamp(),
      'status': 'created'
    };

    await _db.collection('messages').add(data);

    txtMessage.text = '';
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
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream:
                  _db
                      .collection('messages')
                      .where('status', isNotEqualTo: 'deleted')
                      .orderBy('timestamp', descending: true)
                      .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return Text("Carregando...");

                return ListView(
                  reverse: true,
                  children:
                      snapshot.data!.docs
                          .map(
                            (doc) => Dismissible(
                              // confirmDismiss: (_) async {
                              //   if (_auth.currentUser!.uid == doc['uid']) return true;
                              //   return false;
                              // },
                              background: Container(
                                color: Colors.red,
                                child: Icon(Icons.delete_outline_outlined, color: Colors.white, ),
                              ),
                              key: Key(doc.id),
                              // onDismissed: (_) => doc.reference.delete(),
                              onDismissed: (_) => doc.reference.update({'status':'deleted'}),
                              child: ListTile(
                                leading: CircleAvatar(),
                                title: Text(doc['user']),
                                subtitle: Text(doc['message']),
                                trailing: Text(
                                  timeago.format(
                                    doc['timestamp'].toDate(),
                                    locale: 'pt_br',
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                );
              },
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
