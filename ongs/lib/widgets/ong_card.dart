import 'package:flutter/material.dart';
import '../model/ong.dart';

class OngCard extends StatelessWidget {
  final Ong ong;
  final VoidCallback onTap;

  const OngCard({super.key, required this.ong, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Image.asset(ong.imagem, width: 50, height: 50),
        title: Text(ong.nome),
        subtitle: Text(ong.cidade),
        onTap: onTap,
      ),
    );
  }
}
