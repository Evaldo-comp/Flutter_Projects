import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Entrada de dados')),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "digite um valor"),
              style: TextStyle(fontSize: 25, color: Colors.green),

              // onChanged: (String e) {
              //   print("Valor digitado " + e);
              // },
              onSubmitted: (String b){
                //print("Valor digitado " + b);
              },
              controller: _textEditingController,
            ),
      ),
      ElevatedButton(
        onPressed: (){
                 // ignore: avoid_print
                 print("Valor digitado ${_textEditingController.text}");
        }, 
        child: Text("Salvar"))
        
        ],
      ),
    );
  }
}
