import 'package:flutter/material.dart';
import 'Sucesso.dart';
import 'Botao.dart';

class Tela extends StatefulWidget {
  const Tela({super.key});

  @override
  State<Tela> createState() => _Tela1State();
}

class _Tela1State extends State<Tela> {

  bool _showPass = false;
  final String nome = "StrayBee";

  final String pass = "BeeBee";

  final controllerNome = TextEditingController();

  final controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: const Color.fromARGB(255, 195, 178, 228),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(
                "https://cdn-icons-png.flaticon.com/512/5087/5087579.png"),
          ),
          Text(
            "Ingrese seu Usuario",
            style: TextStyle(fontSize: 25),
          ),
          TextField(
            controller: controllerNome,
            decoration: InputDecoration(labelText: "Nome"),
          ),
          Text(
            "Ingrese sua Senha",
            style: TextStyle(fontSize: 25),
          ),
          TextField(
            controller: controllerSenha,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.deepPurple,),
              hintText: 'Senha',
              hintStyle: TextStyle( color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: GestureDetector(
                child: Icon(_showPass == false ? Icons.visibility_off : Icons.visibility, color: Colors.black,),
                onTap: (){
                  setState(() {
                    _showPass = !_showPass;
                  });
                },
               ), //labelText: "Senha",
            ),
            obscureText: _showPass == false ? true : false,
          ),
          Botao("Login", () {
            String enteredNome = controllerNome.text;

            String enteredSenha = controllerSenha.text;

            if (enteredNome == nome && enteredSenha == pass) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Sucesso(nomeUsuario: enteredNome);
              }));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Usuário ou senha incorretos!"),
                  backgroundColor: const Color.fromARGB(255, 144, 211, 231),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
