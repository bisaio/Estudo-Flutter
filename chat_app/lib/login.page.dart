import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //acesso aos textfields
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance; //singleton

  Future<void> _login(BuildContext context) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text,
      );

      Navigator.pushReplacementNamed(context, "/chat");
    } on FirebaseAuthException catch (ex) {
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
            SizedBox(width: 150, height: 80, child: Placeholder()),
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
              child: Text("Login"),
              onPressed: () => _login(context),
            ),
            TextButton(
              child: Text("Criar conta"),
              onPressed: () => Navigator.pushNamed(context, '/register'),
            ),
          ],
        ),
      ),
    );
  }
}
