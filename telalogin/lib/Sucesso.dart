import 'package:flutter/material.dart';
import 'Botao.dart';

class Sucesso extends StatelessWidget {
  final String nomeUsuario;

  const Sucesso({super.key, required this.nomeUsuario});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sucesso",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Correcto"),
          backgroundColor: const Color.fromARGB(255, 195, 178, 228),
        ),
        body: Column(
          children: [
            Text("Seja bem-vindo(a), $nomeUsuario!"),

          ],
        ),
      ),
    );
  }
}
