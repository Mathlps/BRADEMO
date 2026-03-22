import 'package:flutter/material.dart';

class Exercicio4 extends StatelessWidget {
  const Exercicio4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Exemplo de Imagens")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Imagem maior
              FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  'https://picsum.photos/300/200',
                  width: 300,
                  height: 200,
                ),
              ),

              // Espaço entre as imagens
              const SizedBox(height: 20),

              // Imagem menor
              FittedBox(
                fit: BoxFit.contain,
                child: Image.network(
                  'https://picsum.photos/150/100',
                  width: 150,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
