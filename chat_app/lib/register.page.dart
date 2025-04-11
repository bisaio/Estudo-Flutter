import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.text_fields),
                border: OutlineInputBorder(),
                hintText: "Nome",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
                hintText: "E-mail",
              ),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                hintText: "Senha",
              ),
            ),
            ElevatedButton(
              child: Text('Registrar'),
              onPressed:
                  () =>
                      Navigator.of(context)
                        ..pop()
                        ..pushReplacementNamed(
                          '/chat',
                        ), //desta maneira permite chamar o pop e o push na mesma linha (esta tirando a tela da pilha e colocando a proxima)
              //antes, se fisse o caminho de login --> registro --> chat, mantinha o login na pilha de telas, desta maneira nao mantem mais
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
