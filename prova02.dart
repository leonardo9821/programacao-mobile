import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(TheJogoApp());
}

class TheJogoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Jogo',
      home: TheJogo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TheJogo extends StatefulWidget {
  @override
  _TheJogoState createState() => _TheJogoState();
}

class _TheJogoState extends State<TheJogo> {
  String mensagem = 'Encontre o tesouro escondido!';
  List<String> botoes = List.generate(20, (index) => '${index + 1}');
  List<bool> desabilitado = List.generate(20, (index) => false);
  int tesouro = -1;
  int bomba = -1;
  int monstro = -1;
  int tentativas = 0;

  void iniciarNovoJogo() {
    final random = Random();
    Set<int> sorteio = {};
    while (sorteio.length < 3) {
      sorteio.add(random.nextInt(20));
    }

    final numeros = sorteio.toList();
    tesouro = numeros[0];
    bomba = numeros[1];
    monstro = numeros[2];
    tentativas = 0;

    setState(() {
      mensagem = 'Encontre o tesouro escondido!';
      botoes = List.generate(20, (index) => '${index + 1}');
      desabilitado = List.generate(20, (index) => false);
    });
  }

  void verificarEscolha(int index) {
    setState(() {
      tentativas++;

      if (index == tesouro) {
        mensagem = '🎉 Você encontrou o tesouro em $tentativas tentativa(s)!';
        botoes[index] = '🏆';
      } else if (index == bomba) {
        mensagem = '💥 Você encontrou a bomba! Fim de jogo.';
        botoes[index] = '💣';
      } else if (index == monstro) {
        mensagem = '👾 O monstro te pegou! Fim de jogo.';
        botoes[index] = '👾';
      } else {
        mensagem = (index < tesouro)
            ? '❗ O tesouro está em um número **MAIOR**.'
            : '❗ O tesouro está em um número **MENOR**.';
        botoes[index] = '❌';
      }

      desabilitado[index] = true;

      if (index == tesouro || index == bomba || index == monstro) {
        for (int i = 0; i < desabilitado.length; i++) {
          desabilitado[i] = true;
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    iniciarNovoJogo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('The Jogo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 4,
              color: Colors.amber[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  mensagem,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tentativas: $tentativas',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(20, (index) {
                  return ElevatedButton(
                    onPressed: desabilitado[index]
                        ? null
                        : () => verificarEscolha(index),
                    child: Text(
                      botoes[index],
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: iniciarNovoJogo,
              icon: Icon(Icons.refresh),
              label: Text('Novo Jogo'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Boa sorte, aventureiro! 🗺️',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
