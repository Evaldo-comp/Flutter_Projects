import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Lista de perguntas e respostas
  final List<Map<String, dynamic>> perguntas = [
    {
      'pergunta': 'Qual é a capital do Brasil?',
      'opcoes': ['São Paulo', 'Brasília', 'Rio de Janeiro'],
      'respostaCorreta': 'Brasília',
    },
    // {
    //   'pergunta': 'Quem criou o Flutter?',
    //   'opcoes': ['Google', 'Apple', 'Microsoft'],
    //   'respostaCorreta': 'Google',
    // },
    // {
    //   'pergunta': 'Qual linguagem é usada no Flutter?',
    //   'opcoes': ['Java', 'Kotlin', 'Dart'],
    //   'respostaCorreta': 'Dart',
    // },
  ];

  int perguntaAtual = 0;
  int pontos = 0;
  String? mensagem; // Feedback positivo ou negativo
  bool quizFinalizado = false;

  void verificarResposta(String respostaEscolhida) {
    String respostaCorreta = perguntas[perguntaAtual]['respostaCorreta'];

    setState(() {
      if (respostaEscolhida == respostaCorreta) {
        pontos++;
        mensagem = 'Resposta certa! +1 ponto';
      } else {
        mensagem = 'Resposta errada!';
      }
    });

    // Espera 2 segundos e passa para a próxima pergunta
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        mensagem = null;
        if (perguntaAtual < perguntas.length - 1) {
          perguntaAtual++;
        } else {
          quizFinalizado = true;
        }
      });
    });
  }

  void reiniciarQuiz() {
    setState(() {
      perguntaAtual = 0;
      pontos = 0;
      quizFinalizado = false;
      mensagem = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz Flutter'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: quizFinalizado
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Parabéns! Você terminou o quiz!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Sua pontuação: $pontos/${perguntas.length}',
                      style: TextStyle(fontSize: 22, color: Colors.amber),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: reiniciarQuiz,
                      child: Text('Recomeçar'),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://flutter.dev/assets/flutter-logo-sharing.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 20),
                    Text(
                      perguntas[perguntaAtual]['pergunta'],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    ...perguntas[perguntaAtual]['opcoes'].map<Widget>((opcao) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ElevatedButton(
                          onPressed: mensagem == null ? () => verificarResposta(opcao) : null,
                          child: Text(opcao),
                        ),
                      );
                    }).toList(),
                    SizedBox(height: 20),
                    if (mensagem != null)
                      Text(
                        mensagem!,
                        style: TextStyle(fontSize: 20, color: Colors.amberAccent),
                      ),
                    SizedBox(height: 20),
                    Text(
                      'Pontuação: $pontos',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
