import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("assets/images/padrao.png");
  var _imagem = "Escolha uma opçaõ abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numeroAleatorio = Random().nextInt(3);
    var escolhaApp = opcoes[numeroAleatorio];

    print('Opcão selecionada: $escolhaApp');
    print('Opcão selecionada: $escolhaUsuario');

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("assets/images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("assets/images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("assets/images/tesoura.png");
        });
        break;
    }

// Validação do Ganhador

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel")) {
      setState(() {
        this._imagem = 'Parabéns!! Você Ganhou :)';
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel")) {
      setState(() {
        this._imagem = 'Você Perdeu :(';
      });
    } else {
      setState(() {
        this._imagem = 'Empatamos ;)';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, //texto "escolha do app" centralizado
        children: <Widget>[
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            // ignore: prefer_const_constructors
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Image(
            image: this._imagemApp,
          ),

          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            // ignore: prefer_const_constructors
            child: Text(
              this._imagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset("assets/images/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset("assets/images/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                child: Image.asset("assets/images/tesoura.png", height: 100),
              ),
              /*
              ,
              Image.asset("assets/images/pedra.png", height: 100),
              Image.asset("assets/images/tesoura.png", height: 100),
              */
            ],
          )
        ],
      ),
    );
  }
}
