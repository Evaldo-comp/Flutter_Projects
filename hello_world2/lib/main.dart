import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

// StatelessWidget não muda estado
// StatefulWidget muda o estado
class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  String texto = 'Confirmar';

  void alterarTexto() {
    setState(() {
      if (texto == 'Confirmar') {
        texto = 'Botão apertado';
      } else {
        texto = "Confirmar";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Meu app')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(texto, 
          style: TextStyle(   
                  fontSize: 30, 
                  color: Colors.blue
                )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: alterarTexto, 
                child: Text('aperte-me')
              )
            ],
          ),
        ),
      )
    );
  }
}
