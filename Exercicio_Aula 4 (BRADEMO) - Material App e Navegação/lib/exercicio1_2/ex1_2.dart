import 'package:flutter/material.dart';
import 'quadrado_widget.dart';

class Ex1_2 extends StatelessWidget {
  const Ex1_2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              QuadradoWidget(
                tamanho:100
              ),
              SizedBox(width: 20
              ),
              QuadradoWidget(
                tamanho: 100,
                cor: Colors.red,
              ),
              SizedBox(width: 20
              ),
            ],
          ),
        ),
      ),
    );
  }
}
