import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();
  final txtName = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _register(BuildContext context) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: txtEmail.text, 
          password: txtPassword.text
        );

      await credential.user!.updateDisplayName(txtName.text);

      Navigator.of(context)..pop()..pushReplacementNamed("/chat");
    }
    on FirebaseAuthException catch(ex) {
      final snackBar = SnackBar(content: Text(ex.message!));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.text_fields),
                border: OutlineInputBorder(),
                hintText: "Nome",
              ),
            ),
            TextField(
              controller: txtEmail,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                hintText: "E-mail",
              ),
            ),
            TextField(
              controller: txtPassword,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                hintText: "Senha",
              ),
            ),
            ElevatedButton(
              child: Text('Registrar'),
              onPressed: () => _register(context),
            ),
            TextButton(
              child: Text('Fazer login'),
              onPressed:
                  () =>
                      Navigator.of(context)
                        ..pop()
                        ..pushReplacementNamed('/login'),
            ),
          ],
        ),
      ),
    );
  }
}
