import 'package:flutter/material.dart';
import '../model/ong.dart';

class OngDetailPage extends StatelessWidget {
  final Ong ong;

  const OngDetailPage({super.key, required this.ong});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ong.nome)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(ong.imagem, width: 100),
            const SizedBox(height: 26),
            Text(
              ong.descricao,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text('Cidade: ${ong.cidade}'),
            const SizedBox(height: 10),
            Text('Contato:'),
            Text('Site: ${ong.contato['site']}'),
            Text('Email: ${ong.contato['email']}'),
            Text('Instagram: ${ong.contato['instagram']}'),
          ],
        ),
      ),
    );
  }
}
