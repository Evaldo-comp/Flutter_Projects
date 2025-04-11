import 'package:flutter/material.dart';
import '../data/ongs_data.dart';
import '../widgets/ong_card.dart';
import 'package:ongs/screens/ong_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ONGs Ambientais'),
      ),
      body: ListView.builder(
        itemCount: ongs.length,
        itemBuilder: (context, index) {
          final ong = ongs[index];
          return OngCard(
            ong: ong,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OngDetailPage(ong: ong),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
